defmodule Megin.MixProject do
  use Mix.Project

  def project do
    [
      app: :megin,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Megin.Application, []}
    ]
  end

  defp deps do
    [
      # HTTP server.
      {:bandit, "~> 1.0"},

      # Database.
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},

      # JSON parser.
      {:jason, "~> 1.4"}
    ]
  end
end
