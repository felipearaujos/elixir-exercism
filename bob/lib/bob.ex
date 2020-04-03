defmodule Bob do
  def hey(input) do
    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      upcase?(input) and question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      upcase?(input) -> "Whoa, chill out!"
      true -> "Whatever."
        
    end    
  end

  def question?(input) do
    input 
      |> String.trim
      |> String.ends_with?("?")
  end

  def letter?(string), do: String.upcase(string) != String.downcase(string)

  def upcase?(string) do
    string
    |> String.upcase() == string and letter?(string)
  end

  

end

