defmodule PhoenixCourse2Web.RegisterController do
  use PhoenixCourse2Web, :controller

  def new(conn, _params) do
    conn
    |> render("new.html", errors: [])
  end

  def create(conn, params) do
    case PhoenixCourse2.User.create(params) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "Registered!")
        |> redirect(to: Routes.login_path(conn, :new))

      {:error, %Ecto.Changeset{errors: errors}} ->
        conn
        |> render("new.html", errors: errors)
    end
  end
end
