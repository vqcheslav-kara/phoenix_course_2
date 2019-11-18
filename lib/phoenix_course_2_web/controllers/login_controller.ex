defmodule PhoenixCourse2Web.LoginController do
  use PhoenixCourse2Web, :controller

  def new(conn, _params) do
    conn
    |> render("new.html", errors: [])
  end

  def create(conn, params) do
  end
end
