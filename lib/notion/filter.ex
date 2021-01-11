defmodule Notion.Filter do
  @moduledoc """
  Filter
  """

  alias Notion.PropertyFilter

  defstruct or: [],
            and: []

  @type t() :: %__MODULE__{
          or: [PropertyFilter.t()],
          and: [PropertyFilter.t()]
        }
end

defimpl Jason.Encoder, for: Notion.Filter do
  def encode(value, opts) do
    value
    |> Map.from_struct()
    |> Enum.reject(fn {_, v} -> is_nil(v) || length(v) == 0 end)
    |> Enum.into(%{})
    |> Jason.Encode.map(opts)
  end
end
