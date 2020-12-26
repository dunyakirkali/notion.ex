defmodule Notion.MultiSelectFilter do
  @moduledoc """
  MultiSelectFilter
  """

  @derive Jason.Encoder
  defstruct contains: nil,
            does_not_contain: nil,
            is_empty: nil,
            is_not_empty: nil

  @type t() :: %__MODULE__{
          contains: String.t(),
          does_not_contain: String.t(),
          is_empty: boolean(),
          is_not_empty: boolean()
        }
end
