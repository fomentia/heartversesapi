defmodule Heartversesapi.V1.ParseView do
  use Heartversesapi.Web, :view

  def render("index.json", %{}) do
    "hello"
  end

end
