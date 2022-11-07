ZCL9
----

All Files
=========
- Update copyright to Connectivity Standards Alliance
- CCB 3498: Asked that we consolidate the formatting of reportable attributes 
  and caused a number of cluster revisions to increment without impact to XML

BallastConfiguration.xml
========================
- CCB 3366: Write access is optional for attributes 0x0030 to 0x0033

BarrierControl.xml
==================
- Cluster Revision updated, no changes which impact XML

Basic.xml
=========
- Cluster Version updated
- ZCLVersion default value updated to 9

cluster.xsd
===========
- Adds optionalIf for attributes and commands, this was done to enable feature 
  sets.

ColorControl.xml
================
- Cluster Revision updated
- CCB 2490: Remove write access to attributes 0x0030-0x003c

DehumidificationControl.xml
===========================
- Cluster Revision updated, no changes which impact XML

Diagnostics.xml
===============
- Cluster Revision updated
- Diagnostics NFR: Added attributes 0x011e - 0x0120 which were approved in an 
  NFR but missed in ZCL8

DoorLock.xml
============
- Cluster Revision updated
- CCB 2953: Adjustment to spec text, no XML change needed.
- CCB 3054: Adjustment to spec text, no XML change needed.
- CCB 3057: Door Lock Feature Map NFR merge
- CCB 3228: Adjustment to spec text, no XML change needed.
- CCB 3279: Adds Scene support to LockState (missing from table, but was 
  specified in text)
- CCB 3318: Adjustment to spec text, no XML change needed.
- CCB 3472: Adjusts default values on attributes 0x0040-0x0047 to MS
- CCB 3474: Adjustment to spec text, no XML change needed

ElectricalMeasurement.xml
=========================
- Cluster Revision updated, no changes which impact XML

EN50523ApplianceEventsAndAlerts.xml
===================================
- Cluster Revision updated, no changes which impact XML

EN50523ApplianceStatistics.xml
==============================
- Cluster Revision updated, no changes which impact XML

FanControl.xml
==============
- Cluster Revision updated, no changes which impact XML

FlowControl.xml
===============
- Cluster Revision updated, no changes which impact XML

Groups.xml
==========
- Cluster Revision updated, no changes which impact XML

IlluminanceLevelSensing.xml
===========================
- Cluster Revision updated, no changes which impact XML

IlluminanceMeasurement.xml
==========================
- Cluster Revision updated, no changes which impact XML

KeepAlive.xml
=============
- Cluster Revision updated
- CCB 3342: Changed the min for TCKeepAliveBase to 1, which was already applied
  in XML, but is now noted.

Level.xml
=========
- Cluster Revision updated
- Adds Level Control feature set
- CCB 2819: Rename Second "Stop" command to "Stop (with On/Off)" to mirror 
  the rest of the "(with On/Off)" commands
- CCB 3075: Adjusts MaxLevel default to 254
- CCB 3168: Adjustment to spec text, no XML change needed.
- CCB 3169: Adjusts MaxFrequency default to 65535
- CCB 3424: Adjustment to spec text, no XML change needed.
- CCB 3470: Adds non to range for OnTransitionTime & OffTransitionTime as well
  as setting default to non
- CCB 3575:

LevelControlForLighting.xml
===========================
- Removed as it's been merged into Level.xml with the introduction of feature maps

library.xml
===========
- removed LevelControlForLighting.xml and PulseWidthModulation.xml from includes
  as they have been subsumed by Level.xml
  
OnOff.xml
=========
- Cluster Revision updated
- Added Feature Map
- CCB 3425: Adjustment to spec text, no XML change needed

OnOffSwitchConfiguration.xml
============================
- Cluster Revision updated, no changes which impact XML

PollControl.xml
===============
- Cluster Revision updated, no changes which impact XML

PowerConfiguration.xml
======================
- Cluster Revision updated
- Battery Alarms NFR
- CCB 2813: Adjustment to spec tex, no XML change needed
- CCB 3267: Enforce strict relation between threshold attributes
- CCB 3419: Adjust BatteryVoltage and BatteryThresholds to have manufacturer 
  specific defaults
- CCB 3305: Adjust BatterySize and BatteryQuantity to be readonly

PressureMeasurement.xml
=======================
- Cluster Revision updated, no changes which impact XML

PumpConfigurationAndControl.xml
===============================
- Cluster Revision updated, no changes which impact XML

PollControl.xml
===============
- Cluster Revision updated, no changes which impact XML

