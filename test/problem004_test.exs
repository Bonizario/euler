defmodule Problem004Test do
  use ExUnit.Case, async: true

  test "largest_palindrome_product/0 returns 906609" do
    assert Problem004.largest_palindrome_product() === 906_609
  end
end
