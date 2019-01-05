defmodule DarchivistTest do
  use ExUnit.Case
  doctest Darchivist

  test "greets the world" do
    assert Darchivist.hello() == :world
  end
end
