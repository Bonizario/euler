defmodule Problem007Test do
  use ExUnit.Case, async: true

  test "get_nth_prime/1 returns 104743" do
    assert Problem007.get_nth_prime() === 104_743
  end
end
