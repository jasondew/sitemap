defmodule Sitemap.Mixfile do
  use Mix.Project

  @description """
  Generating sitemap.xml
  """

  def project do
   [
     app: :sitemap,
     name: "Sitemap",
     version: "0.7.2",
     elixir: ">= 1.0.0",
     description: @description,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package(),
     deps: deps(),
     source_url: "https://github.com/ikeikeikeike/sitemap"
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:xml_builder], mod: {Sitemap, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:xml_builder, ">= 0.0.0"},
      {:sweet_xml, ">= 0.0.0", only: :test},
      # {:bmark, "~> 1.0"},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},
      {:inch_ex, only: :docs},
    ]
  end

  defp package do
    [ maintainers: ["Tatsuo Ikeda / ikeikeikeike"],
      licenses: ["MIT"],
      links: %{"github" => "https://github.com/ikeikeikeike/sitemap"} ]
  end

end
