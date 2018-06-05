use Mix.Config

# Configure your database
config :bunsan_users_umbrella, BunsanUsersUmbrella.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "bunsan_users_umbrella_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
