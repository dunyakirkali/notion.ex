defmodule Notion.Annotation do
  @moduledoc """
  Annotation
  """

  import EnumType

  defenum Color do
    value(Default, "default")
    value(Gray, "gray")
    value(Brown, "brown")
    value(Orange, "orange")
    value(Yellow, "yellow")
    value(Green, "green")
    value(Blue, "blue")
    value(Purple, "purple")
    value(Pink, "pink")
    value(Red, "red")
    value(GrayBackground, "gray_background")
    value(BrownBackground, "brown_background")
    value(OrangeBackground, "orange_background")
    value(YellowBackground, "yellow_background")
    value(GreenBackground, "green_background")
    value(BlueBackground, "blue_background")
    value(PurpleBackground, "purple_background")
    value(PinkBackground, "pink_background")
    value(RedBackground, "red_background")
  end

  @enforce_keys [:object]
  defstruct bold: nil,
            italic: nil,
            strikethrough: nil,
            underline: nil,
            code: nil,
            color: nil

  @type t() :: %__MODULE__{
          bold: boolean(),
          italic: boolean(),
          strikethrough: boolean(),
          underline: boolean(),
          code: boolean(),
          color: Color.t()
        }
end
