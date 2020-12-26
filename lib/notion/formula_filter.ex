defmodule Notion.FormulaFilter do
  @moduledoc """
  FormulaFilter
  """

  alias Notion.{CheckboxFilter, DateFilter, NumberFilter, TextFilter}

  @derive Jason.Encoder
  defstruct text: nil,
            checkbox: nil,
            number: nil,
            date: nil

  @type t() :: %__MODULE__{
          text: TextFilter,
          checkbox: CheckboxFilter,
          number: NumberFilter,
          date: DateFilter
        }
end
