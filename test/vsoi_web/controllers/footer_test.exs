defmodule VsoiWeb.FooterTest do
  use VsoiWeb.ConnCase

  test "products page does not have duplicate footer", %{conn: conn} do
    conn = get(conn, ~p"/products")
    html = html_response(conn, 200)

    # Count footer occurrences
    footer_count =
      html
      |> String.split("<footer")
      |> length()
      |> Kernel.-(1)  # Subtract 1 because split creates n+1 parts for n occurrences

    assert footer_count <= 1, "Found #{footer_count} footers, expected only 1"
  end

  test "vision page does not have duplicate footer", %{conn: conn} do
    conn = get(conn, ~p"/vision")
    html = html_response(conn, 200)

    # Count footer occurrences
    footer_count =
      html
      |> String.split("<footer")
      |> length()
      |> Kernel.-(1)

    assert footer_count <= 1, "Found #{footer_count} footers, expected only 1"
  end

  test "home page does not have duplicate footer", %{conn: conn} do
    conn = get(conn, ~p"/")
    html = html_response(conn, 200)

    # Count footer occurrences
    footer_count =
      html
      |> String.split("<footer")
      |> length()
      |> Kernel.-(1)

    assert footer_count <= 1, "Found #{footer_count} footers, expected only 1"
  end
end