defmodule AmazonProductAdvertisingClient.BrowseNodeLookup do
  @moduledoc """
  The [ItemSearch](http://docs.aws.amazon.com/AWSECommerceService/latest/DG/ItemSearch.html) operation
  """

  alias __MODULE__
  alias AmazonProductAdvertisingClient.Config

  defstruct "BrowseNodeId": nil,
      "Operation": "BrowseNodeLookup",
      "ResponseGroup": nil

  @doc """
  Execute an BrowseNodeLookup operation
  """
  def execute(search_params \\ %BrowseNodeLookup{}, config \\ %Config{}) do
    AmazonProductAdvertisingClient.call_api search_params, config
  end
end
