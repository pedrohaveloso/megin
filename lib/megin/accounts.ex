defmodule Megin.Accounts do
  import Ecto.Query, warn: false

  alias Megin.Accounts.{Session, User}
  alias Megin.Repo

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> password_argon2()
    |> Repo.insert()
  end

  defp password_argon2(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    Ecto.Changeset.change(
      changeset,
      password: Argon2.hash_pwd_salt(password)
    )
  end

  def get_user(%{"email" => email}) do
    Repo.get_by(User, email: email)
  end

  def create_session(attrs \\ %{}) do
    attrs = Map.put(attrs, "user", Repo.get(User, attrs["user"]))

    attrs |> IO.inspect()

    %Session{}
    |> Session.changeset(attrs)
    |> Repo.insert()
    |> IO.inspect()
  end
end
