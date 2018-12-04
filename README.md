# Carry

Carry is a super simple, dependency free package that transforms a map from this
form:

```elixir
%{"carillon" => "sound", "marimba" => "percussion"}
```

to the corresponding Elixir `struct`.

For example, given this `struct`:

```elixir
  defmodule Instrument do
    defstruct [:carillon]
  end
```

by invoking the function:

```elixir
Carry.on(%{"carillon" => "sound", "marimba" => "percussion"}, %Instrument{})
```

We will get back:

```elixir
%Instrument{carillon: "sound"}
```

This is usually useful when having a decoded payload from json (a map) and
we want to convert to an Elixir `struct`.

This implementation does not use `String.to_atom/1` in order to not exhaust the
BEAM atom table limits, since atoms are not garbage collected.

I was using `exconstrutor`, however I noticed that it seems to generate new
atoms in some corner cases.
See https://github.com/appcues/exconstructor/issues/25 to get more context.

### Credits

Thanks to to the https://hex.pm/packages/poison library for *heavy* influence =)

### **NOTE**

If you are using `Poison`, you can just do `Poison.decode(json_string, as: %YourStruct)`

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `carry` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:carry, "~> 0.1"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/carry](https://hexdocs.pm/carry).

