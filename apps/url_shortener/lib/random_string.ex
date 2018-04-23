defmodule US.RandomString do

  @moduledoc """
  A simple random string generator for strings of length 6
  """

  @container [
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
    "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
  ]

  @doc """
  Returns random strings of length 6
  """
  def random_string() do
    Enum.join([
      random_char(),
      random_char(),
      random_char(),
      random_char(),
      random_char(),
      random_char()
    ])
  end

  defp random_char() do
    Enum.random(0..61)
    |> get_container_at
  end

  defp get_container_at(index) do
    Enum.at(@container, index)
  end

end
