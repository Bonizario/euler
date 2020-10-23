defmodule Problem009Test do
  use ExUnit.Case
  doctest Problem009

  describe "Problem009.sum_triplet" do
    test "It should return 1000" do
      assert Problem009.sum_triplet() === 1000
    end
  end

  describe "Problem009.get_triplet_product" do
    test "It should return 31875000" do
      assert Problem009.get_triplet_product() === 31875000
    end
  end
end
