# Notion

![Code Quality](https://github.com/dunyakirkali/notion.ex/workflows/Code%20Quality/badge.svg)
![Continuous Integration](https://github.com/dunyakirkali/notion.ex/workflows/Continuous%20Integration/badge.svg)
[![Coverage Status](https://coveralls.io/repos/dunyakirkali/notion.ex/badge.svg?branch=master)](https://coveralls.io/r/dunyakirkali/notion.ex?branch=master)
[![Hex.pm version](https://img.shields.io/hexpm/v/notion.svg?style=flat-square)](https://hex.pm/packages/notion)
[![Hex.pm downloads](https://img.shields.io/hexpm/dt/notion.svg)](https://hex.pm/packages/notion)

A [Notion](https://www.notion.so/) client in Elixir.

## Documentation

- [API Spec](https://www.notion.so/Notion-API-specification-c29dd39d851543b49a24e1571f63c488)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `notion` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:notion, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/notion](https://hexdocs.pm/notion).

## Configuration

You will need to set the following configuration variables in your `config/config.exs` file:

```elixir
use Mix.Config

config :notion, api_key: {:system, "NOTION_API_KEY"}
```

## Usage

### Example

```elixir
sort = %Sort{
  property: "Session",
  direction: Sort.Direction.Ascending.value()
}

filter = %Filter{
  and: [
    %PropertyFilter{
      property: "Owner",
      people: %PeopleFilter{
        contains: "9441a930-2a79-40c9-9c00-bd5ad030fd2f"
      }
    },
    %PropertyFilter{
      property: "Status",
      select: %SelectFilter{
        equals: "ToDo"
      }
    }
  ]
}
 
query = %Query{
  filter: filter,
  sorts: [sort]
}

with {:ok, json_string} <- Jason.encode(query),
     {:ok, payload} <- Jason.decode(json_string),
     {:ok, %Tesla.Env{} = env} <- Notion.query_database(db_id, payload) do
  results = env.body.results 

  db = struct(Database, Enum.at(results, 0))
  
  IO.inspect(db.properties[:Task][:title])
end
```

