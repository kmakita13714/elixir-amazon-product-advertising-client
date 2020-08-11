defmodule AmazonProductAdvertisingClient do
  @moduledoc """
  An Amazon Product Advertising API client for Elixir
  """
  use Tesla

  adapter Tesla.Adapter.Mint, timeout: 60_000
  plug Tesla.Middleware.JSON, engine: Poison

  alias AmazonProductAdvertisingClient.Config

  @scheme "https"

  @doc """
  Make a call to the API with the specified request parameters.
  """
  def call_api(params, config \\ %Config{}) do
    request_params = Map.from_struct(params)
    request_params = Map.put_new(request_params, :"Path", "/paapi5/" <> String.downcase(Map.get(request_params, :"Operation")))
    request_params = Map.put_new(request_params, :"Target", "com.amazon.paapi5.v1.ProductAdvertisingAPIv1." <> Map.get(request_params, :"Operation"))

    url = @scheme <> "://" <> Map.get(config, :"Host") <> Map.get(request_params, :"Path")
    payload = build_payload_body(request_params, config)
    pre_signed_headers = build_pre_signed_headers(request_params)
    signed_headers_with_auth = add_authorization_headers(url, payload, pre_signed_headers, config)

    case post(url, payload, headers: signed_headers_with_auth) do
      {:ok, response} -> {:ok, response.body}
      {:error, response} -> {:error, response.body}
    end
  end

  # Takes Config as the base and uses request_params
  def build_payload_body(request_params, config = %Config{}) do
    config
    |> Map.merge(request_params) # allow request_params to override base config
    |> Map.drop([:"__struct__", :"Path", :"Host", :"Operation", :"Region", :"AccessKey", :"SecretKey", :"Service", :"Target"]) # Remove some keys we know aren't part of the payload body to Amazon
    |> Poison.encode!()
  end

  # Headers on most requests. Headers are case-sensitive
  # https://webservices.amazon.com/paapi5/documentation/sending-request.html#signing.
  def build_pre_signed_headers(request_params) do
    %{
      "Content-Encoding" => "amz-1.0",
      "Content-Type" => "application/json",
      "X-Amz-Target" => Map.get(request_params, :"Target")
    }
  end

  def add_authorization_headers(url, payload, headers, config = %Config{}) do
    AWSAuth.sign_authorization_header(
      Map.get(config, :"AccessKey"),
      Map.get(config, :"SecretKey"),
      "POST",
      url,
      Map.get(config, :"Region"),
      Map.get(config, :"Service"),
      headers,
      payload
    )
    |> Enum.map(fn({k, v}) ->
      # Capitalize Authorization header (case sensitive.)
      if k == "authorization" do
        {"Authorization", v}
      else
        {k, v}
      end
    end)
  end

end
