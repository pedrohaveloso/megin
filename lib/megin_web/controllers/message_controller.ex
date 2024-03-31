defmodule MeginWeb.MessageController do
  use MeginWeb, :controller

  def create(conn) do
    conn |> send_resp(200, "hello")
  end
end
