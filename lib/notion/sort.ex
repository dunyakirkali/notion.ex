defmodule Notion.Sort do
  import EnumType

  defenum Direction do
    value(Ascending, "ascending")
    value(Descending, "descending")
  end

  @derive Jason.Encoder

  @enforce_keys [:property, :direction]

  defstruct [:property, :direction]

  @type t() :: %__MODULE__{
          property: String.t(),
          direction: Direction.t()
        }
end
