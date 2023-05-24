import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :user_points_api, UserPointsApi.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "user_points_api_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :user_points_api, UserPointsApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "sj10RZEcmY0WpnS8dpyx1Y7wz/WerHLpmSj3ZiwQz3geW/DvVB0hxZXuvqr3oxDx",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
