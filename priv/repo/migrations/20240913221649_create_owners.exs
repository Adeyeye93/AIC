defmodule Yedei.Repo.Migrations.CreateOwners do
  use Ecto.Migration

  def change do
    create table(:owners) do
      add :profile_picture, :string
      add :Role, :string
      add :Bio, :string
      add :location, :string
      add :Categories, {:array, :string}
      add :Account_Status, {:array, :string}
      add :owner_id, references(:users, on_delete: :nothing), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:owners, [:owner_id])
  end
end
