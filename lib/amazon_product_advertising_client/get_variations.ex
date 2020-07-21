defmodule AmazonProductAdvertisingClient.GetVariations do
  @moduledoc """
  The [GetVariations](http://docs.aws.amazon.com/AWSECommerceService/latest/DG/SimilarityLookup.html) operation


  """

  alias __MODULE__
  alias AmazonProductAdvertisingClient.Config

  defstruct "Operation": "GetVariations",
    "ASIN": "",
    "Condition": nil,
    "CurrencyOfPreference": nil,
    "LanguagesOfPreference": nil,
    "Marketplace": nil,
    "Merchant": nil,
    "OfferCount": nil,
    "Resources": nil,
    "VariationCount": nil,
    "VariationPage": nil

  @doc """
  Execute a GetVariations operation
  """
  def execute(search_params \\ %GetVariations{}, config \\ %Config{}) do
    AmazonProductAdvertisingClient.call_api search_params, config
  end
end
