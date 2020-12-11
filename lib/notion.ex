defmodule Notion do
  use Tesla

  plug(Tesla.Middleware.BaseUrl, "https://api.notion.com/v1")

  plug(Tesla.Middleware.Headers, [
    {"Authorization", "Bearer #{Application.fetch_env!(:notion, :api_key)}"}
  ])

  plug(Tesla.Middleware.JSON, engine_opts: [keys: :atoms])

  def retrieve_user(user_id, query \\ []) do
    get("/users/" <> user_id, query: query)
  end

  def list_users(query \\ []) do
    get("/users", query: query)
  end

  def create_page(page) do
    post("/pages", page)
  end

  def retrieve_page(page_id, query \\ []) do
    get("/pages/" <> page_id, query: query)
  end

  def delete_page(page_id) do
    delete("/pages/" <> page_id)
  end

  def retrieve_database(database_id, query \\ []) do
    get("/databases/" <> database_id, query: query)
  end

  def list_databases(query \\ []) do
    get("/databases", query: query)
  end
end
