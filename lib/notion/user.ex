defmodule Notion.User do
  @moduledoc """
  User
  """

  use Tesla

  def retrieve_user(client, id, query), do: get(client, "/users/" <> id, query: query)

  def list_users(client, query), do: get(client, "/users", query: query)

  alias Notion.{Bot, Person}

  import EnumType
  import Norm

  defenum Type do
    value(Person, "person")
    value(Bot, "bot")
  end

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
          type: Type.t(),
          person: Person.t() | nil,
          #          bot: Bot.t() | nil,
          name: String.t(),
          avatar_url: String.t() | nil
        }

  def s, do: schema(%__MODULE__{
    object: spec(is_binary()),
    id: spec(is_binary()),
    type: spec(is_binary()),
    name: spec(is_binary()),
    avatar_url: spec(is_binary())
  })
end
