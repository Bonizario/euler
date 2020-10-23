defmodule Problem001 do
  @moduledoc """
  Problem 1 - Multiples of 3 and 5

  Retorna a soma de todos os números naturais menores que 1000, múltiplos de 3 e 5.

  Foi usado Enum.reduce/3, que recebe um enumerável (nesse caso um range 1..999),
  um valor inicial para o acumulador (0) e uma função que recebe dois
  parâmetros: atual, acumulador. Nessa função, a variável acumuladora só
  é incrementada com o valor atual, se ele for múltiplo de 3 ou 5.
  O retorno da função é usado como acumulador para a próxima iteração.
  Ela retorna o último acumulador.
  """

  def sum_multiples_of_three_and_five do
    Enum.reduce 1..999, 0, fn(x, total) ->
      if rem(x, 3) == 0 or rem(x, 5) == 0 do
        x + total
      else
        total
      end
    end
  end
end
