defmodule UrlRestWeb.IndexControllerTest do
  use UrlRestWeb.ConnCase

  alias UrlRest.Url
  alias UrlRest.Url.Index

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:index) do
    {:ok, index} = Url.create_index(@create_attrs)
    index
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all index", %{conn: conn} do
      conn = get conn, index_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create index" do
    test "renders index when data is valid", %{conn: conn} do
      conn = post conn, index_path(conn, :create), index: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, index_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, index_path(conn, :create), index: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update index" do
    setup [:create_index]

    test "renders index when data is valid", %{conn: conn, index: %Index{id: id} = index} do
      conn = put conn, index_path(conn, :update, index), index: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, index_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, index: index} do
      conn = put conn, index_path(conn, :update, index), index: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete index" do
    setup [:create_index]

    test "deletes chosen index", %{conn: conn, index: index} do
      conn = delete conn, index_path(conn, :delete, index)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, index_path(conn, :show, index)
      end
    end
  end

  defp create_index(_) do
    index = fixture(:index)
    {:ok, index: index}
  end
end
