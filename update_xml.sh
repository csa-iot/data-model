#!/bin/bash
sed -i '' 's/<?xml version="1.0" encoding="utf-16"?>/<?xml version="1.0" ?>/g' *.xml
sed -i '' 's/<ZclCluster xmlns:xsi="http:\/\/www.w3.org\/2001\/XMLSchema-instance" xmlns:xsd="http:\/\/www.w3.org\/2001\/XMLSchema"/<zcl:cluster xmlns:xsi="http:\/\/www.w3.org\/2001\/XMLSchema-instance" xmlns:type="http:\/\/zigbee.org\/zcl\/types" xmlns:zcl="http:\/\/zigbee.org\/zcl\/clusters"/g' *.xml
sed -i '' 's/<\/ZclCluster>/<\/zcl:cluster>/g' *.xml
sed -i '' 's/<facet xsi:type="enumerationType"/<type:enumeration/g' *.xml
sed -i '' 's/<type:enumeration value="0x/<type:enumeration value="/g' *.xml
sed -i '' 's/<type:enumeration\(.*\) xmlns="http:\/\/zigbee.org\/zcl\/types" \/>/<type:enumeration\1 \/>/g' *.xml
sed -i '' '/<type:enumeration\(.*\)name="Reserved" \/>/d' *.xml
