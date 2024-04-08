defmodule Megin.Accounts do
  import Ecto.Query, warn: false

  alias Megin.Repo
  alias Megin.Accounts.User

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def get_user(%{"email" => email}) do
    Repo.get_by(User, email: email)
  end
end
