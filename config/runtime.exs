# config/runtime.exs
import Config

cluster_enabled = System.get_env("LIBCLUSTER_ENABLED", "false") == "true"

# === PubSub configuration (Redis when cluster off, PG2 when on) ===
if cluster_enabled do
  # Distributed PubSub that depends on an Erlang cluster
  config :event_dispatcher, EventDispatcher.PubSub,
    adapter: Phoenix.PubSub.PG2
else
  # Stateless PubSub through Redis
  redis_url = System.get_env("REDIS_URL", "redis://localhost:6379/0")

  config :event_dispatcher, EventDispatcher.PubSub,
    adapter: Phoenix.PubSub.Redis,
    url: redis_url
end
# === end PubSub configuration ===

# === libcluster topology (only active when clustering is enabled) ===
topologies =
  if cluster_enabled do
    System.fetch_env!("ERL_COOKIE") # only required in clustered mode
    [
      swarm: [
        strategy: Cluster.Strategy.Gossip
      ]
    ]
  else
    []
  end

config :libcluster, topologies: topologies
# === end libcluster topology ===



if config_env() == :prod do
  # Erlang cookie (must be the same on every node)

  # Phoenix endpoint
  host = System.get_env("PHX_HOST", "0.0.0.0")
  port = String.to_integer(System.get_env("PORT", "4000"))

  config :event_dispatcher, EventDispatcherWeb.Endpoint,
    url: [host: host],
    http: [ip: {0,0,0,0}, port: port],
    secret_key_base: System.fetch_env!("SECRET_KEY_BASE"),
    pubsub_server: EventDispatcher.PubSub,
    server: true,
    check_origin: false

end

if config_env() == :dev do
  config :libcluster, topologies: []
end
