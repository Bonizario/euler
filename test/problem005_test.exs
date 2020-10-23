defmodule Problem005Test do
  use ExUnit.Case
  doctest Problem005

  describe "Problem005.smallest_multiple" do
    test "It should return 232792560" do
      assert Problem005.smallest_multiple() === 232792560
    end
  end
end
