defmodule MeginWeb do
  defmacro __using__(using) when is_atom(using) do
    apply(__MODULE__, using, [])
  end

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

      def read_json_body(conn) do
        with {:ok, body, _conn} <- read_body(conn),
             {:ok, decoded_body} <- Jason.decode(body) do
          {:ok, decoded_body}
        else
          {:error, reason} ->
            {:error, "Invalid JSON body."}
        end
      end
    end
  end
end
