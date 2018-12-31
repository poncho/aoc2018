defmodule ElixirAOC.Day1 do
  @moduledoc false

  def run do
    input = read_input()

    # Part 1
    sum = sum_frequencies(input)
    IO.puts("Frequency sum: #{sum}")

    # Part 2
    first_repeated = first_repeated_frequency(input)
    IO.puts("First repeated: #{first_repeated}")
  end

  def sum_frequencies(frequencies) do
    Enum.reduce(frequencies, 0, fn frequency, sum ->
      sum + frequency
    end)
  end

  def first_repeated_frequency(frequencies, sum \\ 0, frequency_results \\ %{0 => true}) do
    answer =
      Enum.reduce_while(frequencies, {sum, frequency_results}, fn frequency, {sum, frequency_results} ->
        result = sum + frequency

        case Map.get(frequency_results, result) do
          nil ->
            acc = {result, Map.put(frequency_results, result, true)}
            {:cont, acc}

          _ ->
            {:halt, {:ok, result}}
        end
      end)

    case answer do
      {:ok, result} ->
        result

      {actual_sum, actual_frequency_results} ->
        first_repeated_frequency(frequencies, actual_sum, actual_frequency_results)
    end
  end

  def read_input() do
    "inputs/day1.txt"
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(fn frequency ->
      case Integer.parse(frequency) do
        {frequency_value, _} ->
          frequency_value

        _ ->
          nil
      end
    end)
    |> Enum.reject(&is_nil/1)
  end
end
