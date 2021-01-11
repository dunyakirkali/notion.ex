defmodule Notion.Page do
  @moduledoc """
  Page
  """

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
