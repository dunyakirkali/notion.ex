defmodule Notion.DateFilter do
  @moduledoc """
  DateFilter
  """

  @derive Jason.Encoder
  defstruct equals: nil,
            before: nil,
            after: nil,
            on_or_before: nil,
            is_empty: nil,
            is_not_empty: nil,
            on_or_after: nil
            past_week: nil,
            past_month: nil,
            past_year: nil,
            next_week: nil,
            next_month: nil,
            next_year: nil

  @type t() :: %__MODULE__{
          equals: String.t(),
          before: String.t(),
          after: String.t(),
          on_or_before: String.t(),
          is_empty: boolean(),
          is_not_empty: boolean(),
          on_or_after: String.t()
          past_week: map(),
          past_month: map(),
          past_year: map(),
          next_week: map(),
          next_month: map(),
          next_year: map()
        }
end
