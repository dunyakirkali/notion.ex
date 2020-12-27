defmodule Notion.PropertyFilter do
  @moduledoc """
  PropertyFilter
  """

  alias Notion.{PeopleFilter, TextFilter, NumberFilter, CheckboxFilter}

  @derive Jason.Encoder
  defstruct property: nil,
            title: nil,
            text: nil,
            number: nil,
            checkbox: nil,
            people: nil

  @type t() :: %__MODULE__{
          property: String.t(),
          title: TextFilter.t(),
          text: TextFilter.t(),
          number: NumberFilter.t(),
          checkbox: CheckboxFilter.t(),
          people: PeopleFilter.t()
        }
end
