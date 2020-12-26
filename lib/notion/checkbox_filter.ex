defmodule Notion.CheckboxFilter do
  @moduledoc """
  CheckboxFilter
  """

  @derive Jason.Encoder
  defstruct equals: nil,
            does_not_equal: nil

  @type t() :: %__MODULE__{
          equals: boolean(),
          does_not_equal: boolean()
        }
end
