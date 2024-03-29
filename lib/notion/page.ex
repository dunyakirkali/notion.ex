defmodule Notion.Page do
  @moduledoc """
  Page
  """

  use Tesla

  def create_page(client, page), do: post(client, "/pages", page)

  def retrieve_page(client, id, query \\ []), do: get(client, "/pages/" <> id, query: query)

  def update_page_properties(client, id, query), do: patch(client, "/pages/" <> id, query)

  alias Notion.{Property}

  @derive Jason.Encoder

  @enforce_keys [:object]
  defstruct object: "page",
            id: nil,
            created_time: nil,
            last_edited_time: nil,
            parent: %{},
            properties: %{},
            database: nil,
            archived: nil

  @type t() :: %__MODULE__{
          object: String.t(),
          id: String.t(),
          created_time: String.t(),
          last_edited_time: String.t(),
          parent: map(),
          properties: %{String.t() => Property.t()},
          database: String.t() | nil,
          archived: boolean()
        }
end
