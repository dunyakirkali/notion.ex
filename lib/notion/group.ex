defmodule Notion.Group do
  @moduledoc """
  Group
  """
  
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