README.md
=========
- Add details on optionalIf attribute for attribute and command defintions

Scenes.xml
==========
- Cluster Revision updated, no changes which impact XML

TemperatureMeasurement.xml
==========================
- Cluster Revision updated, no changes which impact XML

Thermostat.xml
==============
- Cluster Revision updated
- CCB 2602: Add Unknown and AutoSwing to ACLouverPosition options
- CCB 2915: Adjust ranges to be based on other range limits
- CCB 3153: Adjustmnet to spec text, no XML change needed
- CCB 3154: Add TemperatureSetpointHoldTimeRemaining
- CCB 3155: Adjustment to spec text, no XML change needed
- CCB 3348: Adjust defaults for LocalTemperature and OutdoorTemperature to non
- CCB 3412: Adjustment to spec text, no XML change needed

ThermostatUserInterface.xml
===========================
- Cluster Revision updated, no changes which impact XML

Time.xml
========
- Defaults for most attributes updated to non

TouchlinkCommissioning.xml
==========================
- Cluster Revision updated, no changes which impact XML

type.xsd
========
- Adds required, requiredIf, and optionalIf to bitmaps and restrictions.

WindowCovering.xml
==================
- Cluster Revision updated
- Feature Map support
- CCB 1846: Deprecated IntermediateSetpointsLift & IntermediateSetpointsTilt
- CCB 3016: Adjustment to spec text, no XML change needed
- CCB 3058: Require GoToLiftPercentage and GoToTiltPercentage in closed loop.
- CCB 3344: Change CurrentPositionLiftPercentage and 
  CurrentPositionTiltPercentage to use non as the default


ZCL8
----

BallastConfiguration.xml
========================
- CCB 2700: PICS code changed to BC
- CCB 2881: Correction to spec text, no XML change needed
- Updated cluster revision number

BarrierControl.xml
==================
- Not a new XML file, but this cluster appears for the first time in the ZCL specification as of ZCL8
- Editorial: For BarrierPosition attribute, add default value 255 (i.e. 0xFF which signifies position is unknown)
- No change to cluster revision number, remains at revision 1

Basic.xml
=========
- CCB 2722: changed the ZCLVersion attribute value to reflect the library release number, ie. 8
- CCB 2885: Fixed the cluster revision error 
- CCB 3469: Updated second Office and Living Room entries to be "Secondary"

Calendar.xml
============
- NEW

ColorControl.xml
================
- CCB 2501: Correction to spec text, no XML change needed
- CCB 2814: Added default values to OptionsMask and OptionsOverride fields in MoveToHue, MoveHue, StepHue, MoveToSaturation, MoveSaturation, StepSaturation, MoveToHueAndSaturation, MoveToColor, MoveColor, StepColor, MoveToColorTemperature, EnhancedMoveToHue, EnhancedMoveHue, EnhancedStepHue, EnhancedMoveToHueAndSaturation,
ColorLoopSet, StopMoveStep, MoveColorTemperature, and StepColorTemperature
- CCB 2839: Correction to spec text, no XML change needed
- CCB 2840: Correction to spec text, no XML change needed
- CCB 2843: Correction to spec text, no XML change needed
- CCB 2861: Correction to spec text, no XML change needed
- Updated cluster revision number

Commissioning.xml
=================
- CCB 2477: Clarification to spec text, no XML change needed.
- CCB 2862: Clarification to spec text, no XML change needed.
- CCB 2870: Editorial in spec which was not in XML due to number formatting.
- Updated cluster revision number

ConcentrationMeasurement.xml
============================
- CCB 2882: The editorial correction to Cluster ID for Fluoride was already reflected in this XML
- Add missing defaults for single-precision Value, Min and Max, set to NaN as specified in ZCL8
- Added Cluster Identifiers (aliases) for PM1, PM10, and VolatileOrganicCompounds per 19-52988-001
- Updated cluster revision number

DemandResponseAndLoadControl.xml
================================

DeviceManagement.xml
====================
- NEW

DeviceTemperatureConfiguration.xml
==================================
- Default values were updated to non on several clusters, no CCB reference in spec.
- No update to the cluster revision in ZCL document.

Diagnostics.xml
===============
- CCB 2425: Duplicate of 2520
- CCB 2520: Correction to spec text, no XML change needed
- CCB 2521: Correction to spec text, no XML change needed
- Updated cluster revision number

