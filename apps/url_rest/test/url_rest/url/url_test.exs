defmodule UrlRest.UrlTest do
  use UrlRest.DataCase

  alias UrlRest.Url

  describe "index" do
    alias UrlRest.Url.Index

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def index_fixture(attrs \\ %{}) do
      {:ok, index} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Url.create_index()

      index
    end

    test "list_index/0 returns all index" do
      index = index_fixture()
      assert Url.list_index() == [index]
    end

    test "get_index!/1 returns the index with given id" do
      index = index_fixture()
      assert Url.get_index!(index.id) == index
    end

    test "create_index/1 with valid data creates a index" do
      assert {:ok, %Index{} = index} = Url.create_index(@valid_attrs)
    end

    test "create_index/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Url.create_index(@invalid_attrs)
    end

    test "update_index/2 with valid data updates the index" do
      index = index_fixture()
      assert {:ok, index} = Url.update_index(index, @update_attrs)
      assert %Index{} = index
    end

    test "update_index/2 with invalid data returns error changeset" do
      index = index_fixture()
      assert {:error, %Ecto.Changeset{}} = Url.update_index(index, @invalid_attrs)
      assert index == Url.get_index!(index.id)
    end

    test "delete_index/1 deletes the index" do
      index = index_fixture()
      assert {:ok, %Index{}} = Url.delete_index(index)
      assert_raise Ecto.NoResultsError, fn -> Url.get_index!(index.id) end
    end

    test "change_index/1 returns a index changeset" do
      index = index_fixture()
      assert %Ecto.Changeset{} = Url.change_index(index)
    end
  end
end
