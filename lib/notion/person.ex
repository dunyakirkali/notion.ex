defmodule Notion.Person do
  @moduledoc """
  Person
  """

  @enforce_keys [:email]

  @derive Jason.Encoder
  defstruct email: nil

  @type t() :: %__MODULE__{
          email: String.t()
        }
end
