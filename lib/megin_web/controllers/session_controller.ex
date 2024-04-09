defmodule MeginWeb.SessionController do
  use MeginWeb, :controller

  alias Megin.Accounts

  def create(conn) do
    with {:ok, body} <- read_json_body(conn),
         {:ok, struct} <- Accounts.create_session(body) do
      send_json_resp(conn, 200, struct)
    else
      {:error, _reason} ->
        send_json_resp(conn, 400, %{reason: "Invalid data."})
    end
  end
end
