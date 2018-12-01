defmodule CarryTest do
  use ExUnit.Case

  defmodule Instrument do
    defstruct [:carillon]
  end

  test "Carry.on/1" do
    assert Carry.on(%{"carillon" => "sound"}, %Instrument{}) == %Instrument{carillon: "sound"}
  end

  test "Carry.on/1 with keys not present in a struct" do
    assert Carry.on(%{"carillon" => "sound", "marimba" => "percussion"}, %Instrument{}) ==
             %Instrument{carillon: "sound"}
  end
end
