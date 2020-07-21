defmodule AmazonProductAdvertisingClient.GetBrowseNodes do
  @moduledoc """
  The [GetBrowseNodes](https://webservices.amazon.com/paapi5/documentation/getbrowsenodes.html) operation
  """

  alias __MODULE__
  alias AmazonProductAdvertisingClient.Config

  defstruct "Operation": "GetBrowseNodes",
    "BrowseNodeIds": [],
    "LanguagesOfPreference": nil,
    "Marketplace": nil,
    "Resources": ["BrowseNodes.Ancestor", "BrowseNodes.Children"]

  @doc """
  Execute an GetBrowseNodes operation
  """
  def execute(search_params \\ %GetBrowseNodes{}, config \\ %Config{}) do
    AmazonProductAdvertisingClient.call_api search_params, config
  end
end
