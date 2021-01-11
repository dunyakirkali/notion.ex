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
          text: TextFilter.t(),
          checkbox: CheckboxFilter.t(),
          number: NumberFilter.t(),
          date: DateFilter.t()
        }
end
