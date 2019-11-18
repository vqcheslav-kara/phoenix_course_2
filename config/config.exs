# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_course_2,
  ecto_repos: [PhoenixCourse2.Repo]

# Configures the endpoint
config :phoenix_course_2, PhoenixCourse2Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QDl+ehqvyLTjIhUHQkvaHMcQzohcDHp4hq9CorXhBJFTiDI7BTONoa4KGx1Mptu2",
  render_errors: [view: PhoenixCourse2Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixCourse2.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix_course_2, PhoenixCourse2.Guardian,
  issuer: "phoenix_course_2",
  secret_key: "gp8NlMQQ+NY5xj5bP01kNqlQRo9sEcNNWe3U8VZW/JBeMyPQaNBtAjXwPqVCESpT"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
