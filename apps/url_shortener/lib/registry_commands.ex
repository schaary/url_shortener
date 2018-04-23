defmodule US.RegistryCommands do

  require US.Registry
  require US.RegistryQueries


  def put(url, short) do

    changeset = US.Registry.changeset(%US.Registry{}, %{url: url, short: short})
    {return_code, _} = US.Repo.insert(changeset)

    :ok
  end
end
