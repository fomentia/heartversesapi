defmodule Heartversesapi.V1.ParseView do
  use Heartversesapi.Web, :view

  def render("index.json", %{parsed_passage: "Invalid passage"}) do
    %{passages: "Invalid passage"}
  end

  def render("index.json", %{parsed_passage: parsed_passage}) do
    Enum.map(parsed_passage, fn(passage) ->
      %{
        book: passage.book,
        chapter: passage.chapter,
        verse: passage.verse
      }
    end)
  end

end
