defmodule Notion.MixProject do
  use Mix.Project

  def project do
    [
      app: :notion,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.4.0"},
      {:hackney, "~> 1.16.0"},
      {:jason, ">= 1.0.0"},
      {:excoveralls, "~> 0.13.3", only: :test},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:enum_type, "~> 1.1.3"}
    ]
  end
end
