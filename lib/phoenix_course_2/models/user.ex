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
    |> put_password_hash()
    |> IO.inspect()
  end

  def create(params) do
    %__MODULE__{}
    |> changeset(params)
    |> Repo.insert()
  end

  def put_password_hash(%{valid?: true, changes: %{password: password}} = changeset) do
    put_change(changeset, :password, Bcrypt.hash_pwd_salt(password))
  end

  def put_password_hash(changeset) do
    changeset
  end

  def get_user(id) do
    Repo.get(__MODULE__, id)
  end

  def get_by_email(email) do
    Repo.get_by(__MODULE__, email: email)
  end
end
