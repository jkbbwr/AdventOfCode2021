defmodule Day1 do
  def countIncreases([_], x) do
    x
  end

  def countIncreases([a | b], x) do
    z = Enum.at(b, 0)

    if a < z do
      countIncreases(b, x + 1)
    else
      countIncreases(b, x)
    end
  end

  def runningIncreases(z, x) do
    if Enum.count(z) < 4 do
      x
    else
      a = Enum.at(z, 0)
      b = Enum.at(z, 3)

      if a < b do
        Enum.drop(z, 1)
        |> runningIncreases(x + 1)
      else
        Enum.drop(z, 1)
        |> runningIncreases(x)
      end
    end
  end

  def runAll() do
    IO.puts("Day 1 part 1\t: #{part1()}")
    IO.puts("Day 1 part 2\t: #{part2()}")
  end

  def part1() do
    Advent.getFile(1)
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(&String.to_integer(&1))
    |> countIncreases(0)
  end

  def part2() do
    Advent.getFile(1)
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(&String.to_integer(&1))
    |> runningIncreases(0)
  end
end

Day1.runAll()
