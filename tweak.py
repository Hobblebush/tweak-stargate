#!/usr/bin/env python3

# lxml library to handle XML data from SVG file.
from lxml import etree

# Parsing an XML file:
#  https://lxml.de/parsing.html
parser = etree.XMLParser(huge_tree=True)
tree = etree.parse("./stargate_template.svg", parser)
root = etree.getroot()
print("Root tag: ", root.tag)

def walk(node, op):
    op(node)
    for kid in node:
        walk(kid)



