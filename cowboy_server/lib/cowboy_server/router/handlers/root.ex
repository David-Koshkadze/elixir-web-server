defmodule CowboyServer.Router.Handlers.Root do
  require Logger

  def init(%{method: "GET"} = req0, state) do
    Logger.info("Received request: #{inspect(req0)}")

    req1 =
      :cowboy_req.reply(
        200,
        %{"content-type" => "text/html"},
        "Hello World",
        req0
      )

    {:ok, req1, state}
  end

  @doc """
  General clause for 404 error
  """
  def init(req0, state) do
    Logger.info("Received request: #{inspect(req0)}")

    req1 =
      :cowboy_req.reply(
        404,
        %{"content-type" => "text/html"},
        "404 Not Found",
        req0
      )

    {:ok, req1, state}
  end
end
