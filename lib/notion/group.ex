defmodule Notion.Group do
  # @enforce_keys [:object]
  defstruct object: "group",
            id: nil,
            name: nil,
            properties: %{}

  @type t() :: %__MODULE__{
          object: String.t(),
          id: String.t(),
          name: String.t()
        }
end
