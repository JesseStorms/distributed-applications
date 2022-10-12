defmodule Counter do

  def counter(c_val \\ 0) do
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
    counter(c_val)
  end
end

pid = spawn(&Counter.counter/0)
