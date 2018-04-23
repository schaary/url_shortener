defmodule UrlRestWeb.IndexController do
  use UrlRestWeb, :controller

  alias UrlRest.Url
  alias UrlRest.Url.Index

  action_fallback UrlRestWeb.FallbackController


  def create(conn, %{"index" => index_params}) do
    with {:ok, %Index{} = index} <- Url.create_index(index_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", index_path(conn, :show, index))
      |> render("show.json", index: index)
    end
  end

  def show(conn, %{"id" => id}) do
    index = US.Dispatcher.get_url(id)
    render(conn, "show.json", index: index) 
  end

end
