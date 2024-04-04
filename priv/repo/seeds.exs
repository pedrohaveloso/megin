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

user = User |> Repo.all() |> Enum.at(0)
chat = Chat |> Repo.all() |> Enum.at(0)

Repo.insert(%Participant{
  chat: chat,
  user: user
})

Repo.insert(%Message{
  content: "Send a message.",
  user: user,
  chat: chat
})
