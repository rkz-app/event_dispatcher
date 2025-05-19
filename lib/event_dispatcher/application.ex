defmodule EventDispatcher.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Cluster.Supervisor,
       [Application.get_env(:libcluster, :topologies), [name: EventDispatcher.ClusterSupervisor]]},

      {Phoenix.PubSub, name: EventDispatcher.PubSub},

      EventDispatcherWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: EventDispatcher.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
