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
    render(conn, :team)
  end

  def vision(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :vision)
  end

  def products(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :products)
  end
end
