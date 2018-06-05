use Mix.Config

config :bunsan_users_umbrella, ecto_repos: [BunsanUsersUmbrella.Repo]

import_config "#{Mix.env}.exs"
