defmodule MeginWeb.Router do
  use MeginWeb, :router

  post "/users" do
    conn |> MeginWeb.UserController.create()
  end

  post "/message" do
    conn |> MeginWeb.MessageController.create()
  end
end
