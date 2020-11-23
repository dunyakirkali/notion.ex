defmodule NotionTest do
  use ExUnit.Case
  doctest Notion

  import Tesla.Mock

  setup do
    mock(fn
      %{method: :get, url: "https://api.notion.com/v1/users/01da9b00-e400-4959-91ce-af55307647e5"} ->
        "test/fixtures/users/retrieve_user.json"
        |> File.read!()
        |> Jason.decode!()
        |> json()

      %{method: :get, url: "https://api.notion.com/v1/users"} ->
        "test/fixtures/users/list_users.json"
        |> File.read!()
        |> Jason.decode!()
        |> json()

      %{method: :get, url: "https://api.notion.com/v1/pages/b55c9c91-384d-452b-81db-d1ef79372b75"} ->
        "test/fixtures/pages/retrieve_page.json"
        |> File.read!()
        |> Jason.decode!()
        |> json()

    end)

    :ok
  end

  test "retrieve_user" do
    assert {:ok, %Tesla.Env{} = env} = Notion.retrieve_user("01da9b00-e400-4959-91ce-af55307647e5")
    assert env.status == 200
    assert env.body["email"] == "avo@example.org"
  end

  test "list_users" do
    assert {:ok, %Tesla.Env{} = env} = Notion.list_users()
    assert env.status == 200
    assert Enum.count(env.body["results"]) == 2
  end

  test "retrieve_page" do
    assert {:ok, %Tesla.Env{} = env} = Notion.retrieve_page("b55c9c91-384d-452b-81db-d1ef79372b75")
    assert env.status == 200
    assert env.body["object"] == "page"
  end
end
