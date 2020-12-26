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
          equals: integer(),
          does_not_equal: integer(),
          greater_than: integer(),
          less_than: integer(),
          greater_than_or_equal_to: integer(),
          less_than_or_equal_to: integer(),
          is_empty: integer(),
          is_not_empty: integer()
        }
end
