Amazon Product Advertising Client
================================

On March 9th 2020, Amazon deprecated Product Advertising Version 4 and required all clients migrate to Product Advertising API 5. Accordingly, any version of this library < 0.3.0 will fail and you should upgrade immediately.

## Configure
Add your AWS authentication credentials to `config/config.exs`:

Hex: https://hex.pm/packages/amazon_product_advertising_client

```elixir

  # in your mix.exs
  {:amazon_product_advertising_client, "~> 0.3.0"}

```

```elixir

# in your config/config.exs
config :amazon_product_advertising_client,
  associate_tag: "YourAssociateTag",
  access_key_id: "YourAccessKeyID",
  access_secret_key: "YourSecretAccessKey",
  host: "webservices.amazon.ca" # optional, default is webservices.amazon.com
  region: "us-east-1" # optional, default is "us-east-1"

```
[Host and Region Options](https://webservices.amazon.com/paapi5/documentation/common-request-parameters.html)

## Usage and Examples

Both of the functions return an %HTTPoison.Response{} struct. This Amazon API responds with XML, so you will most likely want
to parse the body using a library such as SweetXml.

### Search
Create a search params struct and execute the search, for example:

```elixir

alias AmazonProductAdvertisingClient.ItemSearch

def search_for_item do
  %ItemSearch{"MaximumPrice": "25", "Keywords": "long sleeve shirt"} |> ItemSearch.execute
end

```

### Lookup
```elixir

alias AmazonProductAdvertisingClient.ItemLookup

# e.g. an ISBN of 9781680502992
def lookup_book_by_isbn(isbn) do
  %ItemLookup{
      IdType: "ISBN",
      ItemId: isbn,
      SearchIndex: "Books"}
  |> ItemLookup.execute()
end

```

### Lookup and Parse Response
```elixir

# Modules needed.
alias AmazonProductAdvertisingClient.ItemLookup
import SweetXml

# Returns a map with 'title' and 'detail_page_url' keys
def lookup_book_info(isbn) do
  lookup_struct =
    %ItemLookup{
      IdType: "ISBN",
      ItemId: isbn,
      SearchIndex: "Books"}

  case ItemLookup.execute(lookup_struct) do
    {:ok, %HTTPoison.Response{body: body}} ->
      body |> parse_xml_body()
  end

end

# The XML response from Amazon is voluminous. There are many fields to retrieve,
# for this example we pull the book's title and Amazon URL.
def parse_xml_body(body) do
  body
  |> SweetXml.xmap(
    title: ~x"//ItemLookupResponse/Items/Item/ItemAttributes/Title/text()",
    detail_page_url: ~x"//ItemLookupResponse/Items/Item/DetailPageURL/text()",
    )
end

```
