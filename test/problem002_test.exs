defmodule Problem002Test do
  use ExUnit.Case
  doctest Problem002

  describe "Problem002.sum_even_fibonacci_numbers" do
    test "It should return 4613732" do
      assert Problem002.sum_even_fibonacci_numbers() === 4613732
    end
  end
end
