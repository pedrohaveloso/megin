defmodule MeginWeb.Router do
  use MeginWeb, :router

  post "/users" do
    conn |> MeginWeb.UserController.create()
  end

  get "/users" do
    conn |> MeginWeb.UserController.get()
  end

  post "/sessions" do
    conn |> MeginWeb.SessionController.create()
  end

  post "/messages" do
    conn |> MeginWeb.MessageController.create()
  end
end
