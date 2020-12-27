defmodule Notion.PeopleFilter do
  @moduledoc """
  PeopleFilter
  """

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

defimpl Jason.Encoder, for: Notion.PeopleFilter do
  def encode(value, opts) do
    value
    |> Map.from_struct()
    |> Enum.reject(fn {_, v} -> is_nil(v) end)
    |> Enum.into(%{})
    |> Jason.Encode.map(opts)
  end
end
