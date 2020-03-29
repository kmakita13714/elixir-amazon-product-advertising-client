defmodule AmazonProductAdvertisingClient do
  @moduledoc """
  An Amazon Product Advertising API client for Elixir
  """

  use HTTPoison.Base

  alias AmazonProductAdvertisingClient.Config

  @scheme "https"

  @doc """
  Make a call to the API with the specified request parameters.
  """
  def call_api(request_params, config \\ %Config{}) do
    url = @scheme <> "://" <> Map.get(config, :"Host") <> Map.get(request_params, :"Path")

    pre_signed_headers = build_pre_signed_headers(request_params)

    payload = build_payload_body(request_params, config)

    signed_headers_with_auth = add_authorization_headers(url, payload, pre_signed_headers, config)

    post!(url, payload, signed_headers_with_auth)
  end

  # Takes Config as the base and uses request_params
  def build_payload_body(request_params, config = %Config{}) do
    config
    |> Map.merge(request_params) # allow request_params to override base config
    |> Map.drop([:"__struct__", :"Path", :"Host", :"Operation", :"Region", :"AccessKey", :"SecretKey", :"Service", :"Target"]) # Remove some keys we know aren't part of the payload body to Amazon
    |> Jason.encode!()
  end

  # Headers on most requests.
  def build_pre_signed_headers(request_params) do
    %{
      "x-Amz-Target" => Map.get(request_params, :"Target"),
      "Accept" => "application/json, text/javascript",
      "Content-Type" => "application/json; charset=UTF-8",
      "Content-Encoding" => "amz-1.0"
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
  end

end
