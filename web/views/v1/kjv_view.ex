defmodule Heartversesapi.V1.KJVView do
  use Heartversesapi.Web, :view

  def render("index.json", %{verses: verses}) do
    verses
    # %{data: render_many(verses, Heartversesapi.V1.KJVView, "kjv.json")}
  end

  def render("show.json", %{kjv: kjv}) do
    %{data: render_one(kjv, Heartversesapi.V1.KJVView, "kjv.json")}
  end

  def render("kjv.json", %{kjv: kjv}) do
    %{id: kjv.id}
  end
end
