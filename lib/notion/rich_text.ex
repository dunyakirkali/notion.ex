defmodule Notion.RichText do
  @moduledoc """
  RichText
  """

  alias Notion.Annotation

  defstruct plain_text: nil,
            href: nil,
            annotations: []

  @type t() :: %__MODULE__{
          plain_text: String.t(),
          href: String.t() | nil,
          annotations: [Annotation]
        }
end
