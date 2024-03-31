defmodule MeginWeb do
  def router do
    quote do
      use Plug.Router

      plug(:match)
      plug(:dispatch)
    end
  end

  def controller do
    quote do
      import Plug.Conn
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
