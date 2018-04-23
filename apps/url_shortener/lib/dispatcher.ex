defmodule US.Dispatcher do

  alias US.{
    RegistryCommands,
    RegistryQueries,
    RandomString
  }

  def get_short(url) do

    %{short: short, url: url} = RegistryQueries.by_url(url)

    short = case short do
              nil ->
                random_string = RandomString.random_string()
                RegistryCommands.put(url, random_string)
                random_string
              _ ->
                short
            end

    %{url: url, short: short}
  end

  def get_url(short) do
    RegistryQueries.by_short(short)
  end
end
