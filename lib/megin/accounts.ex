defmodule Megin.Accounts do
  import Ecto.Query, warn: false

  alias Megin.Repo
  alias Megin.Accounts.User

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
