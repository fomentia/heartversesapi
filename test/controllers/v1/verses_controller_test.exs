defmodule Heartversesapi.V1.VersesControllerTest do
  use Heartversesapi.ConnCase

  alias Heartversesapi.Verses
  @valid_attrs %{book: "some content", chapter: 42, verse: 42, text: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, v1_kjv_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    kjv = Repo.insert! %Verses{}
    conn = get conn, v1_kjv_path(conn, :show, kjv)
    assert json_response(conn, 200)["data"] == %{
      "id" => kjv.id
    }
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, v1_kjv_path(conn, :create), kjv: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Verses, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, v1_kjv_path(conn, :create), kjv: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    kjv = Repo.insert! %Verses{}
    conn = put conn, v1_kjv_path(conn, :update, kjv), kjv: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Verses, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    kjv = Repo.insert! %Verses{}
    conn = put conn, v1_kjv_path(conn, :update, kjv), kjv: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    kjv = Repo.insert! %Verses{}
    conn = delete conn, v1_kjv_path(conn, :delete, kjv)
    assert json_response(conn, 200)["data"]["id"]
    refute Repo.get(Verses, kjv.id)
  end
end
