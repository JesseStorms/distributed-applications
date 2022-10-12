defmodule Counter do

  def counter(pid, c_val \\ 0) do
    receive do
      message -> case message do
        :increment ->
          send(pid, c_val+1)
          counter(pid, c_val + 1)
        :decrement ->
          send(pid, c_val-1)
          counter(pid, c_val - 1)
        :get -> send(pid, c_val)
        _ -> send(pid, c_val)
      end
    end
    counter(pid, c_val)
  end
end

main_pid = self()
counter_pid = spawn(fn -> Counter.counter(main_pid) end)
send(counter_pid, :null)
receive do
  response -> IO.puts(response)
end
send(counter_pid,:increment)
receive do
  response -> IO.puts(response)
end
send(counter_pid,:increment)
receive do
  response -> IO.puts(response)
end
send(counter_pid,:increment)
receive do
  response -> IO.puts(response)
end
send(counter_pid,:increment)
receive do
  response -> IO.puts(response)
end
send(counter_pid,:get)
receive do
  response -> IO.puts(response)
end
send(counter_pid,:decrement)
receive do
  response -> IO.puts(response)
end
