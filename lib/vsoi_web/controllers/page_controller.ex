defmodule VsoiWeb.PageController do
  use VsoiWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def home2(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home2, layout: false)
  end

  def team(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :team, layout: false)
  end

  def vision(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :vision, layout: false)
  end

  def eka_card(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :eka_card)
  end

  def dercia_card(conn, _params) do
    render(conn, :dercia_card)
  end

  def products(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :products, layout: false)
  end
end
