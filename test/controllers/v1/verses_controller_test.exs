defmodule Heartversesapi.V1.VersesControllerTest do
  use Heartversesapi.ConnCase

  alias Heartversesapi.Verses
  @valid_attrs %{translation: "KJV", book: "Genesis", chapter: 1, verse: 1, text: "In the beginning God created the heaven and the earth."}
  @invalid_attrs %{translation: "badd stuff", book: "candyland", chapter: 8888888, verse: -1, text: "wuzzup"}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end
end
