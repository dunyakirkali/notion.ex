defmodule Notion do
  use Tesla

  alias Notion.User

  plug(Tesla.Middleware.BaseUrl, "https://api.notion.com/v1")
  plug(Tesla.Middleware.BasicAuth, username: "user", password: "pass")
  plug(Tesla.Middleware.JSON, engine_opts: [keys: :atoms])

  def retrieve_user(user_id) do
    get("/users/" <> user_id)
  end

  def list_users() do
    get("/users")
  end

  def retrieve_page(page_id) do
    get("/pages/" <> page_id)
  end

  def delete_page(page_id) do
    delete("/pages/" <> page_id)
  end
end
