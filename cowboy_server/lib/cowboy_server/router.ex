defmodule CowboyServer.Router do
  require Logger

  alias CowboyServer.Router.Handlers.{Root, Greet, Static}

  def routes do
    [
      {:_,
       [
         {"/", Root, []},
         {"/greet/:who", [who: :nonempty], Greet, []},
         {"/static/:page", [page: :nonempty], Static, []}
       ]}
    ]
  end
end
