defmodule Problem001Test do
  use ExUnit.Case, async: true

  test "sum_multiples_of_three_and_five/0 returns 233168" do
    assert Problem001.sum_multiples_of_three_and_five() === 233_168
  end
end
