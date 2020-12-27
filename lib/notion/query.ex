defmodule Notion.Query do
  @moduledoc """
  Query
  """

  alias Notion.{Filter, PropertyFilter, Sort}

  defstruct [:filter, :sorts, :start_cursor]

  @type t() :: %__MODULE__{
          filter: Filter.t() | PropertyFilter.t() | nil,
          sorts: [Sort.t()] | nil,
          start_cursor: String.t() | nil
        }
end

defimpl Jason.Encoder, for: Notion.Query do
  def encode(value, opts) do
    value
    |> Map.from_struct()
    |> Enum.reject(fn {_, v} -> is_nil(v) end)
    |> Enum.into(%{})
    |> Jason.Encode.map(opts)
  end
end
