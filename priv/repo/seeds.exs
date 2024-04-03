alias Megin.Repo

alias Megin.Accounts.User
alias Megin.Communications.Chat
alias Megin.Communications.Message
alias Megin.Communications.Participant

Repo.insert(%User{
  name: "John Field",
  password: "123456",
  email: "john@gmail.com"
})

Repo.insert(%Chat{})

user_uuid = User |> Repo.all() |> Enum.at(0) |> Map.get(:uuid)
chat_uuid = Chat |> Repo.all() |> Enum.at(0) |> Map.get(:uuid)

Repo.insert(%Participant{
  chat: chat_uuid,
  user: user_uuid
})

Repo.insert(%Message{
  content: "Send a message.",
  sender: user_uuid,
  chat: chat_uuid
})
