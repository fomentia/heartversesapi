defmodule PassageParser do
  def parse(passage) do
    match = Regex.run(~r/([A-Za-z]{2,})\s*(\d{1,3})(:(\d{1,3}))?(-(\d{1,3}))?/i, passage)

    cond do
      match?([_, book, chapter, _, verse_start, _, verse_end], match) ->
        [_, book, chapter, _, verse_start, _, verse_end] = match
        %{:book => book,
          :chapter => String.to_integer(chapter),
          :verse_start => String.to_integer(verse_start),
          :verse_end => String.to_integer(verse_end)}

      match?([_, book, chapter, _, verse], match) ->
        [_, book, chapter, _, verse] = match
        %{:book => book, :chapter => String.to_integer(chapter), :verse_start => String.to_integer(verse)}

      match?([_, book, chapter], match) ->
        [_, book, chapter] = match
        %{:book => book, :chapter => String.to_integer(chapter)}

      true ->
        "Invalid passage"
    end
  end
end
