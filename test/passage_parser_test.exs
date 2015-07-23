defmodule PassageParserTest do
  use ExUnit.Case, async: true

  test "happy path" do
    assert PassageParser.parse("John 3:16") == [book: "John", chapter: 3, verse_start: 16]
    assert PassageParser.parse("John 3:17") == [book: "John", chapter: 3, verse_start: 17]
  end
end
