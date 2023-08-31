defmodule CowboyServer.Router do
  require Logger

  alias CowboyServer.Router.Handlers.{Root, Greet}

  def routes do
    [
      {:_, [
        {"/", Root, []},
        {"/greet/:who", [who: :nonempty], Greet, []}
      ]}
    ]
  end
end
