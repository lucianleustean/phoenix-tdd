use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tdd_app, TddAppWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :tdd_app, TddApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "tdd_app_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :phoenix_integration,
  endpoint: TddAppWeb.Endpoint
