import Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# Binding to loopback ipv4 address prevents access from other machines.
# Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
config :event_dispatcher, EventDispatcherWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "ywY2bc02rjRggsDkniD5+QxNrZaqcDN9Gsd7O53qwXB75yqPGoGszkHfUuMvfWLJ"

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
