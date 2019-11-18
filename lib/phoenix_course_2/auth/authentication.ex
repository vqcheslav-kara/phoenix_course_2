defmodule PhoenixCourse2.Authentication do
  alias PhoenixCourse2.User

  def authenticate_user(email, password) do
    case User.get_by_email(email) do
      nil ->
        Bcrypt.no_user_verify()
        {:error, :invalid_credentials}

      %User{password: user_password} = user ->
        case verify_pass(password, user_password) do
          true ->
            {:ok, user}

          false ->
            {:error, :invalid_credentials}
        end
    end
  end

  defp verify_pass(request_password, user_password) do
    Bcrypt.verify_pass(request_password, user_password)
  end
end
