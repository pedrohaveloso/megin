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

      def send_json_resp(conn, status, body) do
        Jason.encode(body) |> IO.inspect()

        case Jason.encode(body) do
          {:ok, encoded_body} ->
            send_resp(conn, status, encoded_body)

          {:error, _reason} ->
            send_resp(conn, 500, "JSON encode error.")
        end
      end
    end
  end
end
