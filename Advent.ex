defmodule Advent do
  def getFile(day) do
    File.read("days/day#{day}.txt")
    |> elem(1)
    |> String.split("\n")
  end
end
