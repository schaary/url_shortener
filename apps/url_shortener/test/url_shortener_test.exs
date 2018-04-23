defmodule USTest do
  use ExUnit.Case
  doctest US

  test "greets the world" do
    assert US.hello() == :world
  end
end
