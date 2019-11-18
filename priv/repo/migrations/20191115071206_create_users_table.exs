defmodule PhoenixCourse2.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table("users") do
      add(:name, :text, null: false)
      add(:email, :text, null: false)
      add(:password, :text, null: false)
    end
  end
end
