defmodule Problem008Test do
  use ExUnit.Case, async: true

  test "largest_product returns 23514624000" do
    assert Problem008.largest_product() === 23_514_624_000
  end
end
