defmodule Notion do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.notion.com/v1"
  # plug Tesla.Middleware.Headers, [{"authorization", "api key"}]
  plug Tesla.Middleware.JSON

  def retrieve_user(user_id) do
    get("/users/" <> user_id)
  end

  def list_users() do
    get("/users")
  end
end
