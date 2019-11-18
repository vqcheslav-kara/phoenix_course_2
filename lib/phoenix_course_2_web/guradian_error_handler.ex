defmodule PhoenixCourse2Web.GuardianErrorHandler do
  import Plug.Conn
  use PhoenixCourse2Web, :controller
  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, _, _opts) do
    redirect(conn, to: Routes.login_path(conn, :new))
  end
end
