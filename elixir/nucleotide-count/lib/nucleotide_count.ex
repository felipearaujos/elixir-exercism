defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    Enum.count(strand, fn x -> x == nucleotide end)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do    
        
    %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
    |> get_and_update(?A, Enum.frequencies(strand))     
    |> get_and_update(?T, Enum.frequencies(strand)) 
    |> get_and_update(?C, Enum.frequencies(strand)) 
    |> get_and_update(?G, Enum.frequencies(strand)) 
    
  end

  def get_and_update(map, nucleotide, sum) do
    Map.update!(map, nucleotide, 
                        fn current_value ->  
                          if sum[nucleotide] == nil do 
                            0
                          else
                            sum[nucleotide]
                          end
                        
                        end)
  end


end
