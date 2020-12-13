defmodule Notion.TextFilter do
  @moduledoc """
  TextFilter
  """

  @derive Jason.Encoder
  defstruct equals: nil,
            does_not_equal: nil,
            contains: nil,
            does_not_contain: nil,
            starts_with: nil,
            ends_with: nil,
            is_empty: nil,
            is_not_empty: nil

  @type t() :: %__MODULE__{
          equals: String.t(),
          does_not_equal: String.t(),
          contains: String.t(),
          does_not_contain: String.t(),
          starts_with: String.t(),
          ends_with: String.t(),
          is_empty: boolean(),
          is_not_empty: boolean()
        }
end
