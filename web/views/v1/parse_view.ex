defmodule Heartversesapi.V1.ParseView do
  use Heartversesapi.Web, :view

  # Handle invalid passages
  def render("index.json", %{parsed_passage: "Invalid passage"}) do
    %{passages: "Invalid passage"}
  end

  # Handle single-verse parse requests
  def render("index.json", %{parsed_passage: [passage | rest]}) when rest == [] do
    "yo"
    # %{
    #   book: passage.book,
    #   chapter: passage.chapter,
    #   verse: passage.verse
    # }
  end

  # Handle range parse requests
  def render("index.json", %{parsed_passage: parsed_passage}) do
    "yo"
    # first_passage = List.first(parsed_passage)
    # last_passage = List.last(parsed_passage)
    #
    # %{
    #   book: first_passage.book,
    #   chapter: first_passage.chapter,
    #   verse_start: first_passage.verse,
    #   verse_end: last_passage.verse
    # }
  end

end