DoorLock.xml
============
- Updated cluster revision number
- Fixed the restriction statement for attribute NumberOfTotalUsersSupported
- CCBs 2629 and 2630 made clarifications to ZCL8 specification text; no XML changes needed
- Minor editorial changes to comments

ElectricalMeasurement.xml
=========================
- CCB 2369: Textual clarification in ZCL8 spec, no XML change needed.
- CCB 2817: Specified change already correctly reflected, no XML change needed.
- Updated cluster revision number

EN50523ApplianceEventsAndAlerts.xml
===================================
- XML validated against cluster specification.
- Updated Cluster Revision

EN50523ApplianceStatistics.xml
==============================
- XML validated against cluster specificiation.
- Updated Cluster Revision

Events.xml
==========
- NEW

Groups.xml
==========
- CCB 2310: Cleanup of group id limits to be 0x0001 - 0xfff7
- CCB 2704: Clarification of allowable status codes.
- Updated cluster revision number

Identify.xml
============
- CCB 2808: changed the data types of the Effect Identifier and Effect Variant fields in the Trigger Effect Command to enum8
- Updated cluster revision number

KeepAlive.xml
=============
- NEW

KeyEstablishment.xml
====================
- NEW

Level.xml
=========
- CCB 2574: Changed the type of DefaultMoveRate to uint8.
- CCB 2616: Clarification to spec text, no XML change needed.
- CCB 2659: Clarification to spec text, no XML change needed.
- CCB 2702: Clarification to spec text, no XML change needed.
- CCB 2814: Added default values for OptionsMask and OptionsOverride fields.
- CCB 2818: Clarification to spec text, no XML change needed.
- CCB 2819: Clarification to spec text, no XML change needed.
- CCB 2898: Clarification to spec text, no XML change needed.
- Updated cluster revision number.

LevelControlForLighting.xml
===========================

MeterIdentification.xml
=======================
- Validated scraped XML.
- Updated cluster revision number

Metering.xml
============
- NEW

OTAUpgrade.xml
==============
- CCB 2477: Clarification to spec text, no XML change needed.
- CCB 2519: Clarification to spec text, no XML change needed.
- CCB 2873: Clarification to spec text, no XML change needed.
- Updated cluster revision number

OnOffSwitchConfiguration.xml
============================
- NEW

PollControl.xml
===============
- CCB 3285: swapped the command sides to match what's in the ZCL document. This was a scraping issue which was missed during initial review.
- Updated cluster revision number

PowerConfiguration.xml
======================
- Updated the default values based on the changes in the ZCL
- CCB 2454: Updated the BatteryAlarmState1, BatteryAlarmState2, and BatteryAlarmState3 attributes to be reportable.
- Updated cluster revision number

Prepayment.xml
==============
- NEW

Price.xml
=========

PulseWidthModulation.xml
========================

Scenes.xml
==========
- CCB 2427: Clarification to spec text, no XML change needed.
- CCB 3026: Change already reflected in XML, no further XML change needed.
- Updated cluster revision number

SmartEnergyMessaging.xml
========================

SmartEnergyTunneling.xml
========================

SubGhz.xml
==========
- NEW

TemperatureMeasurement.xml
==========================
- CCB 2823: corrects inconsistency in spec between attribute table and text for default value of int16; already correct in XML based on text, no change needed
- Updated cluster revision number

Thermostat.xml
==============
- CCB 2477: Clarification to spec text, no XML change needed.
- CCB 2560: Updated default value of occupancy to indicate occupied.
- CCB 2773: Updated HVACSystemTypeConfiguration to R*W
- CCB 2777: Updated MinSetpointDeadBand to R*W and changed min range to 0
- CCB 2815: Added 00 = Unknown enumeration value to ACType, ACCapacity, ACRefrigerantType and ACCompressorType attributes
- CCB 2816: Clarification to spec text, no XML change needed.
- CCB 3029: Clarification to spec text, no XML change needed.
- Fixing missed defaults and scene requirements
- Updated cluster revision number

Time.xml
========
- CCB 2544: Update the Time and TimeStatus attributes to be R*W from RW
- CCB 2983: A partial update the spec indicating READ_ONLY status in case where
            writableIf doesn't match. 

TouchlinkCommissioning.xml
==========================
- CCB 2648: Clarification to spec text, no XML change needed.
- Updated cluster revision number.

type.xsd
========
- added default and defaultRef for command fields.

WindowCovering.xml
==================
- CCB 2555: Update the default value for CurrentPositionLiftPercentage and CurrentPositionTiltPercentage
- Updated cluster revision number


