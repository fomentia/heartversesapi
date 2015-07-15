defmodule Heartversesapi.V1.VersesController do
  use Heartversesapi.Web, :controller

  alias Heartversesapi.Verses

  plug :scrub_params, "verses" when action in [:create, :update]
  plug :action

  def index(conn, %{"book" => book, "chapter" => chapter, "verse" => verse}) do
    verses = Repo.all(from v in Verses,
                      where: fragment("LOWER(?) = LOWER(?)", v.book, ^book),
                      where: v.chapter == ^chapter,
                      where: v.verse == ^verse)
    render(conn, "index.json", verses: verses)
  end

  def index(conn, %{"book" => book, "chapter" => chapter, "verse_start" => verse_start, "verse_end" => verse_end}) do
    verses = Repo.all(from v in Verses,
                      where: v.book == ^book,
                      where: v.chapter == ^chapter,
                      where: v.verse >= ^verse_start,
                      where: v.verse <= ^verse_end)

    render(conn, "index.json", verses: verses)
  end
  #
  # def create(conn, %{"kjv" => kjv_params}) do
  #   changeset = KJV.changeset(%KJV{}, kjv_params)
  #
  #   if changeset.valid? do
  #     kjv = Repo.insert!(changeset)
  #     render(conn, "show.json", kjv: kjv)
  #   else
  #     conn
  #     |> put_status(:unprocessable_entity)
  #     |> render(Heartversesapi.ChangesetView, "error.json", changeset: changeset)
  #   end
  # end
  #
  # def show(conn, %{"id" => id}) do
  #   kjv = Repo.get(KJV, id)
  #   render conn, "show.json", kjv: kjv
  # end
  #
  # def update(conn, %{"id" => id, "kjv" => kjv_params}) do
  #   kjv = Repo.get(KJV, id)
  #   changeset = KJV.changeset(kjv, kjv_params)
  #
  #   if changeset.valid? do
  #     kjv = Repo.update!(changeset)
  #     render(conn, "show.json", kjv: kjv)
  #   else
  #     conn
  #     |> put_status(:unprocessable_entity)
  #     |> render(Heartversesapi.ChangesetView, "error.json", changeset: changeset)
  #   end
  # end
  #
  # def delete(conn, %{"id" => id}) do
  #   kjv = Repo.get(KJV, id)
  #
  #   kjv = Repo.delete!(kjv)
  #   render(conn, "show.json", kjv: kjv)
  # end
  #
  # def fetch(conn, %{"book" => book, "chapter" => chapter, "verse" => verse}) do
  #   kjv = Repo.all(from v in KJV,
  #                  where: v.verse == ^verse)
  #   render(conn, "show.json", kjv: kjv)
  # end
end
