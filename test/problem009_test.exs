defmodule Problem009Test do
  use ExUnit.Case, async: true

  test "sum_triplet returns 1000" do
    assert Problem009.sum_triplet() === 1000
  end

  test "get_triplet_product returns 31875000" do
    assert Problem009.get_triplet_product() === 31_875_000
  end
end
