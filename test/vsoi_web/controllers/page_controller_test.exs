defmodule VsoiWeb.PageControllerTest do
  use VsoiWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Verde Smart Organiku International"
  end

  test "GET /vision", %{conn: conn} do
    conn = get(conn, ~p"/vision")
    assert html_response(conn, 200) =~ "highest quality organic food"
  end

  test "GET /team", %{conn: conn} do
    conn = get(conn, ~p"/team")
    assert html_response(conn, 200) =~ "Eka Mardiarti"
  end

  test "GET /products", %{conn: conn} do
    conn = get(conn, ~p"/products")
    assert html_response(conn, 200) =~ "Onions"
  end
end
