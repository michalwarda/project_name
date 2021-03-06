use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :project_name, ProjectName.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :project_name, ProjectName.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "project_name_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :comeonin, :bcrypt_log_rounds, 4
