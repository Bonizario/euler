defmodule Problem006Test do
  use ExUnit.Case
  doctest Problem006

  describe "Problem006.sum_square_difference" do
    test "It should return 25164150" do
      assert Problem006.sum_square_difference() === 25164150
    end
  end
end
