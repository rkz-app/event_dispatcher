import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :event_dispatcher, EventDispatcherWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ly8nF9mZNGmdv2lCRQl4uZoiaoCpGGcnOgbJ3cxm1DKLxC2fxgG+X/+ms0aRRva6",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
