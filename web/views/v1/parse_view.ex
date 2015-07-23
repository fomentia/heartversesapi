defmodule Heartversesapi.V1.ParseView do
  use Heartversesapi.Web, :view

  def render("index.json", %{parsed_passage: parsed_passage}) do
    %{:passage => parsed_passage}
  end

end
