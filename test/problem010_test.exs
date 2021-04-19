defmodule Problem010Test do
  use ExUnit.Case, async: true

  test "sum_prime_numbers returns 142913828922" do
    assert Problem010.sum_prime_numbers() === 142_913_828_922
  end
end
