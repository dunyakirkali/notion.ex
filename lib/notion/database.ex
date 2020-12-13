defmodule Notion.Database do
  @moduledoc """
  Database
  """

  @enforce_keys [:object]
  defstruct object: "database",
            id: nil,
            title: []

  @type t() :: %__MODULE__{
          object: String.t(),
          id: String.t(),
          title: [RichText]
        }
end
