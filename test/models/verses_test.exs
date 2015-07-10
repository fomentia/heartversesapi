defmodule Heartversesapi.VersesTest do
  use Heartversesapi.ModelCase

  alias Heartversesapi.Verses

  @valid_attrs %{book: "some content", chapter: 42, verse: 42, text: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Verses.changeset(%Verses{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Verses.changeset(%Verses{}, @invalid_attrs)
    refute changeset.valid?
  end
end
