defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do

    code
    |> Integer.to_string(2)
    |> String.to_integer()
    |> action()
    |> Enum.filter(fn x -> x != "" end)    
  end

  def action(0), do: [""]
  def action(code) when code >= 100000, do: Enum.concat(action(code - 100000),[""])
  def action(code) when code >= 10000,  do: Enum.reverse(action(code - 10000))
  def action(code) when code >= 1000,   do: Enum.concat(action(code - 1000),["jump"])
  def action(code) when code >= 100,    do: Enum.concat(action(code - 100),["close your eyes"])
  def action(code) when code >= 10,     do: Enum.concat(action(code - 10),["double blink"])
  def action(code) when code >= 1,      do: Enum.concat(action(code - 1), ["wink"])

end
