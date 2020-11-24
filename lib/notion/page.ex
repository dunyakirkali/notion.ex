defmodule Notion.Page do
  # @enforce_keys [:object]
  defstruct object: "page",
            id: nil,
            database: nil

  @type t() :: %__MODULE__{
          object: String.t(),
          id: String.t(),
          database: String.t() | nil
        }
end
