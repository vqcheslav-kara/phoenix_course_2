defmodule PhoenixCourse2Web.GuardianPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :phoenix_course_2,
    error_handler: PhoenixCourse2Web.GuardianErrorHandler,
    module: PhoenixCourse2.Guardian

  # If there is a session token, restrict it to an access token and validate it
  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  # If there is an authorization header, restrict it to an access token and validate it
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  # Load the user if either of the verifications worked
  plug Guardian.Plug.LoadResource, allow_blank: true
end
