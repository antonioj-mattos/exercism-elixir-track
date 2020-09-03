defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    words =
      sentence
      |> String.downcase()
      |> String.split(~r/([^\w\-]|_)+/u, trim: true)

    words
    |> Enum.reduce(%{}, fn word, counter ->
      Map.update(counter, word, 1, &(&1 + 1))
    end)
  end
end
