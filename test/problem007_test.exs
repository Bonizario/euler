defmodule Problem007Test do
  use ExUnit.Case
  doctest Problem007

  describe "Problem007.get_nth_prime" do
    test "It should return 104743" do
      assert Problem007.get_nth_prime() === 104743
    end
  end
end
