defmodule CrocodilePear.RouterGenServer do
  use GenServer
  
  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end
  
  def init(_args) do
    port = Application.get_env(:crocodile_pear, :port, 4000)
    if is_binary(port), do: port = String.to_integer(port)
    
    Plug.Adapters.Cowboy.http(Router, [], port: port)
  end
end