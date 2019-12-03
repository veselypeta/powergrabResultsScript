#!/bin/bash

mkdir ilp-results

for i in {1..12}
do
  if [ $i -lt 10 ];
  then
    printf -v j "%02d" $i
    java -jar powergrab.jar $j $j 2019 55.944425 -3.188396 1238 stateful
    java -jar powergrab.jar $j $j 2019 55.944425 -3.188396 1238 stateless
  else
    java -jar powergrab.jar $i $i 2019 55.944425 -3.188396 1238 stateful
    java -jar powergrab.jar $i $i 2019 55.944425 -3.188396 1238 stateless
  fi
done

mv *.txt ./ilp-results
mv *.geojson ./ilp-results

zip -r ilp-results ilp-results
rm -rf ilp-results
rm -rf *.txt
rm -rf *.geojson
