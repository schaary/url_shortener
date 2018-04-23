defmodule US.UrlShortener do
  @moduledoc """
  The main funktions to shorten an url
  """

  @doc """
  Shorten an valid url

  The function first checks, whether the given url is syntactically a valid url.
  A syntactically valid url must contain the protocol type (http or https) and
  a slash at the end of the url.

  ## Examples

      https://www.google.com/     # good
      http://google.com/          # good

      www.google.com              # bad
      https://www.google.com      # bad

  If not - the empty string gets returned.
  If the url is valid, a short string gets returned.

  ## Examples

      iex> US.get_short("https://www.google.com/")
      "https:foo/baRbaZ"

  """
  def get_short(url) do
    is_valid = US.Validator.validate_url(url)

    case is_valid do
      {:ok, _} -> US.Dispatcher.get_short(url)
      {:error, _} -> %{url: url, short: nil}
    end
  end
end
