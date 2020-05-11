defmodule AmazonProductAdvertisingClient.SearchItems do
  @moduledoc """
  The [SearchItems](https://webservices.amazon.com/paapi5/documentation/search-items.html) operation
  """

  alias __MODULE__
  alias AmazonProductAdvertisingClient.Config

  defstruct "Operation": "SearchItems",
    "Path": "/paapi5/searchitems",
    "Target": "com.amazon.paapi5.v1.ProductAdvertisingAPIv1.SearchItems",
    "PartnerTag": Application.get_env(:amazon_product_advertising_client, :associate_tag),
    "Marketplace": Application.get_env(:amazon_product_advertising_client, :marketplace) || "www.amazon.com",
    "PartnerType": "Associates",
    "Condition": "New",
    "Resources": nil,
    "Keywords": nil,
    "SearchIndex": nil

  @doc """
  Execute a SearchItems operation
  """
  def execute(search_params \\ %SearchItems{}, config \\ %Config{}) do
    AmazonProductAdvertisingClient.call_api search_params, config
  end
end
