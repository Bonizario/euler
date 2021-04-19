defmodule Problem002Test do
  use ExUnit.Case, async: true

  test "sum_even_fibonacci_numbers/0 returns 4613732" do
    assert Problem002.sum_even_fibonacci_numbers() === 4_613_732
  end
end
