defmodule AmazonProductAdvertisingClient.Mixfile do
  use Mix.Project

  def project do
    [app: :amazon_product_advertising_client,
      version: "0.2.3",
      elixir: "~> 1.7",
      description: "An Amazon Product Advertising API client for Elixir",
      package: package(),
      deps: deps()]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:tesla, "~> 1.3"},
      {:hackney, "~> 1.16"},
      {:castore, "~> 0.1.7"},
      {:poison, ">= 1.0.0"}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Grantimus9/elixir-amazon-product-advertising-client"},
      maintainers: ["Grant Nelson <grantmnelsn+oss@gmail.com>"],
      source_url: "https://github.com/Grantimus9/elixir-amazon-product-advertising-client"
    ]
  end
end
