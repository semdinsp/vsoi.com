defmodule VsoiWeb.PageController do
  use VsoiWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def home2(conn, _params) do
    render(conn, :home2)
  end

  def team(conn, _params) do
    render(conn, :team)
  end

  def vision(conn, _params) do
    render(conn, :vision)
  end

  def eka_card(conn, _params) do
    render(conn, :eka_card)
  end

  def dercia_card(conn, _params) do
    render(conn, :dercia_card)
  end

  def products(conn, _params) do
    render(conn, :products)
  end
end
