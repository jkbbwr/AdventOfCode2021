defmodule Day2 do
  def addUp([[a, b] | c], v, h) do
    cond do
      String.starts_with?(a, "up") ->
        addUp(c, v - b, h)

      String.starts_with?(a, "down") ->
        addUp(c, v + b, h)

      String.starts_with?(a, "forward") ->
        addUp(c, v, h + b)
    end
  end

  def addUp([], v, h) do
    v * h
  end

  def addUp([[a, b] | c], v, h, aim) do
    cond do
      String.starts_with?(a, "up") ->
        addUp(c, v, h, aim - b)

      String.starts_with?(a, "down") ->
        addUp(c, v, h, aim + b)

      String.starts_with?(a, "forward") ->
        addUp(c, v + b * aim, h + b, aim)
    end
  end

  def addUp([], v, h, a) do
    v * h
  end

  def runAll() do
    IO.puts("Day 1 part 1\t: #{part1()}")
    IO.puts("Day 1 part 2\t: #{part2()}")
  end

  def part1() do
    Advent.getFile(2)
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x ->
      [Enum.at(String.split(x), 0), String.to_integer(Enum.at(String.split(x), 1))]
    end)
    |> addUp(0, 0)
  end

  def part2() do
    Advent.getFile(2)
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x ->
      [Enum.at(String.split(x), 0), String.to_integer(Enum.at(String.split(x), 1))]
    end)
    |> addUp(0, 0, 0)
  end
end

Day2.runAll()
