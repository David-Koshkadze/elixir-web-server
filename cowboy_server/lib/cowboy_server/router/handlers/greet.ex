defmodule CowboyServer.Router.Handlers.Greet do
  require Logger

  def init(req0, state) do
    Logger.info("Received request: #{inspect(req0)}")

    who = :cowboy_req.binding(:who, req0)

    # custom query parameter

    # curl http://localhost:5050/greet/Elixir\?greeting=Gamarjoba

    greeting =
      req0
      |> :cowboy_req.parse_qs()
      |> Enum.into(%{})
      |> Map.get("greeting", @default_greeting)

    req1 =
      :cowboy_req.reply(
        200,
        %{"content-type" => "text/html"},
        "#{greeting} #{who}",
        req0
      )

    {:ok, req1, state}
  end
end
