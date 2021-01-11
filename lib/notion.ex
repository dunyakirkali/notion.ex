defmodule Notion do
  @moduledoc """
  Notion
  """

  alias Notion.User

  defdelegate retrieve_user(client, id, query \\ []), to: User, as: :retrieve_user

  defdelegate list_users(client, query \\ []), to: User, as: :list_users

  alias Notion.Page

  defdelegate create_page(client, page), to: Page, as: :create_page

  defdelegate retrieve_page(client, id, query \\ []), to: Page, as: :retrieve_page

  defdelegate update_page_properties(client, id, query \\ []),
    to: Page,
    as: :update_page_properties

  alias Notion.Database

  defdelegate retrieve_database(client, id, query \\ []), to: Database, as: :retrieve_database

  defdelegate query_database(client, id, query \\ []), to: Database, as: :query_database
end
