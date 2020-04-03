defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence      
      |> String.replace("_"," ")
      |> String.replace(",", " ")
      |> String.replace(":", " ")   
      |> String.replace("!!&@$%^&", " ")      
      |> String.downcase
      |> String.split(" ", trim: true)
      |> Enum.frequencies()
  end
end
