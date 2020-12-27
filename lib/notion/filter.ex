defmodule Notion.Filter do
  @moduledoc """
  Filter
  """

  alias Notion.PropertyFilter

  @derive Jason.Encoder
  defstruct or: [],
            and: []

  @type t() :: %__MODULE__{
          or: [PropertyFilter],
          and: [PropertyFilter]
        }
end
