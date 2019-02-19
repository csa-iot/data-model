Eclipse Setup
=============
To configure eclipse to properly work with the XML files you'll need a version of eclipse that supports the XML Editors and Tools. You can [compare different versions](https://www.eclipse.org/downloads/packages/compare). Once installed, follow the instructions below to get set up for validation. These assume you've already got a local copy of the GIT repo checked out.

1. Preferences > XML > XML Files > Validation
2. Check "Process XML Inclusions"
3. Check "Honour all XML schema locations"
4. Click "Apply and Close"
5. File > Import
6. General > File System
7. Select the GIT repo
8. Import
9. Open "library.xml"
10. Right click, "Validate"

Converting Clusters
===================
There should be a base file for each cluster available in the project, produced by scraping the word documents for the ZCL. These files need to be reviewed by a human and edited as necessary. The process to do this at a high level is as follows

1. Create a branch for your work (use your name)
2. Start to edit the files
3. Commit when you're done and they validate
4. Make a pull request

library.xml
-----------
Each file should be referenced in library.xml as it is reviewd. At the bottom of the file you'll see some statements like the following.

```xml
	<xi:include href="global.xml" parse="xml" />
	<xi:include href="Basic.xml" parse="xml" />
```

Duplicate the line for Basic.xml for your cluster, and insert it into the correct position based on the ordering in the ZCL document.

Clusters
--------
Each cluster is defined with the following basic structure

```xml
<zcl:cluster xmlns:zcl="http://zigbee.org/zcl/clusters" 
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
             xmlns:type="http://zigbee.org/zcl/types" 
             xmlns:xi="http://www.w3.org/2001/XInclude" 
             xmlns:schemaLocation="http://zigbee.org/zcl/clusters cluster.xsd http://zigbee.org/zcl/types type.xsd"
             id="0000" revision="0" name="Basic">
  <classification hierarchy="base" role="utility" picsCode="B" />
  <type:type />
  <server>...</server>
  <client>...</client>
  <tags>...</tags>
</zcl:cluster>
```

The classification element is required, all of the others can be omitted if there is no content. The classification information is given in the ZCL document and must include the hierarchy, role and picsCode.

The type:type definition allows for the definition of complex types, or types which are used by multiple attributes and/or commands. This must be used whenever an enumeration, bitmap, etc. is reused. For more information see the Types section below.

The server and client define the attributes and commands that comprise the respective server and client sides of a cluster. For more information see the Clusters section below.

The tags section allows for the definition of tags at the cluster level which are then referenced by the commands which the tag may be used to extend. For more information see the Tags section below.

Naming
------
All names in the XML must adhere to regular expression `[A-Za-z0-9\-]*`. This means that in general, names should be such that the first letter of each work is upper-case, and the rest of the word lower-case. There should also be no spaces in the name.

Types
=====
Types can be defined in the XML. There is the opportunity to create both base types and derived types. Then restrictions may be used to properly form the type. The minimum required set of fields for an attribute definition are id, name, and short. The discrete attribute is optional, and if omitted defaults to false which indicates the data type is considered to be analog. Finally, an inheritsFrom attribute indicates the short value for the attribute from which the attribute derives.

Examples can be seen in the library.xml which defines the base data types and some subclassed types such as the zclStatus type. More advanced mechanisms such as multi-element fields are visible in the global.xml which defines multi-element types which are used for repetition in messages like the Read Attributes Response.

Bitmaps
-------
Bitmap types can be expanded to subfields in the schema using the bitmap tag, which allows a set of fields to be specified using a mask and shift. A bitmap is defined as follows:

```xml
<attribute id="0014" name="DisableLocalConfig" type="map8" writable="true" default="0">
  <bitmap>
    <element name="DisableResetToFactoryDefaults" type="bool" mask="01" />
    <element name="DisableDeviceConfiguration" type="bool" mask="02" shiftRight="1" />
    <element name="MyEnum” type=”enum8" mask="0C" shiftRight="2">
      <restriction>
        <type:enumeration name="FirstValue" value="00" />
        <type:enumeration name="SecondValue" value="01" />
        <type:enumeration name="ThirdValue" value="02" />
        <type:enumeration name="FourthValue" value="03" />
      </restriction>
    </element>
  </bitmap>
</attribute>
```

