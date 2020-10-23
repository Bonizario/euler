defmodule Problem006 do
  @moduledoc """
  Problem 6 - Sum square difference

  Find the difference between the sum of the squares of the first one hundred
  natural numbers and the square of the sum.
  """

  # defp pow(n, k), do: pow(n, k, 1)
  # defp pow(_, 0, acc), do: acc
  # defp pow(n, k, acc), do: pow(n, k - 1, n * acc)

  defp sum_of_squares(n \\ 100) do
    Enum.reduce(1..100, 0, fn(x, acc) -> x * x + acc end)
  end

  def sum_square_difference() do
    5050 * 5050 - sum_of_squares()
  end
end
