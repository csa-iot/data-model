#!/bin/bash
sed -i '' 's/<?xml version="1.0" encoding="utf-16"?>/<?xml version="1.0" ?>/g' *.xml
sed -i '' 's/<ZclCluster xmlns:xsi="http:\/\/www.w3.org\/2001\/XMLSchema-instance" xmlns:xsd="http:\/\/www.w3.org\/2001\/XMLSchema"/<zcl:cluster xmlns:xsi="http:\/\/www.w3.org\/2001\/XMLSchema-instance" xmlns:type="http:\/\/zigbee.org\/zcl\/types" xmlns:zcl="http:\/\/zigbee.org\/zcl\/clusters"/g' *.xml
sed -i '' 's/<\/ZclCluster>/<\/zcl:cluster>/g' *.xml
sed -i '' 's/<facet xsi:type="enumerationType"/<type:enumeration/g' *.xml
sed -i '' 's/<type:enumeration value="0x/<type:enumeration value="/g' *.xml
sed -i '' 's/<type:enumeration\(.*\) xmlns="http:\/\/zigbee.org\/zcl\/types" \/>/<type:enumeration\1 \/>/g' *.xml
sed -i '' '/<type:enumeration\(.*\)name="Reserved" \/>/d' *.xml
sed -i '' 's/default="empty string"/default=""/g' *.xml
sed -i '' 's/<type:enumeration value="\([0-9a-fA-F]\)"/<type:enumeration value="0\1"/g' *.xml
sed -i '' 's/<zcl:cluster xmlns:schemaLocation="http:\/\/zigbee.org\/zcl\/clusters cluster.xsd http:\/\/zigbee.org\/zcl\/types type.xsd" xmlns:xsi="http:\/\/www.w3.org\/2001\/XMLSchema-instance" xmlns:type="http:\/\/zigbee.org\/zcl\/types" xmlns:xi="http:\/\/www.w3.org\/2001\/XInclude" /<zcl:cluster xmlns:zcl="http:\/\/zigbee.org\/zcl\/clusters"\
  xmlns:xsi="http:\/\/www.w3.org\/2001\/XMLSchema-instance"\
  xmlns:type="http:\/\/zigbee.org\/zcl\/types"\
  xmlns:xi="http:\/\/www.w3.org\/2001\/XInclude"\
  xsi:schemaLocation="http:\/\/zigbee.org\/zcl\/clusters cluster.xsd http:\/\/zigbee.org\/zcl\/types type.xsd"\
  /g' *.xml
sed -i '' 's/xmlns:schemaLocation/xsi:schemaLocation/g' *.xml
sed -i '' 's/ xmlns:zcl="http:\/\/zigbee.org\/zcl\/clusters">/>/g' *.xml
sed -i '' 's/<classification role="\([^"]*\)" picsCode="\([^"]*\)" \/>/<classification hierarchy="base" role="\1" picsCode="\2" \/>/g' *.xml
sed -i '' 's/<classification hierarchy="\([^"]*\)" role="application" picsCode="\([^"]*\)" \/>/<classification hierarchy="\1" role="application" picsCode="\2" primaryTransaction="" \/>/g' *.xml
sed -i '' 's/<classification hierarchy="base"/<classification/g' *.xml

for filename in *.xml; do
	sed -i '' '1s/<zcl/<?xml version="1.0"?>\
<zcl/' "$filename"
	sed -i '' '$!N;s/<?xml version="1.0"?>\n<zcl/<?xml version="1.0"?>\
<!-- \
Connectivity Standards Alliance owns the copyright to the text and content displayed or \
included in this document (including in PDF, XML files and other formats) in \
all forms of media, which copyright is protected by the copyright laws of the \
United States and by international treaties.  Full text of licensing terms \
applicable to this document can be found in the LICENSE.md file.\
-->\
<zcl/g' "$filename"
done