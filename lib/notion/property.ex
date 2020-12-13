defmodule Notion.Property do
  @moduledoc """
  Property
  """

  # @enforce_keys [:object]

  import EnumType

  defenum Type do
    value(Text, "text")
    value(Number, "number")
  end

  @derive Jason.Encoder
  defstruct id: nil,
            type: nil,
            text: [],
            number: nil

  @type t() :: %__MODULE__{
          id: String.t(),
          type: Type.t(),
          text: [RichText],
          number: integer() | float()
        }
end
