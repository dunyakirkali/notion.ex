defmodule Notion.SelectFilter do
  @moduledoc """
  SelectFilter
  """

  @derive Jason.Encoder
  defstruct equals: nil,
            does_not_equal: nil,
            is_empty: nil,
            is_not_empty: nil

  @type t() :: %__MODULE__{
          equals: String.t(),
          does_not_equal: String.t(),
          is_empty: boolean(),
          is_not_empty: boolean()
        }
end
