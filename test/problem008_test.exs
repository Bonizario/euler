defmodule Problem008Test do
  use ExUnit.Case
  doctest Problem008

  describe "Problem008.largest_product" do
    test "It should return 23514624000" do
      assert Problem008.largest_product() === 23514624000
    end
  end
end
