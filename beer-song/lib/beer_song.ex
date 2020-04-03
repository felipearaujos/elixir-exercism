defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do    
    
    first_line(number) <> "\n" <> second_line(number) <> "\n"
    
  end

  defp first_line(0), do: "No more bottles of beer on the wall, no more bottles of beer." 
  defp second_line(0), do: "Go to the store and buy some more, 99 bottles of beer on the wall."

  defp first_line(1), do: "1 bottle of beer on the wall, 1 bottle of beer." 
  defp second_line(1), do: "Take it down and pass it around, no more bottles of beer on the wall."
  
  defp second_line(2), do: "Take one down and pass it around, 1 bottle of beer on the wall."

  defp first_line(number), do: "#{number} bottles of beer on the wall, #{number} bottles of beer."
  defp second_line(number), do: "Take one down and pass it around, #{number - 1} bottles of beer on the wall."

  def sing(start, start),  do: verse(start)
  def sing(start, finish), do: verse(start) <> "\n" <> sing(start - 1, finish)

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    start..finish = range
    sing(start, finish)
  end

  def lyrics() do
    lyrics(99..00)
  end
 



end
