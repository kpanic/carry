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
  @spec on(map() | struct(), struct() | atom()) :: struct()
  def on(map_or_struct, %module{}), do: convert_to_struct(map_or_struct, module)
  def on(map_or_struct, module) when is_atom(module), do: convert_to_struct(map_or_struct, module)

  defp convert_to_struct(struct, module) when is_struct(struct),
    do: struct(module, Map.from_struct(struct))

  defp convert_to_struct(map, module) do
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
