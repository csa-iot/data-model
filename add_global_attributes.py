import xml.etree.ElementTree as ET
from xml.etree.ElementTree import XMLTreeBuilder as XMLTreeBuilder
from collections import OrderedDict

from os import listdir
from os.path import isfile, join, dirname, realpath


class CommentedTreeBuilder(XMLTreeBuilder):
    def __init__(self, *args, **kwargs):
        super(CommentedTreeBuilder, self).__init__(*args, **kwargs)
        self._parser.CommentHandler = self.comment

    def comment(self, data):
        self._target.start(ET.Comment, {})
        self._target.data(data)
        self._target.end(ET.Comment)

    def _start_list(self, tag, attrib_in):
        fixname = self._fixname
        tag = fixname(tag)
        attrib = OrderedDict()
        if attrib_in:
            for i in range(0, len(attrib_in), 2):
                attrib[fixname(attrib_in[i])] = self._fixtext(attrib_in[i+1])
        return self._target.start(tag, attrib)


def _serialize_xml(write, elem, encoding, qnames, namespaces):
    tag = elem.tag
    text = elem.text
    if tag is ET.Comment:
        write("<!--%s-->" % ET._encode(text, encoding))
    elif tag is ET.ProcessingInstruction:
        write("<?%s?>" % ET._encode(text, encoding))
    else:
        tag = qnames[tag]
        if tag is None:
            if text:
                write(ET._escape_cdata(text, encoding))
            for e in elem:
                _serialize_xml(write, e, encoding, qnames, None)
        else:
            write("<" + tag)
            items = elem.items()
            if items or namespaces:
                if namespaces:
                    for v, k in sorted(namespaces.items(),
                                       key=lambda x: x[1]):  # sort on prefix
                        if k:
                            k = ":" + k
                        write(" xmlns%s=\"%s\"" % (
                            k.encode(encoding),
                            ET._escape_attrib(v, encoding)
                            ))
                #for k, v in sorted(items):  # lexical order
                for k, v in items:  # Monkey patch
                    if isinstance(k, ET.QName):
                        k = k.text
                    if isinstance(v, ET.QName):
                        v = qnames[v.text]
                    else:
                        v = ET._escape_attrib(v, encoding)
                    write(" %s=\"%s\"" % (qnames[k], v))
            if text or len(elem):
                write(">")
                if text:
                    write(ET._escape_cdata(text, encoding))
                for e in elem:
                    _serialize_xml(write, e, encoding, qnames, None)
                write("</" + tag + ">")
            else:
                write(" />")
    if elem.tail:
        write(ET._escape_cdata(elem.tail, encoding))


def process_side(cluster, side):
    cluster_revision = 0
    try:
        cluster_revision = int(cluster.attrib["revision"])
    except NumberFormatException:
        print("Cluster Revision Not Set")
        return

    attrs = side.find("attributes")
    last_elem = None
    if attrs is None:
        attrs = ET.SubElement(side, "attributes")
        attrs.text = "\n      "
        attrs.tail = "\n  "
    else:
        last_elem = attrs.find("./attribute[last()]")

    rev_attr = attrs.find("./attribute[@id='fffd']")
    if rev_attr is None:
        attribs = OrderedDict()
        attribs['id'] = 'fffd'
        attribs['name'] = 'ClusterRevision'
        attribs['type'] = 'uint16'
        attribs['required'] = 'true'
        attribs['min'] = '1'
        rev_attr = ET.SubElement(attrs, "attribute", attribs)
        rev_attr.tail = "\n    "
        if last_elem is not None:
            last_elem.tail = last_elem.tail + "  "
        last_elem = rev_attr
    rev_attr.attrib['default'] = str(cluster_revision)

    report_attr = attrs.find("./attribute[@id='fffe']")
    if report_attr is None:
        attribs = OrderedDict()
        attribs['id'] = 'fffe'
        attribs['name'] = 'AttributeReportingStatus'
        attribs['type'] = 'AttributeReportingStatusEnum'
        report_attr = ET.SubElement(attrs, "attribute", attribs)
        report_attr.tail = "\n    "
        if last_elem is not None:
            last_elem.tail = last_elem.tail + "  "


def process_cluster(cluster):
    server = cluster.find('server')
    client = cluster.find('client')
    if server is None:
        server = ET.SubElement(cluster, "server")
        server.text = "\n    "
        server.tail = "\n"

    if client is None:
        client = ET.SubElement(cluster, "client")
        client.text = "\n    "
        client.tail = "\n"

    process_side(cluster, server)
    process_side(cluster, client)


def process_file(xml_file):
    parser = CommentedTreeBuilder()
    tree = ET.parse(xml_file, parser)
    root = tree.getroot()

    print("cluster id: {}, name: {}".format(
        root.attrib.get('id'), root.attrib.get('name')))

    for cluster in root.iter('{http://zigbee.org/zcl/clusters}cluster'):
        process_cluster(cluster)

    if root.attrib.get('id'):
        tree.write(xml_file)


# walk the directory looking at only  XML files
BASE_DIR = dirname(realpath(__file__))
onlyfiles = [f for f in listdir(BASE_DIR) if isfile(
    join(BASE_DIR, f)) and f.endswith('xml')]

ET._serialize_xml = _serialize_xml
ET.register_namespace('zcl', 'http://zigbee.org/zcl/clusters')
ET.register_namespace('type', 'http://zigbee.org/zcl/types')
ET.register_namespace('xi', 'http://www.w3.org/2001/XInclude')

for xml_file in onlyfiles:
    process_file(xml_file)
