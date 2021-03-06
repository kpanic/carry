defmodule CarryTest do
  use ExUnit.Case

  defmodule Instrument do
    defstruct [:carillon]
  end

  describe "on expanded struct" do
    test "Carry.on/1" do
      assert Carry.on(%{"carillon" => "sound"}, %Instrument{}) == %Instrument{carillon: "sound"}
    end

    test "Carry.on/1 with keys not present in a struct" do
      assert Carry.on(%{"carillon" => "sound", "marimba" => "percussion"}, %Instrument{}) ==
               %Instrument{carillon: "sound"}
    end

    test "Carry.on/1 with atom values" do
      assert Carry.on(%{"carillon" => :sound, "marimba" => :percussion}, %Instrument{}) ==
               %Instrument{carillon: :sound}
    end
  end

  describe "on atom" do
    test "Carry.on/1" do
      assert Carry.on(%{"carillon" => "sound"}, Instrument) == %Instrument{carillon: "sound"}
    end

    test "Carry.on/1 with keys not present in a struct" do
      assert Carry.on(%{"carillon" => "sound", "marimba" => "percussion"}, Instrument) ==
               %Instrument{carillon: "sound"}
    end

    test "Carry.on/1 with atom values" do
      assert Carry.on(%{"carillon" => :sound, "marimba" => :percussion}, Instrument) ==
               %Instrument{carillon: :sound}
    end
  end

  describe "on struct payload" do
    test "Carry.on/1" do
      assert Carry.on(%Instrument{carillon: "sound"}, Instrument) == %Instrument{
               carillon: "sound"
             }
    end

    test "Carry.on/1 with atom values" do
      assert Carry.on(%Instrument{carillon: :sound}, Instrument) ==
               %Instrument{carillon: :sound}
    end
  end
end
