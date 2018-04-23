defmodule UrlRest.Repo.Migrations.CreateIndex do
  use Ecto.Migration

  def change do
    create table(:index) do

      timestamps()
    end

  end
end
