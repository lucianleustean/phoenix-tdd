# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tdd_app,
  ecto_repos: [TddApp.Repo]

# Configures the endpoint
config :tdd_app, TddAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "C6cgZu9kv6Rez8eN3YNtQcuNcnS6nYjYGqp2qtg/xoAzpl0js8y1ncSVXcQ5oLvu",
  render_errors: [view: TddAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TddApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
