7.2
===
This release covers several CCBs which are listed below:

3025
----
CCB subject: Incorrect Spelling of Attribute	
Commit(s): 50551dd

Updated the spelling in global.xml and README.md correct the spelling.

3027
----
CCB subject: Attribute Ids incorrect	
Commit(s): 52faae1

Updated the attribute ids to match the specification and test spec.

7.1
===
This release covers several CCBs which are listed below:

2967
----
CCB subject: readReportingConfigurationResponseRecord is missing the Status field
Commit(s): d3e720, 9ccbe6b

Added the status to the readReportingConfigurationResponseRecord and added the appropriate dependency on the status to a number of other fields in the message.

2968
----
CCB subject: readStructuredRecord array length size is incorrect
Commit(s): 0dacc34

Updated the arrayLengthSize property of the Index field from an incorrect value of "0" to the correct value of "1"

2969
----
CCB subject: discoverAtttributesExtendedResponseRecord has todo and is spelled incorrectly.
Commit(s): 7309e55, 6961f26, b61f29e, d69f6f5

Added the AttributeType field and updated the bitmap field to represent the bitmap. In addition, the spelling mistake was corrected.

2970
----
CCB Subject: README.md is unclear that the commands on a given side are the commands received.	
Commit(s): 7787cdb

Added text to indicate that the included commands for a cluster side were the commands received.

2971
----
CCB Subject: Fields missing dependency on the status
Commit(s): 2cfc175

Added the presentIf conditions to the three fields which were missing the condition.

2973
----
CCB Subject: bitmap8 instead of map8
Commit(s): 3366d65

Updated the type and tightened up the schema so that it should catch this in the future.

7.0
===
This is the first release of the Zigbee XML files. This release includes the necessary schemas and the following clusters:

* Alarms
* Ballast Configuration
* Barrier Control
* Basic
* Color Control
* Commissioning
* Concentration Measurement 
    - Carbon Monoxide
    - Carbon Dioxide
    - Ethylene
    - Ethylene Oxide
    - Hydrogen
    - Hydrogen Sulfide
    - Nitric Oxide
    - Nitrogen Dioxide
    - Oxygen
    - Ozone
    - Sulfur Dioxide
    - Dissolved Oxygen
    - Bromate
    - Chloramines
    - Chlorine
    - Fecal Coliform And EColi
    - Flouride
    - Halocetic Acids
    - Total Trihalomethanes
    - Total Coliform Bacteria
    - Turbidity
    - Copper
    - Lead
    - Manganese
    - Sulfate
    - Bromodichloromethane
    - Bromoform
    - Chlorodibromomethane
    - Chloroform
    - Sodium
    - PM25
    - Formaldehyde
* Dehumidification Control
* Device Temperature Configuration
* Diagnostics
* Door Lock
* Electrical Conductivitiy Measurement
* Electrical Measurement
* Fan Control
* Flow Measurement
* Groups
* IAS ACE
* IAS WD
* IAS Zone
* Identify
* Illuminance Level Sensing
* Illuminance Measurement
* Level
* Level Control For Lighting
* Occupancy Sensing
* On/Off
* OTA Upgrade
* pH Measurement
* Poll Control
* Power Configuration
* Pressure Measurement
* Pulse Width Modulation
* Pump Configuration and Control
* Scenes
* Shade Configuration
* Temperature Measurement
* Thermostat
* Thermostat User Interface Configuration
* Time
* Touchlink Commissioning
* Water Content Measurement
* Window Covering
* Wind Speed Measurement

