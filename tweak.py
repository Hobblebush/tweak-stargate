#!/usr/bin/env python3

import libxml2

# Parsing an XML file:
#  http://xmlsoft.org/python.html

doc = libxml2.parseFile("stargate_template.svg")
ctxt = doc.xpathNewContext()
res = ctxt.xpathEval("//*")

for tag in res:
    print(tag)

