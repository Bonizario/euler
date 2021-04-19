defmodule Problem003Test do
  use ExUnit.Case, async: true

  test "largest_prime_factor/0 returns 6857" do
    assert Problem003.largest_prime_factor() === 6857
  end
end