As an example, the following bitmap ```0000 1010``` would be broken down as follows:

* DisableResetToFactoryDefaults: (0000 1010 & 0000 0001) >> 0 = 0000 0000 >> 0 = 0000 0000 = 0 (False)
* DisableDeviceConfiguration: (0000 1010 & 0000 0010) >> 1 = 0000 0010 >> 1 = 0000 0001 = 1 (True)
* MyEnum: (0000 1010 & 0000 1100) >> 2 = 0000 1000 >> 2 = 0000 0010 = 2 (ThirdValue)

Each element specified may have the restrictions listed below.

Restrictions
------------
There are a number of restrictions available for types. These build the basis of the typing system and are as follows

* enumeration - see the Enumerations section below
* minExclusive - sets a minimum that doesn't include the value specified, i.e. a field of this type must be strictly greater than the value
* minInclusive - sets a minimum that includes the value specified, i.e. a field of this type must be greater than or equal than the value
* maxExclusive - sets a maximum that doesn't include the value specified, i.e. a field of this type must be strictly less than the value
* maxInclusive - sets a maximum that includes the value specified, i.e. a field of this type must be less than or equal to the value
* totalDigits - see http://www.w3.org/TR/xmlschema11-2/#element-totalDigits
* fractionDigits - see http://www.w3.org/TR/xmlschema11-2/#element-fractionDigits
* length - specifies an exact length, generally used for a string.
* minLength - specifies the minimum length that a type must take, generally used for a string
* maxLength - specifies the maximum length that a type must take, generally used for a string
* pattern - specifies a regular expression pattern which a string must match
* sequence - specifies a sequence of fields, should only be used for restrictions on command fields 

Enumerations
------------
Enumerations are defined as a value and a short name. The short name is intended to be such that it could be used as a constant name in code. Verbose descriptions are not permitted, and instead a descriptive name should be used. The value is specified as a HexBinary, which means that it's specified in Hex, and must be expressed as a multiple of two hexadecimal characters.

anyType
-------
The anyType type is defined in the global commands XML as this construct only applies to Zigbee pro. It must never be used in a cluster specific command.

The type is defined as two field, the first is the Type, which is required to be a type name. The second is the Value which is defiend as type unk as the type is unknown without the information provided by Type. When interpreting data based on this type, it should be done using the details of the type named in the Type field. 

ReportableChange
----------------
The ReportableChange field is specified as unk, but must be interpreted based on the value of AttributeType in each of the commands in which the field is included.

Clusters
========
Each cluster is defined as a set of attributes and/or commands. A cluster must have at least one attribute or command. See the Attributes and Commands sections below for more information

Attributes
----------
Attribute definitions look like the following.

```xml
<attributes>
  <attribute id="0000" name="ZCLVersion" type="uint8" required="true" max="255" default="3" />
  <attribute id="0008" name="GenericDevice-Class" type="enum8" default="255">
    <restriction>
      <type:enumeration value="00" name="Lighting" />
    </restriction>
  </attribute>
</attributes>
```

An attribute may be specified using the following attributes in the XML.

| Attribute      | Required | Description                                                    |
|----------------|----------|----------------------------------------------------------------|
| id             | true     | The Zigbee attribute id, as a HexBinary (ie, 4 hex characters) |
| name           | true     | The name of the attribute, as per the Naming section above     |
| type           | true     | The short name of the attribute type                           |
| readable       | false    | If the attribute is readable OTA. Defaults to true             |
| writable       | false    | If the attribute is writable OTA. Defaults to false.           |
| writeOptional  | false    | If the attribute is specified as writable this indicates if the write is required. Defaults to false. |
| reportRequired | false    | If attribute is required to be reportable. Defaults to false   |
| sceneRequired  | false    | If attribute is required to be part of the scene extensions. Defaults to false |
| required       | false    | If the attribute is mandatory. Defaults to false               |
| min            | false    | A decimal integer specifying the min value (inclusive). Not for use on strings, use minLength restriction instead. Defaults to 0 |
| max            | false    | A decimal integer specifiying the max value (inclusive). Not for use on strings, use maxLength restriction instead. No Default. |
| default        | false    | Specifies the default value of an attribute. No Default        |

