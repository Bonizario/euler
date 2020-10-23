# Elixir

## Tipos de dados básicos

- Inteiros: binários (0b01011), octais (0o324) e hexadecimais (0x2FF)
- Ponto Flutuante: precisão de 64 bits, suporte para notação científica (1.5e-10)
- Booleanos: `true` or `false`. Todo valor é truthy com exceção de `false` e `nil`
- Átomo: constante cujo o nome é o seu valor.

  `true` e `false` também são átomos `:true` e `:false`.

  Nomes de módulos também são átomos.

  Átomos são usados para referenciar módulos de bibliotecas.

  ```elixir
  # Exemplo de átomo
  iex> :foo
  :foo
  iex> :foo == :bar
  false
  ```

- Strings: codificadas em UTF-8 por padrão com **aspas duplas**, suportam quebra de linha e caracteres de escape (\n, \r\n, \t, etc)

<br>
<br>

## Operações Básicas

- `+`, `-`, `*`, `/`. Divisão retorna ponto flutuante.
- Divisão de inteiros: `div(10, 5)` retorna número inteiro 2
- Resto de divisão (módulo): `rem(10, 3)` retorna número inteiro 1
- Operadores booleanos: `&&`, `||`, `!` (para qualquer tipo)

  ```elixir
  iex> -20 || true
  -20
  iex> false || 42
  42

  iex> 42 && true
  true
  iex> 42 && nil
  nil

  iex> !42
  false
  iex> !false
  true
  ```

  `and`, `or`, `not`: o primeiro argumento **precisa** ser booleano

  ```elixir
  iex> true and 42
  42
  iex> false or true
  true
  iex> not false
  true
  iex> 42 and true
  ** (ArgumentError) argument error: 42
  iex> not 42
  ** (ArgumentError) argument error
  ```

- Comparação: `>`, `>=`, `<`, `<=`, `==`, `!=`, `===`, `!==` (1 !== 1.0 retorna true)

  Qualquer tipo pode ser comparado, existe uma ordem de classificação.
  ```elixir
  number < atom < reference < function < port < pid < tuple < map < list < bitstring
  ```

- Interpolação de strings

  ```elixir
  iex> name = "Sean"
  iex> "Hello #{name}"
  "Hello Sean"
  ```

- Concatenação de strings

  ```elixir
  iex> name = "Sean"
  iex> "Hello " <> name
  "Hello Sean"
  ```

<br>
<br>

## Coleções

- Listas (encadeadas): valores podem ter múltiplos tipos e podem ser não-exclusivos

  `[3.14, :pie, "Apple"]`

  Acessar o tamanho da lista tem complexidade `O(n)`. Por esse motivo é normalmente mais rápido inserir um elemento no início (`prepending`) ao invés do final (`appending`).

  ```elixir
  iex> list = [3.14, :pie, "Apple"]
  [3.14, :pie, "Apple"]
  # Prepending (mais rápido)
  iex> ["π" | list]
  ["π", 3.14, :pie, "Apple"]
  # Appending (menos rápido)
  iex> list ++ ["Banana"]
  [3.14, :pie, "Apple", "Banana"]
  ```

  - Concatenação de listas: operador `++/2`

    `[1, 2] ++ [3, 4, 1]` resulta em `[1, 2, 3, 4, 1]`

    `++/2` -> notação em Elixir e Erlang: o nome de uma função ou operador tem 2 componentes, o nome em si (nesse caso ++) e sua **aridade**, que indica o número de argumentos que uma função aceita (nesse caso 2). Nome e aridade são combinados por uma barra.

  - Subtração de listas: operador `--/2` (é seguro subtrair valores inexistentes; comparação **estrita**)

    ```elixir
    iex> ["foo", :bar, 42, 5] -- [42, "bar", 5.0]
    ["foo", :bar, 5]
    ```

  - Topo/Cauda (Head/Tail - Linked Lists)

<br>
<br>

## Funções

- São cidadãos de primeira classe.
- Funções anônimas: não têm nome, definidas com `fn` e `end`,
  parâmetros e corpos separados por `->`

  ```elixir
  iex> sum = fn (a, b) -> a + b end
  iex> sum.(2, 4)
  6
  ```

  Versão abreviada: os parâmetros ficam acessíveis por &1, &2, &3, etc.
  ```elixir
  iex> sum = &(&1 + &2)
  iex> sum.(2, 4)
  6
  ```

- Pattern matching em funções: Elixir permite verificar todas as opções de match e
  executar um bloco específico de código de acordo com os parâmetros.

  ```elixir
  iex()> handle_result = fn
  ...()>   {:ok, result} -> IO.puts "Handling #{result}..."
  ...()>   {:ok, _} -> IO.puts "This would be never run as previous will be matched beforehand."
  ...()>   {:error} -> IO.puts "An error has occurred!"
  ...()> end

  iex()> some_result = 11381

  iex()> handle_result.({:ok, some_result})
  Handling 11381...

  iex()> handle_result.({:error})
  An error has occurred!
  ```

- Funções nomeadas: possuem nomes para serem referidas futuramente. São definidas
  com a palavra `def`, dentro de um módulo.

  Funções definidas em um módulo, são disponíveis para uso de outros módulos.

  Caso o corpo da função tenha apenas uma linha, podemos simplificar usando o `do:`

  ```elixir
  defmodule Greeter do
    def hello(name) do
      "Hello, " <> name
    end

    def short_hello(name), do: "Hello, " <> name
  end

  iex()> Greeter.hello("John Doe")
  "Hello, John Doe"
  iex()> Greeter.short_hello("Alice")
  "Hello, Alice"
  iex()>
  ```

- Calculando a quantidade de elementos em uma lista usando pattern matching:

  ```elixir
  defmodule Length do
    def of([]), do: 0
    def of([_ | tail]), do: 1 + of(tail)
  end
  ```

- Aridade em ação: funções diferentes. Pattern matching se aplica em várias definições
  de uma função **com a mesma quantidade de argumentos**.

  ```elixir
  defmodule Greeter2 do
    def hello(), do: "Hello, anonymous person!"                 # hello/0
    def hello(name), do: "Hello, " <> name                      # hello/1
    def hello(name1, name2), do: "Hello, #{name1} and #{name2}" # hello/2
  end

  iex> Greeter2.hello()
  "Hello, anonymous person!"
  iex> Greeter2.hello("Fred")
  "Hello, Fred"
  iex> Greeter2.hello("Fred", "Jane")
  "Hello, Fred and Jane"
  ```

<br>
<br>

---

<br>
<br>

**Resumo**
- Dinamicamente tipada (tipos são determinados durante a execução)
- Linguagem funcional (functions -> first-class citizens)
- Programação declarativa (what? instead of how?)
- Dados imutáveis
- Concorrência, tolerância a falhas
- Modelo de atores
  - Ator: processo Erlang (não um processo do sistema operacional)
    - Não compartilham a mesma memória, são isolados de outros processos
    - Estado privado, jamais alterado por outro processo
    - Comunicam entre si passando mensagens
    - Cada ator possui um **PID** ("endereço") e uma **mailbox** (queue de mensagens)
    - Troca de mensagens entre os atores é assíncrona pela função `send/2`
- Porque Elixir? => Aplicações escaláveis e manuteníveis
- Compilada em byte code e executada em uma VM (Erlang VM ou BEAM)
- Erlang já existia previamente, (80's)
