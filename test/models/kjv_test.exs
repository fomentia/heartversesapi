defmodule Heartversesapi.KJVTest do
  use Heartversesapi.ModelCase

  alias Heartversesapi.KJV

  @valid_attrs %{book: "some content", chapter: 42, number: 42, text: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = KJV.changeset(%KJV{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = KJV.changeset(%KJV{}, @invalid_attrs)
    refute changeset.valid?
  end
end
