defmodule Notion.Database do
  @moduledoc """
  Database
  """

  alias Notion.Property

  @enforce_keys [:object]
  defstruct object: "database",
            id: nil,
            title: [],
            properties: %{}

  @type t() :: %__MODULE__{
          object: String.t(),
          id: String.t(),
          title: [RichText],
          properties: %{String.t() => Property}
        }
end
