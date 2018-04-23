defmodule UrlRestWeb.IndexView do
  use UrlRestWeb, :view
  alias UrlRestWeb.IndexView

  def render("index.json", string) do
    %{data: render_many(string, IndexView, "index.json")}
  end

  def render("show.json", %{index: index}) do
    %{data: render_one(index, IndexView, "index.json")}
  end

  def render("index.json", %{index: index}) do
    %{id: index.id}
  end
end
