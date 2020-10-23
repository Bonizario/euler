defmodule Problem002 do
  require Integer
  @moduledoc """
  Problem 2 - Even Fibonacci numbers

  Retorna a soma de todos os números pares da sequência de fibonacci
  menores que 4 milhões.

  Essa versão da função de fibonacci possui complexidade de tempo linear O(n),
  muito mais eficiente que versões mais simples que não armazenam os resultados
  de cada iteração e possuem complexidade exponencial O(2^n).
  """

  defp tail_recursive_fib(n), do: tail_recursive_fib(n, 0, 1, [])
  defp tail_recursive_fib(0, _current, _next, fib_list) do
    Enum.reverse(fib_list)
  end
  defp tail_recursive_fib(n, current, next, fib_list) do
    tail_recursive_fib(n - 1, next, current + next, [current | fib_list])
  end

  def sum_even_fibonacci_numbers() do
    numbers = tail_recursive_fib(34) # bellow 4 million
    Enum.sum for n <- numbers, Integer.is_even(n), do: n
  end
end
