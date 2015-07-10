defmodule Heartversesapi.V1.VersesView do
  use Heartversesapi.Web, :view

  def render("index.json", %{verses: verses}) do
    %{ translation: "KJV", verses: Enum.map(verses, fn(verse) ->
      %{
        book: verse.book,
        chapter: verse.chapter,
        verse: verse.verse,
        text: verse.text
      }
    end)}
  end

  def render("show.json", %{kjv: kjv}) do
    %{data: render_one(kjv, Heartversesapi.V1.VersesView, "kjv.json")}
  end

  def render("kjv.json", %{kjv: kjv}) do
    %{id: kjv.id}
  end
end
