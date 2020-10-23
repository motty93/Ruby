@startuml

activate someobject
activate aTrip
someobject -> aTrip:prepare(mechanic)
activate aMechanic
aTrip -> aMechanic:prepare_bicycles(bicycles)
aTrip <-- aMechanic
someobject <-- aTrip

@enduml
