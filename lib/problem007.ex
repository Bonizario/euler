defmodule Problem007 do
  require Float
  @moduledoc """
  Problem 7 - 10001st prime

  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
  we can see that the 6th prime is 13. What is the 10001st prime number?
  """

  def is_prime?(n) when n <= 1, do: false
  def is_prime?(n) when n in [2, 3], do: true
  def is_prime?(n) do
    sqrt_n = :math.sqrt(n)
      |> Float.floor
      |> round
    !Enum.any?(2..sqrt_n, &(rem(n, &1) == 0))
  end

  def next_prime(n) do
    n = n + 1

    if is_prime?(n) do
      n
    else
      next_prime(n)
    end
  end

  def get_nth_prime(n \\ 10001) do
    Stream.iterate(2, &(next_prime(&1)))
      |> Enum.take(n)
      |> List.last
  end
end
