defmodule ElixirAOC.Day1Test do
  use ExUnit.Case

  alias ElixirAOC.Day1

  test "Should sum frequencies" do
    assert Day1.sum_frequencies([1, 1, 1]) == 3
    assert Day1.sum_frequencies([1, 1, -2]) == 0
    assert Day1.sum_frequencies([-1, -2, -3]) == -6
    assert Day1.sum_frequencies([-29, -2, 14, -1, 99, -52]) == 29
  end

  test "Should get first repeated result" do
    assert Day1.first_repeated_frequency([1, -1]) == 0
    assert Day1.first_repeated_frequency([3, 3, 4, -2, -4]) == 10
    assert Day1.first_repeated_frequency([-6, 3, 8, 5 -6]) == 5
    assert Day1.first_repeated_frequency([7, 7, -2, -7, -4]) == 14
  end
end
