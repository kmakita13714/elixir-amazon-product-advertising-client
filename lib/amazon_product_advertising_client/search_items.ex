defmodule AmazonProductAdvertisingClient.SearchItems do
  @moduledoc """
  The [SearchItems](https://webservices.amazon.com/paapi5/documentation/search-items.html) operation
  """

  alias __MODULE__
  alias AmazonProductAdvertisingClient.Config

  defstruct "Operation": "SearchItems",
    "Actor": nil,
    "Artist": nil,
    "Author": nil,
    "Availability": nil,
    "Brand": nil,
    "BrowseNodeId": nil,
    "Condition": nil,
    "CurrencyOfPreference": nil,
    "DeliveryFlags": nil,
    "ItemCount": 10,
    "ItemPage": 1,
    "Keywords": nil,
    "LanguagesOfPreference": nil,
    "Marketplace": nil,
    "MaxPrice": nil,
    "Merchant": nil,
    "MinPrice": nil,
    "MinReviewsRating": nil,
    "MinSavingPercent": nil,
    "OfferCount": nil,
    "Properties": nil,
    "Resources": nil,
    "SearchIndex": nil,
    "SortBy": nil,
    "Title": nil

  @doc """
  Execute a SearchItems operation
  """
  def execute(search_params \\ %SearchItems{}, config \\ %Config{}) do
    AmazonProductAdvertisingClient.call_api search_params, config
  end
end
