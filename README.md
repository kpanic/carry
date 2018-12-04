# Carry

Carry is a super simple, dependency free package that transforms a map in this
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
we want to convert to an Elixir `struct.

### Credits

Thanks to to the https://hex.pm/packages/poison library for *heavy* influence =)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `carry` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:carry, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/carry](https://hexdocs.pm/carry).

