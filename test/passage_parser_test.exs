defmodule PassageParserTest do
  use ExUnit.Case, async: true

  test "happy path" do
    assert PassageParser.parse("John 3:16") == [book: "John", chapter: 3, verse_start: 16]
  end
end
