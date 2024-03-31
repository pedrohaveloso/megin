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
      {:bandit, "~> 1.0"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
