defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l) do
    case l do
      [] -> 0
      [h | t] -> 1 + count(t)
    end
  end

  @spec reverse(list) :: list
  def reverse(l), do: reverse(l, [])
  defp reverse([], acc), do: acc
  defp reverse([h | t], acc), do: reverse(t, [h | acc])

@spec map(list, (any -> any)) :: list
  def map(l, f) do
    case l do
      [] -> []
      [h | t] -> [f.(h) | map(t, f)]
    end
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    case l do
      [] -> []
      [h | t] -> if f.(h) do [h | filter(t, f)] else filter(t, f) end
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce(l, acc, f) do
    case l do
      [] -> acc
      [h | t] -> reduce(t, f.(h, acc), f)
    end
  end

  @spec append(list, list) :: list
  def append([], []), do: []
  def append([], b), do: b
  def append([h | t], b), do: [h | append(t, b)]

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([[] | t]), do: concat(t)
  def concat([[h | t1] | t2]), do: [h | concat([t1 | t2])]
end
