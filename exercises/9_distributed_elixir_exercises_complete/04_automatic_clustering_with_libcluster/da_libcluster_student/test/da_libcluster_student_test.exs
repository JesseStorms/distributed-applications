defmodule DaLibclusterStudentTest do
  use ExUnit.Case
  doctest DaLibclusterStudent

  test "greets the world" do
    assert DaLibclusterStudent.hello() == :world
  end
end
