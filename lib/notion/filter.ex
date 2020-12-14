defmodule Notion.Filter do
  @moduledoc """
  Filter
  """

  alias Notion.TextFilter

  @derive Jason.Encoder
  defstruct or: [],
            and: []

  @type t() :: %__MODULE__{
          or: [String.t()],
          and: [TextFilter.t()]
        }
end
