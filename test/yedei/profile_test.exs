defmodule Yedei.ProfileTest do
  use Yedei.DataCase

  alias Yedei.Profile

  describe "owners" do
    alias Yedei.Profile.Owner

    import Yedei.ProfileFixtures

    @invalid_attrs %{location: nil, profile_picture: nil, Role: nil, Bio: nil, Categories: nil, Account_Status: nil}

    test "list_owners/0 returns all owners" do
      owner = owner_fixture()
      assert Profile.list_owners() == [owner]
    end

    test "get_owner!/1 returns the owner with given id" do
      owner = owner_fixture()
      assert Profile.get_owner!(owner.id) == owner
    end

    test "create_owner/1 with valid data creates a owner" do
      valid_attrs = %{location: "some location", profile_picture: "some profile_picture", Role: "some Role", Bio: "some Bio", Categories: ["option1", "option2"], Account_Status: ["option1", "option2"]}

      assert {:ok, %Owner{} = owner} = Profile.create_owner(valid_attrs)
      assert owner.location == "some location"
      assert owner.profile_picture == "some profile_picture"
      assert owner.Role == "some Role"
      assert owner.Bio == "some Bio"
      assert owner.Categories == ["option1", "option2"]
      assert owner.Account_Status == ["option1", "option2"]
    end

    test "create_owner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_owner(@invalid_attrs)
    end

    test "update_owner/2 with valid data updates the owner" do
      owner = owner_fixture()
      update_attrs = %{location: "some updated location", profile_picture: "some updated profile_picture", Role: "some updated Role", Bio: "some updated Bio", Categories: ["option1"], Account_Status: ["option1"]}

      assert {:ok, %Owner{} = owner} = Profile.update_owner(owner, update_attrs)
      assert owner.location == "some updated location"
      assert owner.profile_picture == "some updated profile_picture"
      assert owner.Role == "some updated Role"
      assert owner.Bio == "some updated Bio"
      assert owner.Categories == ["option1"]
      assert owner.Account_Status == ["option1"]
    end

    test "update_owner/2 with invalid data returns error changeset" do
      owner = owner_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_owner(owner, @invalid_attrs)
      assert owner == Profile.get_owner!(owner.id)
    end

    test "delete_owner/1 deletes the owner" do
      owner = owner_fixture()
      assert {:ok, %Owner{}} = Profile.delete_owner(owner)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_owner!(owner.id) end
    end

    test "change_owner/1 returns a owner changeset" do
      owner = owner_fixture()
      assert %Ecto.Changeset{} = Profile.change_owner(owner)
    end
  end
end
