defmodule PhoenixCourse2Web.LoginController do
  use PhoenixCourse2Web, :controller
  alias PhoenixCourse2.{Authentication, Guardian}

  def new(conn, _params) do
    conn
    |> render("new.html", errors: [])
  end

  def create(conn, %{"password" => password, "email" => email}) do
    case Authentication.authenticate_user(email, password) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome!")
        |> Guardian.Plug.sign_in(user)
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, _} ->
        conn
        |> put_flash(:error, "Invalid credentials!")
        |> render("new.html", errors: [])
    end
  end
end
