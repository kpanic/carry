defmodule Carry do
  @moduledoc """
  Carry transforms a map in this form:

  %{"hello" => "world} to the equivalent struct

  It transforms only the atom keys present in the provided struct

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
