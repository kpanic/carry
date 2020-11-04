defmodule Carry do
  @moduledoc """
  Carry transforms a map into the corresponding Elixir struct without atom waste
  """

  @doc """
  Transform the given map to the corresponding struct
  Example:

  iex> defmodule Instrument, do: defstruct [:carillon]

  iex> Carry.on(%{"carillon" => "sound", "marimba" => "percussion"}, %Instrument{})
  %Instrument{carillon: "sound"}

  iex> Carry.on(%{"carillon" => "sound", "marimba" => "percussion"}, Instrument)
  %Instrument{carillon: "sound"}

  """
  @spec on(map(), struct() | atom()) :: struct()
  def on(map, %module{}), do: map_to_struct(map, module)
  def on(map, module) when is_atom(module), do: map_to_struct(map, module)

  defp map_to_struct(map, module) do
    struct = struct(module)

    new_map =
      struct
      |> Map.from_struct()
      |> Enum.reduce(%{}, fn {key, default}, acc ->
        Map.put(acc, key, Map.get(map, Atom.to_string(key), default))
      end)

    struct(module, new_map)
  end
end
