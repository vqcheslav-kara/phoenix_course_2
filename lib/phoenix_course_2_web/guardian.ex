defmodule PhoenixCourse2.Guardian do
  use Guardian, otp_app: :phoenix_course_2

  alias PhoenixCourse2.User

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(%{"sub" => id}) do
    case User.get_user(id) do
      nil -> {:error, :resource_not_found}
      user -> {:ok, user}
    end
  end
end
