defmodule Problem004 do
  require Integer
  @moduledoc """
  Problem 4 - Largest palindrome product

  Find the largest palindrome made from the product of two 3-digit numbers.
  """

  defp reverse_integer(integer) do
    integer
    |> Integer.to_string()
    |> String.reverse()
    |> String.to_integer()
  end

  defp compare(a, b) do
    if a > b do
      a
    else
      b
    end
  end

  defp is_palindrome(number), do: number == reverse_integer(number)

  def largest_palindrome_product() do
    Enum.reduce(999..200, -1, fn(a, acc1) ->
      Enum.reduce(a..200, fn(b, acc2) ->
        p = a * b
        if is_palindrome(p) and p > acc1 do
          p
        else
          acc2
        end
      end)
      |> compare(acc1)
    end)
  end
end
