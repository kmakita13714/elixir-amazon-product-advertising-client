defmodule AmazonProductAdvertisingClient.GetItems do
  @moduledoc """
  The [GetItems](https://webservices.amazon.com/paapi5/documentation/get-items.html) operation
  """

  alias __MODULE__
  alias AmazonProductAdvertisingClient.Config

  defstruct "Operation": "GetItems",
    "Condition": nil,
    "CurrencyOfPreference": nil,
    "ItemIdType": nil,
    "ItemIds": [],
    "LanguagesOfPreference": nil,
    "Marketplace": nil,
    "Merchant": nil,
    "OfferCount": nil,
    "Resources": nil

  @doc """
  Execute a GetItems operation
  """
  def execute(search_params \\ %GetItems{}, config \\ %Config{}) do
    AmazonProductAdvertisingClient.call_api search_params, config
  end
end
