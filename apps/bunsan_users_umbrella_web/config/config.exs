# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bunsan_users_umbrella_web,
  namespace: BunsanUsersUmbrellaWeb,
  ecto_repos: [BunsanUsersUmbrella.Repo]

# Configures the endpoint
config :bunsan_users_umbrella_web, BunsanUsersUmbrellaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZGKWwX6uKt2x/uteDrNTubmgV6xg9skP6iUEI76eZ5l9M6gusIgrJk51WVLNcNOt",
  render_errors: [view: BunsanUsersUmbrellaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BunsanUsersUmbrellaWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :bunsan_users_umbrella_web, :generators,
  context_app: :bunsan_users_umbrella

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
