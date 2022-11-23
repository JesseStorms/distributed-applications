defmodule DaLibclusterStudent.Application do
  use Application

  def start(_type, _args) do
    topologies = [
      da_libcluster_test: [
        strategy: Cluster.Strategy.Gossip
      ]
    ]

    children = [
      {Cluster.Supervisor, [topologies, [name: DaLibclusterStudent.ClusterSupervisor]]},
      {DynamicSupervisor,
       strategy: :one_for_one, name: DaLibclusterStudent.BuildingDynamicSupervisor}
    ]

    opts = [strategy: :one_for_one, name: DaLibclusterStudent.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
