defmodule Notion.NumberFilter do
  @moduledoc """
  NumberFilter
  """

  @derive Jason.Encoder
  defstruct equals: nil,
            does_not_equal: nil,
            greater_than: nil,
            less_than: nil,
            greater_than_or_equal_to: nil,
            less_than_or_equal_to: nil,
            is_empty: nil,
            is_not_empty: nil

  @type t() :: %__MODULE__{
          equals: integer() | float(),
          does_not_equal: integer() | float(),
          greater_than: integer() | float(),
          less_than: integer() | float(),
          greater_than_or_equal_to: integer() | float(),
          less_than_or_equal_to: integer() | float(),
          is_empty: integer() | float(),
          is_not_empty: integer() | float()
        }
end
