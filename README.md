Types
=====
Types can be defined in the XML. There is the opportunity to create both base types and derived types. Then restrictions may be used to properly form the type. The minimum required set of fields for an attribute definition are id, name, and short. The discrete attribute is optional, and if omitted defaults to false which indicates the data type is considered to be analog. Finally, an inheritsFrom attribute indicates the short value for the attribute from which the attribute derives.

Examples can be seen in the library.xml which defines the base data types and some subclassed types such as the zclStatus type. More advanced mechanisms such as multi-element fields are visible in the global.xml which defines multi-element types which are used for repetition in messages like the Read Attributes Response.

anyType
-------
The anyType type is defined in the global commands XML as this construct only applies to zigbee pro. It should never be used in a cluster specific command.

The type is defined as two field, the first is the Type, which is required to be a type name. The second is the Value which is defiend as type unk as the type is unknown without the information provided by Type. When interpreting data based on this type, it should be done using the details of the type named in the Type field. 

ReportableChange
----------------
The ReportableChange field is specified as unk, but must be interpreted based on the value of AttributeType in each of the commands in which the field is included.

Bitmaps
=======
Bitmap types can be expanded to subfields in the schema using the bitmap tag, which allows a set of fields to be specified using a mask and shift. A bitmap is defined as follows:

```xml
<attribute id="0013" name="AlarmMask" type="map8" writable="true" default="0">
  <bitmap>
    <element mask="01" shiftRight="0" type="bool" name="GeneralHardwareFault" />
    <element mask="02" shiftRight="1" type="bool" name="GeneralSoftwareFault"/>
    <element mask="0C" shiftRight="2" type=”enum8" name="MyEnum”>
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

* GeneralHardwareFault: (0000 1010 & 0000 0001) >> 0 = 0000 0000 >> 0 = 0000 0000 = 0 (False)
* GeneralSoftwareFault: (0000 1010 & 0000 0010) >> 1 = 0000 0010 >> 1 = 0000 0001 = 1 (True)
* MyEnum: (0000 1010 & 0000 1100) >> 2 = 0000 1000 >> 2 = 0000 0010 = 2 (ThirdValue)

Expressions
===========
Logical expressions in the XML SHALL be expressed using the operators specified in [XPath 1.0](https://www.w3.org/TR/1999/REC-xpath-19991116/#section-Expressions). Specifically, section 3. This provides the operators or, and, =, !=, <=, <, >=, >. References to other fields in a command are done through name. Subelements in a bitmap may also be referenced using dot notation (ie, field.bitmapItem). 

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