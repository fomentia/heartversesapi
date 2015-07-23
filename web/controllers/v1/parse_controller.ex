defmodule Heartversesapi.V1.ParseController do
  use Heartversesapi.Web, :controller

  plug :action

  def index(conn, _params) do
    render(conn, "index.json")
  end
end
