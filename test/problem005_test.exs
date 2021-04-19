defmodule Problem005Test do
  use ExUnit.Case, async: true

  test "smallest_multiple returns 232792560" do
    assert Problem005.smallest_multiple() === 232_792_560
  end
end
