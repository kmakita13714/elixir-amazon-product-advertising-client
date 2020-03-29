defmodule AmazonProductAdvertisingClient.GetItems do
  @moduledoc """
  The [GetItems](https://webservices.amazon.com/paapi5/documentation/get-items.html) operation
  """

  alias __MODULE__
  alias AmazonProductAdvertisingClient.Config

  defstruct "Condition": "New",
    "Operation": "GetItems", # com.amazon.paapi5.v1.ProductAdvertisingAPIv1.GetItems
    "Path": "/paapi5/getitems",
    "ItemIdType": "ASIN",
    "IncludeReviewsSummary": nil,
    "ItemIds": nil,
    "LanguagesOfPreference": nil,
    "Marketplace": nil,
    "Merchant": nil,
    "OfferCount": 1,
    "Resources": ["ItemInfo.Title", "Images.Primary.Medium", "ItemInfo.ContentInfo", "ItemInfo.ExternalIds", "ItemInfo.ProductInfo", "Offers.Listings.Price"]

  @doc """
  Execute a GetItems operation
  """
  def execute(search_params \\ %GetItems{}, config \\ %Config{}) do
    AmazonProductAdvertisingClient.call_api search_params, config
  end
end
