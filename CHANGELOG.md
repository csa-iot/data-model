ZCL8
----

BallastConfiguration.xml
========================

BarrierControl.xml
==================
- Not a new XML file, but this cluster appears for the first time in the ZCL specification as of ZCL8
- Editorial: For BarrierPosition attribute, add default value 255 (i.e. 0xFF which signifies position is unknown)
- No change to cluster revision number, remains at revision 1

Basic.xml
=========
- CCB 2722: changed the ZCLVersion attribute value to reflect the library release number, ie. 8
- CCB 2885: Fixed the cluster revision error 

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

Events.xml
==========
- NEW

Groups.xml
==========

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

type.xsd
========
- added default and defaultRef for command fields.

WindowCovering.xml
==================
- CCB 2555: Update the default value for CurrentPositionLiftPercentage and CurrentPositionTiltPercentage
- Updated cluster revision number


