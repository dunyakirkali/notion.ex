defmodule Notion.SelectFilter do
  @moduledoc """
  SelectFilter
  """

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

defimpl Jason.Encoder, for: Notion.SelectFilter do
  def encode(value, opts) do
    value
    |> Map.from_struct()
    |> Enum.reject(fn {_, v} -> is_nil(v) end)
    |> Map.new()
    |> Jason.Encode.map(opts)
  end
end
