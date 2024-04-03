defmodule Megin.Communications do
  import Ecto.Query, warn: false

  alias Megin.Repo
  alias Megin.Communications.Message

  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  def get_messages(chat) do
    Message
    |> where(chat: ^chat)
    |> Repo.all()
  end
end
