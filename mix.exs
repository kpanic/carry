defmodule Carry.MixProject do
  use Mix.Project

  def project do
    [
      app: :carry,
      version: "0.1.0",
      elixir: "~> 1.7",
      description: description(),
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end

  defp description() do
    """
    Carry, a dead simple package that converts a map %{"hello" => "world"} to an Elixir struct
    """
  end

  defp package() do
    [
      files: [
        "config",
        "lib",
        "LICENSE",
        "mix.exs",
        "README.md"
      ],
      maintainers: ["Marco Milanesi"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => "https://github.com/kpanic/carry",
        "Contributors" => "https://github.com/kpanic/carry/graphs/contributors",
        "Issues" => "https://github.com/kpanic/carry/issues"
      }
    ]
  end
end
