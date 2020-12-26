defmodule Notion.FilesFilter do
  @moduledoc """
  FilesFilter
  """

  @derive Jason.Encoder
  defstruct is_empty: nil,
            is_not_empty: nil

  @type t() :: %__MODULE__{
          is_empty: boolean(),
          is_not_empty: boolean()
        }
end
