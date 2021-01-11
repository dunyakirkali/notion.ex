defmodule Notion.PropertyFilter do
  @moduledoc """
  PropertyFilter
  """

  alias Notion.{
    CheckboxFilter,
    DateFilter,
    FilesFilter,
    FormulaFilter,
    MultiSelectFilter,
    NumberFilter,
    PeopleFilter,
    RelationFilter,
    SelectFilter,
    TextFilter
  }

  defstruct property: nil,
            title: nil,
            text: nil,
            number: nil,
            checkbox: nil,
            select: nil,
            multi_select: nil,
            date: nil,
            people: nil,
            files: nil,
            url: nil,
            email: nil,
            phone: nil,
            relation: nil,
            formula: nil,
            created_by: nil,
            created_time: nil,
            last_edited_by: nil,
            last_edited_time: nil

  @type t() :: %__MODULE__{
          property: String.t(),
          title: TextFilter.t(),
          text: TextFilter.t(),
          number: NumberFilter.t(),
          checkbox: CheckboxFilter.t(),
          select: SelectFilter.t(),
          multi_select: MultiSelectFilter.t(),
          date: DateFilter.t(),
          people: PeopleFilter.t(),
          files: FilesFilter.t(),
          url: TextFilter.t(),
          email: TextFilter.t(),
          phone: TextFilter.t(),
          relation: RelationFilter.t(),
          formula: FormulaFilter.t(),
          created_by: PeopleFilter.t(),
          created_time: DateFilter.t(),
          last_edited_by: PeopleFilter.t(),
          last_edited_time: DateFilter.t()
        }
end

defimpl Jason.Encoder, for: Notion.PropertyFilter do
  def encode(value, opts) do
    value
    |> Map.from_struct()
    |> Enum.reject(fn {_, v} -> is_nil(v) end)
    |> Map.new()
    |> Jason.Encode.map(opts)
  end
end
