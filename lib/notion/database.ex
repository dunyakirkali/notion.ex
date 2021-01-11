defmodule Notion.Database do
  @moduledoc """
  Database
  """

  use Tesla

  def retrieve_database(client, id, query \\ []),
    do: get(client, "/databases/" <> id, query: query)

  def query_database(client, id, query \\ []),
    do: post(client, "/databases/" <> id <> "/query", query)

  alias Notion.{Property, RichText}

  @enforce_keys [:object]
  defstruct object: "database",
            id: nil,
            title: [],
            properties: %{}

  @type t() :: %__MODULE__{
          object: String.t(),
          id: String.t(),
          title: [RichText.t()],
          properties: %{String.t() => Property.t()}
        }
end
