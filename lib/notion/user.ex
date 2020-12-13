defmodule Notion.User do
  @moduledoc """
  User
  """

  alias Notion.Group

  # @enforce_keys [:object]
  defstruct object: "user",
            id: nil,
            type: nil,
            name: nil,
            email: nil,
            avatar_url: nil,
            groups: []

  @type t() :: %__MODULE__{
          object: String.t(),
          id: String.t(),
          type: String.t(),
          name: String.t(),
          email: String.t() | nil,
          avatar_url: String.t() | nil,
          groups: [Group]
        }

  def all do
    fetch_page()
    # Stream.resource(
    #   fn -> fetch_page(url) end,
    #   &process_page/1,
    #   fn _ -> end
    # )
  end

  defp fetch_page(url \\ nil) do
    {:ok, response} = Notion.list_users()
    body = response.body
    {[], body["next_page_uri"]}
  end

  #
  #   response.body.results
  #   |> Enum.map(fn raw_user ->
  #     struct(Notion.User, raw_user)
  #   end)
  # end

  defp process_page({nil, nil}) do
    {:halt, nil}
  end

  defp process_page({nil, next_page_url, module}) do
    next_page_url
    |> fetch_page()
    |> process_page
  end

  defp process_page({items, next_page_url, module}) do
    {items, {nil, next_page_url, module}}
  end
end
