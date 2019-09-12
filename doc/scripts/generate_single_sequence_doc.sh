java -DPLANTUML_LIMIT_SIZE=50000 -jar plantuml.jar -config "./plantuml_config.cfg" -verbose -tpng -nbthread 3 -enablestats -htmlstats ./uml_src/Seq_$1.iuml -o ../uml
