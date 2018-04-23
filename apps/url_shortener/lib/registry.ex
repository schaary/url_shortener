defmodule US.Registry do
  @moduledoc """
  A place to collect all the methods to store the urls and the short urls
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "registry" do
    field :url, :string
    field :short, :string

    timestamps()
  end

  def changeset(registry, params \\ %{}) do
    registry
    |> cast(params, [:url, :short])
    |> unique_constraint(:url)
    |> unique_constraint(:short)
  end

end
