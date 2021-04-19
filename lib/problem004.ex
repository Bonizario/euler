defmodule Problem004 do
  @moduledoc """
  Problem 4 - Largest palindrome product

  Find the largest palindrome made from the product of two 3-digit numbers.
  """

  require Integer

  defp reverse_integer(integer) do
    integer
    |> Integer.to_string()
    |> String.reverse()
    |> String.to_integer()
  end

  defp compare(a, b) do
    if a > b, do: a, else: b
  end

  defp is_palindrome(number), do: number == reverse_integer(number)

  @spec largest_palindrome_product() :: pos_integer()
  def largest_palindrome_product() do
    Enum.reduce(999..100, -1, fn a, acc1 ->
      Enum.reduce(a..100, fn b, acc2 ->
        p = a * b
        if is_palindrome(p) and p > acc1, do: p, else: acc2
      end)
      |> compare(acc1)
    end)
  end
end
