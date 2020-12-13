defmodule Notion.User do
  @moduledoc """
  User
  """

  alias Notion.Person
  alias Notion.Bot

  @enforce_keys [:object]
  defstruct object: "user",
            id: nil,
            type: nil,
            person: nil,
            bot: nil,
            name: nil,
            avatar_url: nil

  @type t() :: %__MODULE__{
          object: String.t(),
          id: String.t(),
          type: String.t(),
          person: Person,
          bot: Bot,
          name: String.t(),
          avatar_url: String.t() | nil
        }
end
