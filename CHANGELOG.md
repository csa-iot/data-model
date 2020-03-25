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

Commissioning.xml
=================

ConcentrationMeasurement.xml
============================
- CCB 2882: The editorial correction to Cluster ID for Fluoride was already reflected in this XML
- Add missing defaults for single-precision Value, Min and Max, set to NaN as specified in ZCL8
- Updated cluster revision number

DemandResponseAndLoadControl.xml
================================

DeviceManagement.xml
====================
- NEW

DeviceTemperatureConfiguration.xml
==================================

Diagnostics.xml
===============

DoorLock.xml
============
- Updated cluster revision number
- Fixed the restriction statement for attribute NumberOfTotalUsersSupported
- CCBs 2629 and 2630 made clarifications to ZCL8 specification text; no XML changes needed
- Minor editorial changes to comments

ElectricalMeasurement.xml
=========================

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

Metering.xml
============
- NEW

OTAUpgrade.xml
==============

PollControl.xml
===============

PowerConfiguration.xml
======================

Prepayment.xml
==============
- NEW

Price.xml
=========

PulseWidthModulation.xml
========================

Scenes.xml
==========

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

Time.xml
========
- CCB 2544: Update the Time and TimeStatus attributes to be R*W from RW
- CCB 2983: A partial update the spec indicating READ_ONLY status in case where
            writableIf doesn't match. 

TouchlinkCommissioning.xml
==========================

WindowCovering.xml
==================


