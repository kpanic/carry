defmodule Carry do
  @moduledoc """
  Carry transforms a map to the corresponding Elixir struct:
  """

  @doc """
  Transform the given map to the corresponding struct
  Example:

  iex> defmodule Instrument do
    defstruct [:carillon]
  end

  iex> Carry.on(%{"carillon" => "sound", "marimba" => "percussion"}, %Instrument{})
  %Instrument{carillon: "sound"}

  """
  @spec on(map(), map()) :: map()
  def on(map, %module{} = struct) do
    new_map =
      struct
      |> Map.from_struct()
      |> Enum.reduce(%{}, fn {key, default}, acc ->
        Map.put(acc, key, Map.get(map, Atom.to_string(key), default))
      end)

    struct(module, new_map)
  end
end
