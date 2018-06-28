#!/usr/bin/env ruby

require 'nokogiri'

require './draw'

# SVG is an XML-based document format.
#  https://developer.mozilla.org/en-US/docs/Web/SVG

# Using the nokogiri library for XML
#   https://www.nokogiri.org/

# We're interested in two kids of XML element:
#  <g ...> is a "group"
#    https://developer.mozilla.org/en-US/docs/Web/SVG/Element/g
#  <path ...> draws arbitrary shapes
#    https://developer.mozilla.org/en-US/docs/Web/SVG/Element/path

# Paths have a "d" attribute (drawing instructions):
#  https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d

# Using xpath for XML queries
#  https://www.w3schools.com/xml/xpath_intro.asp

svg_file = File.open("stargate_template.svg")
xml = Nokogiri::XML(svg_file)
svg_file.close
xml.remove_namespaces!

group = xml.xpath("//g[@id='Outer_Chevron_Delimiters-7']")[0]
p group.path

group.xpath(".//path").each do |path|
  s0 = path["d"]
  p "i: " + s0

  d0 = parse_draw_cmds(s0)
  d1 = d0.map do |cmd|
    if cmd[0] == 'h'
      cmd[1] = 2.0 * cmd[1]
    end
    cmd
  end

  s1 = draw_cmds_to_string(d1)
  p "o: " + s1
  path["d"] = s1
end

out_file = File.open("output.svg", "w")
out_file.write(xml.to_xml)
out_file.close

