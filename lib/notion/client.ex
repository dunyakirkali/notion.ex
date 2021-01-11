defmodule Notion.Client do
  @moduledoc false

  def new() do
    middleware = [
      {Tesla.Middleware.BaseUrl, "https://api.notion.com/v1"},
      {Tesla.Middleware.Timeout, timeout: 10_000},
      {Tesla.Middleware.Headers,
       [
         {"Authorization", "Bearer #{Application.fetch_env!(:notion, :api_key)}"}
       ]},
      {Tesla.Middleware.JSON, engine_opts: [keys: :atoms]}
    ]

    Tesla.client(middleware)
  end
end
