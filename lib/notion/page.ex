defmodule Notion.Page do
  @moduledoc """
  Page
  """

  # @enforce_keys [:object]

  @derive Jason.Encoder
  defstruct object: "page",
            id: nil,
            database: nil,
            archived: nil

  @type t() :: %__MODULE__{
          object: String.t(),
          id: String.t(),
          database: String.t() | nil,
          archived: boolean()
        }
end
