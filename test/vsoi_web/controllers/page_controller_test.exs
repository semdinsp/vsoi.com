defmodule VsoiWeb.PageControllerTest do
  use VsoiWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Verde Smart Organiku International"
  end

  test "GET /vision", %{conn: conn} do
    conn = get(conn, ~p"/vision")
    assert html_response(conn, 200) =~ "highest quality organic"
  end

  test "GET /team", %{conn: conn} do
    conn = get(conn, ~p"/team")
    assert html_response(conn, 200) =~ "Eka Mardiarti"
  end

  test "GET /products", %{conn: conn} do
    conn = get(conn, ~p"/products")
    assert html_response(conn, 200) =~ "Broccoli"
  end

  test "GET /home2", %{conn: conn} do
    conn = get(conn, ~p"/home2")
    assert html_response(conn, 200) =~ "Welcome to our Organic Food Business"
  end

  test "GET /eka_card", %{conn: conn} do
    conn = get(conn, ~p"/eka_card")
    assert html_response(conn, 200) =~ "Eka Mardiarti"
  end

  test "GET /dercia_card", %{conn: conn} do
    conn = get(conn, ~p"/dercia_card")
    assert html_response(conn, 200) =~ "Dircia Maria Da Costa"
  end
end
