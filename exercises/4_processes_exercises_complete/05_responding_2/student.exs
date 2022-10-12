defmodule Stuff do

  def magic_eight_ball(pid) do
    receive do
     message -> case rem(String.length(message),3) do
        0 -> send(pid, :yes)
        1 -> send(pid, :maybe)
        2 -> send(pid, :no)
      end
    end
    magic_eight_ball(pid)
  end

end

main_pid = self()
pid = spawn(fn -> Stuff.magic_eight_ball(main_pid) end)
send(pid, "my name jeff?")
receive do
  response -> IO.puts(response)
end
send(pid,"l")
receive do
  response -> IO.puts(response)
end
send(pid,"lo")
receive do
  response -> IO.puts(response)
end
send(pid,"lol")
receive do
  response -> IO.puts(response)
end
:timer.sleep(1000)
