defmodule MeginWeb.UserController do
  alias Megin.Accounts

  use MeginWeb, :controller

  def create(conn) do
    with {:ok, body} <- read_json_body(conn),
         {:ok, struct} <- Accounts.create_user(body) do
      send_json_resp(conn, 200, struct)
    else
      {:error, _reason} ->
        send_json_resp(conn, 400, %{reason: "Invalid data."})
    end
  end
end
