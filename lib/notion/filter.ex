defmodule Notion.Filter do
  @moduledoc """
  Filter
  """

  alias Notion.TextFilter

  @derive Jason.Encoder
  defstruct or: nil,
            and: nil

  @type t() :: %__MODULE__{
          or: [String.t()],
          and: [TextFilter.t()]
        }
end
