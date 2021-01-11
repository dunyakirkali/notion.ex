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
  defstruct object: "page",
            id: nil,
            parent: %{},
            properties: %{},
            database: nil,
            archived: nil

  @type t() :: %__MODULE__{
          object: String.t(),
          id: String.t(),
          parent: map(),
          properties: %{String.t() => Property.t()},
          database: String.t() | nil,
          archived: boolean()
        }
end
