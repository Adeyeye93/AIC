defmodule Yedei.ProfileFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Yedei.Profile` context.
  """

  @doc """
  Generate a owner.
  """
  def owner_fixture(attrs \\ %{}) do
    {:ok, owner} =
      attrs
      |> Enum.into(%{
        Account_Status: ["option1", "option2"],
        Bio: "some Bio",
        Categories: ["option1", "option2"],
        Role: "some Role",
        location: "some location",
        profile_picture: "some profile_picture"
      })
      |> Yedei.Profile.create_owner()

    owner
  end
end
