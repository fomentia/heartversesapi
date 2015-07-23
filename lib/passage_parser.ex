defmodule PassageParser do
  def parse(passage) do
    [_, book, chapter, _, verse] = Regex.run(~r/(\w{2,})\s*(\d{1,3})(:(\d{1,3}))?/i, passage)
    [book: book, chapter: String.to_integer(chapter), verse_start: String.to_integer(verse)]
  end
end
