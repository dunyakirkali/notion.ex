defmodule Notion.RichText do
  @moduledoc """
  RichText
  """

  defstruct plain_text: nil,
            href: nil

  @type t() :: %__MODULE__{
          plain_text: String.t(),
          href: String.t() | nil
        }
end
