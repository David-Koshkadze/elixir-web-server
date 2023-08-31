defmodule CowboyServer.Router do
  require Logger

  def routes do
    {:_, [{"/", __Module__, []}]}
  end

  def init(req0, state) do
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
end
