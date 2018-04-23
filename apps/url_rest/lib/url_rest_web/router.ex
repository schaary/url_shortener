defmodule UrlRestWeb.Router do
  use UrlRestWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UrlRestWeb do
    pipe_through :api

    resources "/", IndexController, only: [:show, :create]
  end
end
