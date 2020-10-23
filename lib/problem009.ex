defmodule Problem009 do
  @moduledoc """
  Problem 9 - Special Pythagorean triplet

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.

  https://elixir-lang.org/getting-started/comprehensions.html
  """

  defp is_pythagorian?(a, b, c) do
    a * a + b * b == c * c
  end

  def find_triplet() do
    for a <- 1..1000,
        b <- a..1000,
        c = 1000 - a - b,
        is_pythagorian?(a, b, c) do
      [a, b, c]
    end
    |> List.first()
  end

  def sum_triplet(), do: find_triplet() |> Enum.reduce(&+/2)

  def get_triplet_product(), do: find_triplet() |> Enum.reduce(&*/2)
end
