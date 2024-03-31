import Config

config :megin,
  ecto_repos: [Megin.Repo]

config :megin, Megin.Repo,
  database: "megin_repo",
  username: "postgres",
  password: "root",
  hostname: "localhost"
