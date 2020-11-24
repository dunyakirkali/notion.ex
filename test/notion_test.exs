defmodule NotionTest do
  use ExUnit.Case
  doctest Notion

  import Tesla.Mock

  alias Notion.User
  alias Notion.Page

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

      %{method: :delete, url: "https://api.notion.com/v1/pages/b55c9c91-384d-452b-81db-d1ef79372b75"} ->
        "test/fixtures/pages/delete_page.json"
        |> File.read!()
        |> Jason.decode!()
        |> json()

      %{method: :get, url: "https://api.notion.com/v1/databases/668d797c-76fa-4934-9b05-ad288df2d136"} ->
        "test/fixtures/databases/retrieve_database.json"
        |> File.read!()
        |> Jason.decode!()
        |> json()
    end)

    :ok
  end

  test "retrieve_user" do
    assert {:ok, %Tesla.Env{} = env} =
             Notion.retrieve_user("01da9b00-e400-4959-91ce-af55307647e5")

    user = struct(User, env.body)
    assert env.status == 200
    assert user.email == "avo@example.org"
  end

  test "list_users" do
    assert {:ok, %Tesla.Env{} = env} = Notion.list_users()
    assert env.status == 200
    assert Enum.count(env.body[:results]) == 2
  end

  test "retrieve_page" do
    assert {:ok, %Tesla.Env{} = env} =
             Notion.retrieve_page("b55c9c91-384d-452b-81db-d1ef79372b75")

    page = struct(Page, env.body)
    assert env.status == 200
    assert page.object == "page"
  end

  test "delete_page" do
    assert {:ok, %Tesla.Env{} = env} =
             Notion.delete_page("b55c9c91-384d-452b-81db-d1ef79372b75")

    page = struct(Page, env.body)
    assert env.status == 200
    assert page.object == "page"
  end

  test "retrieve_database" do
    assert {:ok, %Tesla.Env{} = env} =
             Notion.retrieve_database("668d797c-76fa-4934-9b05-ad288df2d136")

    page = struct(Page, env.body)
    assert env.status == 200
    assert page.object == "database"
  end
end
