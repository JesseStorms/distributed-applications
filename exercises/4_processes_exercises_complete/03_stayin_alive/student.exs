defmodule Stuff do

  def print() do
    receive do
      message -> IO.puts(message)
    end
    print()
  end
end
pid = spawn(&Stuff.print/0)
send(pid, "Hello")
send(pid, "my")
send(pid, "name")
send(pid, "jeff")
:timer.sleep(1000)
