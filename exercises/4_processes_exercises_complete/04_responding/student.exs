defmodule Stuff do

  def print(pid) do
    receive do
      message -> IO.puts(message)
      send(pid, :success)
    end
    print(pid)
  end
end

main_pid = self()
pid = spawn(fn -> Stuff.print(main_pid) end)
send(pid, "Hello")
send(pid, "my")
send(pid, "name")
send(pid, "jeff")
:timer.sleep(1000)

receive do
  _ -> nil
end
