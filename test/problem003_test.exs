defmodule Problem003Test do
  use ExUnit.Case
  doctest Problem003

  describe "Problem003.largest_prime_factor" do
    test "It should return 6857" do
      assert Problem003.largest_prime_factor() === 6857
    end
  end
end
