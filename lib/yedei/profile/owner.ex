defmodule Yedei.Profile.Owner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "owners" do
    field :location, :string
    field :profile_picture, :string
    field :Role, :string
    field :Bio, :string
    field :Categories, {:array, :string}
    field :Account_Status, {:array, :string}
    field :owner_id, :id

    belongs_to :user, Yedei.Account.User
    timestamps(type: :utc_datetime)
    
  end

  @doc false
  def changeset(owner, attrs) do
    owner
    |> cast(attrs, [:profile_picture, :Role, :Bio, :location, :Categories, :Account_Status])
    |> validate_required([:owner_id])
  end
end
