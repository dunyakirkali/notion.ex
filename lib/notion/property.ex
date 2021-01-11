defmodule Notion.Property do
  @moduledoc """
  Property
  """

  alias Notion.{User, RichText}

  # @enforce_keys [:object]

  import EnumType

  defenum Type do
    value(Text, "text")
    value(Number, "number")
  end

  @derive Jason.Encoder
  defstruct id: nil,
            type: nil,
            text: [],
            number: nil,
            title: [],
            people: nil,
            checkbox: nil,
            url: nil,
            email: nil,
            phone: nil,
            created_time: nil,
            created_by: nil,
            last_edited_time: nil,
            last_edited_by: nil

  @type t() :: %__MODULE__{
          id: String.t(),
          type: Type.t(),
          text: [RichText.t()],
          number: integer() | float(),
          title: [RichText.t()],
          people: [User.t()],
          checkbox: boolean(),
          url: String.t(),
          email: String.t(),
          phone: String.t(),
          created_time: String.t(),
          created_by: User.t(),
          last_edited_time: String.t(),
          last_edited_by: User.t()
        }
end
