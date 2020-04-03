defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do

    charlist = String.to_charlist(text)
    Enum.map(charlist, fn char -> 
      cond do
        (char >= ?a) && (char <= ?z) ->
          rem(char - ?a + shift, 26) + ?a
        (char >= ?A) && (char <= ?Z) ->
          rem(char - ?A + shift, 26) + ?A
        true -> 
          char
      end
    end)
    |> List.to_string()  
  end
end
