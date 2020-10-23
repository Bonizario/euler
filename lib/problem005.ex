defmodule Problem005 do
  require Integer
  @moduledoc """
  Problem 5 - Smallest multiple

  What is the smallest positive number that is evenly divisible by all
  of the numbers from 1 to 20?
  """

  def smallest_multiple() do
    Enum.reduce(1..20, fn(a, b) -> div(a * b, Integer.gcd(a, b)) end)
  end
end
