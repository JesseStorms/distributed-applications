#spawn Hello world on node
# create ping node
Node.start(:ping@Gasai, :shortnames, 15000)

Node.connect(:pong@Gasai)
Node.spawn(:pong@Gasai, fn ->
  IO.puts("Hello world on node: #{to_string(Node.self())}")
end)
