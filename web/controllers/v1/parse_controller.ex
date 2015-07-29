defmodule Heartversesapi.V1.ParseController do
  use Heartversesapi.Web, :controller
  alias Heartversesapi.Verses

  plug :action

  def index(conn, %{"passage" => passage}) do
    parsed_passage = PassageParser.parse(passage)

    if parsed_passage != "Invalid passage" do
      query_string = insert_sql_wildcards(parsed_passage[:book])
    end

    cond do
      match?(%{book: book, chapter: chapter, verse_start: verse_start, verse_end: verse_end}, parsed_passage) ->
        %{book: book, chapter: chapter, verse_start: verse_start, verse_end: verse_end} = parsed_passage
        full_passage = Repo.all(from v in Verses,
                                where: fragment("LOWER(?) LIKE LOWER(?)", v.book, ^query_string),
                                where: v.chapter == ^chapter,
                                where: v.verse >= ^verse_start,
                                where: v.verse <= ^verse_end)

      match?(%{book: book, chapter: chapter, verse_start: verse_start}, parsed_passage) ->
        %{book: book, chapter: chapter, verse_start: verse_start} = parsed_passage
        full_passage = Repo.all(from v in Verses,
                                where: fragment("LOWER(?) LIKE LOWER(?)", v.book, ^query_string),
                                where: v.chapter == ^chapter,
                                where: v.verse == ^verse_start)

      match?(%{book: book, chapter: chapter}, parsed_passage) ->
        %{book: book, chapter: chapter} = parsed_passage
        full_passage = Repo.all(from v in Verses,
                                where: fragment("LOWER(?) LIKE LOWER(?)", v.book, ^query_string),
                                where: v.chapter == ^chapter,
                                where: v.verse == 1)

      parsed_passage == "Invalid passage" ->
        full_passage = parsed_passage

      true ->
        full_passage = "I'm sorry, but I had an internal error."
    end

    render(conn, "index.json", parsed_passage: full_passage)
  end

  def insert_sql_wildcards(query_string) do
    insert_percents = String.graphemes(query_string)
                      |> Enum.map(fn(char) -> "%#{char}" end)
                      |> List.to_string
    insert_percents <> "%"
  end
end
