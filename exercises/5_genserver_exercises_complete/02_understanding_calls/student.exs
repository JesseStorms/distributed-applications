Code.compile_file("student.ex")
BuildingManager.start([])
{result, :cheers_from, gen_pid} = BuildingManager.list_rooms()
IO.puts("#{inspect(gen_pid)} sends his regards.")
result
