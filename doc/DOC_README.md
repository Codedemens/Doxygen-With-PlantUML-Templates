# Documentation README
## How to generate doxygen documentation
Execute "doxygen" command in this (the doc/) directory.

## How to generate UML by PlantUML?
PlantUML files for UML generation have .iuml extension
  
### Prefixes of documentation
#### Doc_
Doc_ is the prefix used to represent PlantUML documentation UML. Mostly it imports other plantuml files, with prefixes Class_
#### Class_
Class_ is the prefix used to represent PlantUML SINGLE class UML.

http://plantuml.com/class-diagram
#### Sequence_
Seq_ is the prefix used to represent PlantUML SINGLE sequence UML.

Sequence diagram syntax
http://plantuml.com/sequence-diagram
#### Activity
Act_ is the prefix used to represent PlantUML single activity UML.

Activity diagram syntax
http://plantuml.com/activity-diagram-beta


### Scripts used for PlantUML diagram generation
#### scripts/generate_uml.sh
Generates every diagram used by documentation
#### generate_single_activity_doc.sh (Name)
Generates Act_(Name) diagram
#### generate_single_sequence_doc.sh (Name)
Generates Seq_(Name) diagram
#### generate_single_doc.sh (Name)
Generates Doc_(Name) diagram
