defmodule Notion.PropertyFilter do
  @moduledoc """
  PropertyFilter
  """

  alias Notion.PeopleFilter

  @derive Jason.Encoder
  defstruct property: nil,
            people: nil

  @type t() :: %__MODULE__{
          property: String.t(),
          people: PeopleFilter.t()
        }
end
