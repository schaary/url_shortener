defmodule US.Validator do

  @doc """
  somehow validate a url

  check the syntax of an url. The url must end with a slash
  TODO: make it work without a slash at the end
  """
  def validate_url(url) do
    uri = URI.parse(url)

    case uri do
      %URI{scheme: nil} -> {:error, uri}
      %URI{host: nil} -> {:error, uri}
      %URI{path: nil} -> {:error, uri}
      uri -> {:ok, uri}
    end
  end
end
