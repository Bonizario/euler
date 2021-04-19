defmodule Problem003 do
  @moduledoc """
  Problem 3 - Largest prime factor

  The prime factors of 13195 are 5, 7, 13 and 29.
  What is the largest prime factor of the number 600851475143?
  """

  @spec largest_prime_factor() :: pos_integer()
  def largest_prime_factor(), do: largest_prime_factor(600_851_475_143, 2)

  @spec largest_prime_factor(pos_integer(), pos_integer()) :: pos_integer()
  def largest_prime_factor(1, i), do: i

  def largest_prime_factor(n, i) do
    if rem(n, i) == 0 do
      largest_prime_factor(div(n, i), i)
    else
      largest_prime_factor(n, i + 1)
    end
  end
end
