defmodule Problem006Test do
  use ExUnit.Case, async: true

  test "sum_square_difference returns 25164150" do
    assert Problem006.sum_square_difference() === 25_164_150
  end
end
