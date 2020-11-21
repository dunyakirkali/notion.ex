defmodule NotionTest do
  use ExUnit.Case
  doctest Notion

  test "greets the world" do
    assert Notion.hello() == :world
  end
end
