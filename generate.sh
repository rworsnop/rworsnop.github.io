#!/bin/sh
tar xzf fop-1.1-bin.tar.gz
fop-1.1/fop -xml resume.xml -xsl resume-fo.xsl -pdf resume.pdf
rm -fr fop-1.1

