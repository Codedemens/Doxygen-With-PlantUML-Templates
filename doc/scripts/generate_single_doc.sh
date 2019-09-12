java -DPLANTUML_LIMIT_SIZE=50000 -jar plantuml.jar -config "./plantuml_config.cfg" -verbose -tpng -nbthread 3 -enablestats -htmlstats ./uml_src/Doc_$1.iuml -o ../uml
