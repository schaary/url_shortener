defmodule UrlRest.Url.Index do
  use Ecto.Schema
  import Ecto.Changeset


  schema "index" do

    timestamps()
  end

  @doc false
  def changeset(index, attrs) do
    index
    |> cast(attrs, [])
    |> validate_required([])
  end
end
