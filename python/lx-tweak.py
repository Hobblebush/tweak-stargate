#!/usr/bin/env python3

# lxml library to handle XML data from SVG file.
from lxml import etree

# Parsing an XML file:
#  https://lxml.de/parsing.html
parser = etree.XMLParser(huge_tree=True)
xml = etree.parse("./stargate_template.svg", parser)
root = xml.getroot()
print("Root tag: ", root.tag)

for path in root.find('.//{*}path'):
    print(path.tag)

