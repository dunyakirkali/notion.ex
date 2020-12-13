defmodule Notion.Annotation do
  @moduledoc """
  Annotation
  """

  @enforce_keys [:object]
  defstruct bold: nil,
            italic: nil,
            strikethrough: nil,
            underline: nil,
            code: nil
            # color: nil

  @type t() :: %__MODULE__{
          bold: boolean(),
          italic: boolean(),
          strikethrough: boolean(),
          underline: boolean(),
          code: boolean()
        }
end
