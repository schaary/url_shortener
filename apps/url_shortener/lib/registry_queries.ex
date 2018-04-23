defmodule US.RegistryQueries do

  @moduledoc """
  All kind of queries around the registry
  """

  alias US.Repo
  alias US.Registry

  import Ecto.Query

  @doc """
  Find the short string for the given url.
  """
  def by_url(url) do
    r = Registry
        |> where([r], r.url == ^url)
        |> select([:short])
        |> Repo.one

    case r do
      nil -> %{url: url, short: nil}
      _ -> %{url: url, short: r.short}
    end
  end

  @doc """
  Find the url to the given short string
  """
  def by_short(short) do
    r = Registry
    |> where([r], r.short == ^short)
    |> select([:url])
    |> Repo.one

    case r do
      nil -> %{url: nil, short: short}
      _ -> %{url: r.url, short: short}
    end
  end
end
