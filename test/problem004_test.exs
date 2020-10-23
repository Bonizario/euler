defmodule Problem004Test do
  use ExUnit.Case
  doctest Problem004

  describe "Problem004.largest_palindrome_product" do
    test "It should return 906609" do
      assert Problem004.largest_palindrome_product() === 906609
    end
  end
end