Inside an attribute definition, either a bitmap or a series of restrictions may be specified. An example of restrictions can be seen in the example attribute definition for `GenericDevice-Class`. For an example of bitmap definitions, see the Bitmaps section.


Commands
--------
Commands definitions look like the following.

```xml
<commands>
  <command id="00" name="AddGroup" required="true">
    <fields>
      <field name="GroupId" type="uint16" />
      <field name="GroupName" type="string" />
    </fields>
    <tag ref="1" />
    <tag ref="2" />
    <tag ref="3" />
  </command>
  <command id="04" name="RemoveAllGroups" required="true" />
</commands>
```

A command may be specified using the following attributes in XML

| Attribute      | Required | Description                                                    |
|----------------|----------|----------------------------------------------------------------|
| id             | true     | The Zigbee command id, as a HexBinary (ie, 2 hex characters)   |
| name           | true     | The name of the command, as per the Naming section above       | 
| required       | false    | If the command is mandatory. Defaults to false                 |

Inside a command definition, a series of fields followed by tag definitions is permitted. 

Each field is defined with the following attributes in XML

| Attribute       | Required | Description                                                    |
|-----------------|----------|----------------------------------------------------------------|
| name            | true     | The name of the command, as per the Naming section above       | 
| type            | true     | The short name of the field type                               |
| array           | false    | If the field is an array. Defaults to false                    |
| arrayLengthSize | false    | When an array is present, specifies the size (in octets) of the field that specifies the array length. |
| presentIf       | false    | Specifies an expression (as described in the Expressions section) that indicates if the field is present. Defaults to true, i.e. Field is present. |

Similar to an attribute, a field may contain definitions of bitmaps or restrictions.

Expressions
===========
Logical expressions in the XML SHALL be expressed using the operators specified in [XPath 1.0](https://www.w3.org/TR/1999/REC-xpath-19991116/#section-Expressions). Specifically, section 3. This provides the operators or, and, =, !=, <=, <, >=, >. References to other fields in a command are done through name. Sub-elements in a bitmap may also be referenced using dot notation (ie, field.bitmapItem). 

Fields in a Command
-------------------
Below is an example of optional fields in a command using the presentIf capabilities. It's implemented as a type because it's required to be repeated, etc.

```xml
<type:type id="ff" short="configureReportingRecord" name="Attribute Reporting Configuration Record">
  <restriction>
    <type:sequence>
      <field name="Direction" type="reportingRole" />
      <field name="AttributeIdentifier" type="attribId" />
      <field name="AttributeType" type="zclType" presentIf="Direction = 0" />
      <field name="MinimumReportingInterval" type="uint16" presentIf="Direction = 0" />
      <field name="MaximumReportingInterval" type="uint16" presentIf="Direction = 0" />
      <field name="ReportableChange" type="unk" presentIf="Direction = 0" />
      <field name="Timeout" type="uint16" presentIf="Direction = 1" />
    </type:sequence>
  </restriction>
</type:type>
```

Tags
====
Tags allow for the extension of an existing command. A tag is defined as an identifier, a type and a name. It can then be added to some or all of the commands that exist in the cluster. Tags are created in the tags section which follows the cluster side definitions. A command may then reference the tags that may be used with it. An example may be seen in the groups cluster, specifically the AddGroup command. 

Viewing As HTML
===============
The library.xml field has a stylesheet associated which can generate a HTML representation of the ZCL Library. This can be accessed by running the following python command inside the directory. The <port> attribute indicates the port you want to run on.

python -m SimpleHTTPServer <port>

Once you've started the server, you can navigate to http://localhost/library.xml to view the library. Note that if you specify a port, you will need to modify this URI.