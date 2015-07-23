defmodule Heartversesapi.V1.ParseController do
  use Heartversesapi.Web, :controller

  plug :action

  def index(conn, %{"passage" => passage}) do
    parsed_passage = PassageParser.parse(passage)

    cond do
      match?(%{book: book, chapter: chapter, verse_start: verse_start, verse_end: verse_end}, parsed_passage) ->
        normalized_string = "#{parsed_passage[:book]} #{parsed_passage[:chapter]}:#{parsed_passage[:verse_start]}-#{parsed_passage[:verse_end]}"

      match?(%{book: book, chapter: chapter, verse_start: verse_start}, parsed_passage) ->
        normalized_string = "#{parsed_passage[:book]} #{parsed_passage[:chapter]}:#{parsed_passage[:verse_start]}"

      match?(%{book: book, chapter: chapter}, parsed_passage) ->
        normalized_string = "#{parsed_passage[:book]} #{parsed_passage[:chapter]}"

      parsed_passage == "Invalid passage" ->
        normalized_string = parsed_passage

      true ->
        normalized_string = "I'm sorry, but I had an internal error."
    end

    render(conn, "index.json", parsed_passage: normalized_string)
  end
end
