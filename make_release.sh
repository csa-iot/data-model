#!/bin/bash

FILES="Alarms.xml
BallastConfiguration.xml
BarrierControl.xml
Basic.xml
ColorControl.xml
Commissioning.xml
ConcentrationMeasurement.xml
DehumidificationControl.xml
DeviceTemperatureConfiguration.xml
Diagnostics.xml
DoorLock.xml
ElectricalConductivityMeasurement.xml
ElectricalMeasurement.xml
FanControl.xml
FlowMeasurement.xml
Groups.xml
IASACE.xml
IASWD.xml
IASZone.xml
Identify.xml
IlluminanceLevelSensing.xml
IlluminanceMeasurement.xml
LICENSE.md
Level.xml
LevelControlForLighting.xml
OccupancySensing.xml
OnOff.xml
OTAUpgrade.xml
pHMeasurement.xml
PollControl.xml
PowerConfiguration.xml
PressureMeasurement.xml
PulseWidthModulation.xml
PumpConfigurationAndControl.xml
README.md
ReleaseNotes.md
Scenes.xml
ShadeConfiguration.xml
TemperatureMeasurement.xml
Thermostat.xml
ThermostatUserInterfaceConfiguration.xml
Time.xml
TouchlinkCommissioning.xml
WaterContentMeasurement.xml
WindowCovering.xml
WindSpeedMeasurement.xml
cluster.xsd
global.xml
library.xml
type.xsd"

read -p "Please enter the release identifier (e.g. 7.0): " release

echo "Making release is ${release}"

rm -rf release/${release}
mkdir -p release/${release}

for file in $FILES; do
	cp $file release/${release}
done
