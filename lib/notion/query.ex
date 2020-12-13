defmodule Notion.Query do
  @moduledoc """
  Query
  """

  alias Notion.{Filter, Sort}

  @derive Jason.Encoder

  defstruct [:filter, :sorts, :start_cursor]

  @type t() :: %__MODULE__{
          filter: [Filter.t()] | nil,
          sorts: [Sort.t()] | nil,
          start_cursor: String.t() | nil
        }
end