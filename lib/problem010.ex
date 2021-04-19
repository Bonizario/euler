defmodule Problem010 do
  @moduledoc """
  Problem 10 - Summation of primes

  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
  Find the sum of all the primes below two million.
  """

  import Problem007, only: [is_prime?: 1]

  @spec sum_prime_numbers() :: pos_integer()
  def sum_prime_numbers() do
    Enum.reduce(2..1_999_999, 0, fn x, acc ->
      if is_prime?(x), do: x + acc, else: acc
    end)
  end
end
