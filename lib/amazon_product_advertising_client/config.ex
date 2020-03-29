defmodule AmazonProductAdvertisingClient.Config do
  @moduledoc """
  The common configuration used for authorizing and versioning API requests.
  [reference](https://webservices.amazon.com/paapi5/documentation/common-request-parameters.html)
  """

  defstruct "PartnerTag": Application.get_env(:amazon_product_advertising_client, :associate_tag),
    "PartnerType": "Associates",
    "AccessKey": Application.get_env(:amazon_product_advertising_client, :access_key_id),
    "SecretKey": Application.get_env(:amazon_product_advertising_client, :access_secret_key),
    "Service": "ProductAdvertisingAPI",
    "Host": Application.get_env(:amazon_product_advertising_client, :host) || "webservices.amazon.com",
    "Region": Application.get_env(:amazon_product_advertising_client, :region) || "us-east-1",
    "Marketplace": Application.get_env(:amazon_product_advertising_client, :marketplace) || "www.amazon.com"
end
