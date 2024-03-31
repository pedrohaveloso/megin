defmodule MeginWeb.Router do
  use MeginWeb, :router

  post "/message" do
    conn |> MeginWeb.MessageController.create()
  end
end
