defmodule PhoenixCourse2Web.CategoryController do
  use PhoenixCourse2Web, :controller
  alias PhoenixCourse2.Category

  def index(conn, _params) do
    categories = Category.all()
    render(conn, "index.html", categories: categories)
  end

  def new(conn, _) do
    changeset = Category.new_changeset()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"category" => attr}) do
    Category.create(attr)

    conn
    |> put_flash(:info, "Category created!")
    |> redirect(to: Routes.category_path(conn, :index))
  end

  def edit(conn, %{"id" => id}) do
    category = Category.get(id)
    changeset = Category.new_changeset(category)

    render(conn, "edit.html", category: category, changeset: changeset)
  end

  def update(conn, %{"category" => attr, "id" => id}) do
    Category.update(id, attr)

    conn
    |> put_flash(:info, "Category updated!")
    |> redirect(to: Routes.category_path(conn, :index))
  end

  def delete(conn, %{"id" => id}) do
    Category.delete(id)

    conn
    |> put_flash(:info, "Category deleted!")
    |> redirect(to: Routes.category_path(conn, :index))
  end
end
