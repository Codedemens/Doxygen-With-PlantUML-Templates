java -DPLANTUML_LIMIT_SIZE=50000 -jar plantuml.jar -config "./plantuml_config.cfg" -verbose -tpng -nbthread 2 -enablestats -htmlstats ./uml_src/Doc_*.iuml -o ../uml && java -DPLANTUML_LIMIT_SIZE=50000 -jar plantuml.jar -config "./plantuml_config.cfg" -verbose -tpng -nbthread 2 -enablestats -htmlstats ./uml_src/Seq_*.iuml -o ../uml && java -DPLANTUML_LIMIT_SIZE=50000 -jar plantuml.jar -config "./plantuml_config.cfg" -verbose -tpng -nbthread 2 -enablestats -htmlstats ./uml_src/Act_*.iuml -o ../uml
