defmodule Healthz.MixProject do
  use Mix.Project

  @source_url "https://github.com/mpran/healthz"
  @version_file Path.join(__DIR__, ".version")
  @external_resource @version_file
  @version (case Regex.run(~r/^v([\d\.]+)/, File.read!(@version_file),
                   capture: :all_but_first
                 ) do
              [version] -> version
              nil -> "0.0.0"
            end)

  def project do
    [
      app: :healthz,
      version: @version,
      elixir: "~> 1.3",
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      docs: docs(),
      description: description(),
      package: package(),
      preferred_cli_env: [
        bless: :test
      ],
      bless_suite: [
        compile: ["--warnings-as-errors", "--force"],
        "chaps.html": ["--raise"],
        format: ["--check-formatted"],
        credo: [],
        "deps.unlock": ["--check-unused"]
      ],
      test_coverage: [tool: Chaps]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]

  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bless, ">= 0.0.0", only: :test},
      {:chaps, ">= 0.0.0", only: :test},
      {:credo, ">= 0.0.0", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:plug, ">= 0.0.0"}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      extras: ["README.md", "CHANGELOG.md": [title: "Changelog"]]
    ]
  end

  defp description() do
    "A lightweight plug to respond to some health checker pings"
  end

  defp package() do
    [
      maintainers: ["mpran"],
      name: "healthz",
      files:
        ~w(lib .formatter.exs mix.exs README.md .version LICENSE CHANGELOG.md),
      licenses: ["MIT"],
      links: %{
        "ChangeLog" => "#{@source_url}/blob/main/CHANGELOG.md",
        "GitHub" => "#{@source_url}"
      }
    ]
  end
end
