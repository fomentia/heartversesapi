defmodule PassageParserTest do
  use ExUnit.Case, async: true

  test "PassageParser can parse any single-verse passage" do
    assert PassageParser.parse("John 3:16") == [book: "John", chapter: 3, verse_start: 16]
    assert PassageParser.parse("Exodus 2:3") == [book: "Exodus", chapter: 2, verse_start: 3]
  end

  test "PassageParser can parse any chapter-only passage" do
    assert PassageParser.parse("John 3") == [book: "John", chapter: 3]
    assert PassageParser.parse("Genesis 11") == [book: "Genesis", chapter: 11]
  end

  test "PassageParser can parse any ranged passage" do
    assert PassageParser.parse("John 3:16-19") == [book: "John", chapter: 3, verse_start: 16, verse_end: 19]
    assert PassageParser.parse("Genesis 2:1-5") == [book: "Genesis", chapter: 2, verse_start: 1, verse_end: 5]
  end

  test "PassageParser can parse any irregular single-verse passage" do
    assert PassageParser.parse("Jn 3:16") == [book: "Jn", chapter: 3, verse_start: 16]
  end
end
