defmodule RomanNumerals do

  def to_roman(0), do: ""
  def to_roman(n) when n >= 1000, do: "M" <> to_roman(n - 1000)
  def to_roman(n) when n >= 900,  do: "CM" <> to_roman(n - 900)
  def to_roman(n) when n >= 500,  do: "D" <> to_roman(n - 500)
  def to_roman(n) when n >= 400,  do: "CD" <> to_roman(n - 400)
  def to_roman(n) when n >= 100,  do: "C" <> to_roman(n - 100)
  def to_roman(n) when n >= 90,   do: "XC" <> to_roman(n - 90)
  def to_roman(n) when n >= 50,   do: "L" <> to_roman(n - 50)
  def to_roman(n) when n >= 40,   do: "XL" <> to_roman(n - 40)
  def to_roman(n) when n >= 10,   do: "X" <> to_roman(n - 10)
  def to_roman(n) when n >= 9,    do: "IX" <> to_roman(n - 9)
  def to_roman(n) when n >= 5,    do: "V" <> to_roman(n - 5)
  def to_roman(n) when n >= 4,    do: "IV" <> to_roman(n - 4)
  def to_roman(n) when n >= 1,    do: "I" <> to_roman(n - 1)

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    to_roman(number)
  end
end
