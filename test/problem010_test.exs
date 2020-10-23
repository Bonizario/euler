defmodule Problem010Test do
  use ExUnit.Case
  doctest Problem010

  describe "Problem010.sum_prime_numbers" do
    test "It should return 142913828922" do
      assert Problem010.sum_prime_numbers() === 142913828922
    end
  end
end
