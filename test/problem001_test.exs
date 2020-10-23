defmodule Problem001Test do
  use ExUnit.Case
  doctest Problem001

  describe "Problem001.sum_multiples_of_three_and_five" do
    test "It should return 233168" do
      assert Problem001.sum_multiples_of_three_and_five() === 233168
    end
  end
end
