defmodule BuildingManager do

  def start(args) do
    GenServer.start(__MODULE__, args, name: __MODULE__)
  end

  def init(args) do
    IO.puts("\n\nWe received the following args and are completely ignoring these:")
    IO.inspect(args, label: __MODULE__.INIT)

    initial_state = %{rooms: []}
    {:ok, initial_state}
  end

  def list_rooms_manual_implementation() do
    send(__MODULE__, {:send_rooms_info_to, self()})
    IO.puts("\n#{inspect(self())} Is asking for more information regarding the rooms.")

    # In Elixir, every function returns something. Here you can see that the receive funtion will
    #   return the bound information data. This will become the output of this function.
    receive do
      {:rooms_info, information} -> information
    end
  end

  def handle_info({:send_rooms_info_to, caller}, state) do
    send(caller, {:rooms_info, {state.rooms, :cheers_from, self()}})
    {:noreply, state}
  end

end
