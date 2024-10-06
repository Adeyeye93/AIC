defmodule YedeiWeb.OwnerLiveTest do
  use YedeiWeb.ConnCase

  import Phoenix.LiveViewTest
  import Yedei.ProfileFixtures

  @create_attrs %{location: "some location", profile_picture: "some profile_picture", Role: "some Role", Bio: "some Bio", Categories: ["option1", "option2"], Account_Status: ["option1", "option2"]}
  @update_attrs %{location: "some updated location", profile_picture: "some updated profile_picture", Role: "some updated Role", Bio: "some updated Bio", Categories: ["option1"], Account_Status: ["option1"]}
  @invalid_attrs %{location: nil, profile_picture: nil, Role: nil, Bio: nil, Categories: [], Account_Status: []}

  defp create_owner(_) do
    owner = owner_fixture()
    %{owner: owner}
  end

  describe "Index" do
    setup [:create_owner]

    test "lists all owners", %{conn: conn, owner: owner} do
      {:ok, _index_live, html} = live(conn, ~p"/owners")

      assert html =~ "Listing Owners"
      assert html =~ owner.location
    end

    test "saves new owner", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/owners")

      assert index_live |> element("a", "New Owner") |> render_click() =~
               "New Owner"

      assert_patch(index_live, ~p"/owners/new")

      assert index_live
             |> form("#owner-form", owner: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#owner-form", owner: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/owners")

      html = render(index_live)
      assert html =~ "Owner created successfully"
      assert html =~ "some location"
    end

    test "updates owner in listing", %{conn: conn, owner: owner} do
      {:ok, index_live, _html} = live(conn, ~p"/owners")

      assert index_live |> element("#owners-#{owner.id} a", "Edit") |> render_click() =~
               "Edit Owner"

      assert_patch(index_live, ~p"/owners/#{owner}/edit")

      assert index_live
             |> form("#owner-form", owner: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#owner-form", owner: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/owners")

      html = render(index_live)
      assert html =~ "Owner updated successfully"
      assert html =~ "some updated location"
    end

    test "deletes owner in listing", %{conn: conn, owner: owner} do
      {:ok, index_live, _html} = live(conn, ~p"/owners")

      assert index_live |> element("#owners-#{owner.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#owners-#{owner.id}")
    end
  end

  describe "Show" do
    setup [:create_owner]

    test "displays owner", %{conn: conn, owner: owner} do
      {:ok, _show_live, html} = live(conn, ~p"/owners/#{owner}")

      assert html =~ "Show Owner"
      assert html =~ owner.location
    end

    test "updates owner within modal", %{conn: conn, owner: owner} do
      {:ok, show_live, _html} = live(conn, ~p"/owners/#{owner}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Owner"

      assert_patch(show_live, ~p"/owners/#{owner}/show/edit")

      assert show_live
             |> form("#owner-form", owner: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#owner-form", owner: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/owners/#{owner}")

      html = render(show_live)
      assert html =~ "Owner updated successfully"
      assert html =~ "some updated location"
    end
  end
end
