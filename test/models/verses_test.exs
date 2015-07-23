defmodule Heartversesapi.VersesTest do
  use Heartversesapi.ModelCase

  alias Heartversesapi.Verses

  @valid_attrs %{translation: "KJV", book: "Genesis", chapter: 1, verse: 1, text: "In the beginning God created the heaven and the earth."}
  @invalid_attrs %{translation: "badd stuff", book: "candyland", chapter: 8888888, verse: -1, text: "wuzzup"}

  test "changeset with valid attributes" do
    changeset = Verses.changeset(%Verses{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Verses.changeset(%Verses{}, @invalid_attrs)
    refute changeset.valid?
  end
end
