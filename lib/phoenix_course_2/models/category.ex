defmodule PhoenixCourse2.Category do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias PhoenixCourse2.Repo

  schema "categories" do
    field(:name, :string)
    timestamps()
  end

  def changeset(struct, attr) do
    cast(struct, attr, [:name])
  end

  def new_changeset(struct \\ %__MODULE__{}) do
    cast(struct, %{}, [])
  end

  def all() do
    Repo.all(__MODULE__)
  end

  def create(params) do
    %__MODULE__{}
    |> changeset(params)
    |> Repo.insert()
  end

  def get(id) do
    Repo.get!(__MODULE__, id)
  end

  def update(id, attr) do
    id
    |> get()
    |> changeset(attr)
    |> Repo.update!()
  end

  def delete(id) do
    Repo.transaction(fn ->
      id
      |> get()
      |> Repo.delete!()
    end)
  end
end
