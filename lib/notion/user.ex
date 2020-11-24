defmodule Notion.User do
  alias Notion.Group

  # @enforce_keys [:object]
  defstruct object: "user",
            id: nil,
            type: nil,
            name: nil,
            email: nil,
            avatar_url: nil,
            groups: []

  @type t() :: %__MODULE__{
          object: String.t(),
          id: String.t(),
          type: String.t(),
          name: String.t(),
          email: String.t() | nil,
          avatar_url: String.t() | nil,
          groups: [Group]
        }
end
