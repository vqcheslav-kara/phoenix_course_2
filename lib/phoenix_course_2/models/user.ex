defmodule PhoenixCourse2.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias PhoenixCourse2.Repo

  schema "users" do
    field(:name, :string)
    field(:email, :string)
    field(:password, :string)
  end

  def changeset(struct, attr) do
    struct
    |> cast(attr, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> validate_length(:name, min: 3, max: 100)
    |> validate_length(:password, min: 3, max: 100)
    |> validate_confirmation(:password, message: "Passwords not match")
  end

  def create(params) do
    %__MODULE__{}
    |> changeset(params)
    |> Repo.insert()
  end
end
