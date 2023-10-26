defmodule Notion.MixProject do
  use Mix.Project

  def project do
    [
      app: :notion_ex,
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
      ],
      dialyzer: [plt_add_apps: [:mix]],
      description: description(),
      package: package()
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
      {:tesla, "~> 1.8.0"},
      {:hackney, "~> 1.20.0"},
      {:jason, ">= 1.0.0"},
      {:excoveralls, "~> 0.18.0", only: :test},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:enum_type, "~> 1.1.3"},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
#      {:doctor, "~> 0.17.0", only: :dev},
      {:ex_check, "~> 0.15.0", only: [:dev], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  # Package Information
  defp package do
    [
      files: ["test", "lib", "mix.exs", "README.md", "LICENSE*"],
      maintainers: ["Dunya Kirkali"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/dunyakirkali/notion.ex"}
    ]
  end

  # Package description
  defp description do
    """
    Elixir's Notion API client
    """
  end
end
