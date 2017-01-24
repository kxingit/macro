#!/bin/bash
echo "SSTAT,LINE,EP" > header_Polarcus_2016_water_column_all.csv
cat all.csv | awk '{
    for(icable=1;icable<=10;icable++)
        for(igun=1;igun<=2;igun++)
            print $1","$2"_cable"icable"_gun"igun","$3
}' >> header_Polarcus_2016_water_column_all.csv
