# defmodule Yedei.Account.Vcode do
#   import Ecto.Changeset
#   use Yedei.Schema
#   alias Yedei.Account.{Vcode, User}

# embedded_schema do
#     field :v_code, :binary
#     field :used, :boolean, default: false
#     field :expired, :boolean, default: false


#     timestamps()
#   end

#   @doc false
#   def changeset(profile, attrs \\ %{}) do
#     profile
#     |> cast(attrs, [:v_code, :used, :expired])
#   end


#  def confirm_pin(code, %User{vcode: %Vcode{v_code: v_code, updated_at: updated_at}}) do
#     current_time = NaiveDateTime.utc_now()
#     ten_minutes_ago = NaiveDateTime.add(current_time, -600)

#     case Base.decode64(v_code) do
#       {:ok, decoded_v_code} ->
#         if code == decoded_v_code do
#           if NaiveDateTime.compare(updated_at, ten_minutes_ago) == :gt do
#              :correct
#           else
#             :expired
#           end
#         else
#           :Incorrect
#         end

#       :error ->
#         {:error, "Failed to decode v_code"}
#     end
#   end

# end
