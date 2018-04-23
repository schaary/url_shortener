defmodule US.Repo.Migrations.CreateRegistry do
  use Ecto.Migration

  def change do
    create table(:registry) do
      add :url, :string
      add :short, :string

      timestamps()
    end

    create index(:registry, [:url], unique: true)
    create index(:registry, [:short], unique: true)

  end
end
