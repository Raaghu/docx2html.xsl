docx2html.xsl
=============

XSLT 2.0 stylesheets to convert a DOCX document to an approximate HTML/CSS 
rendition.

# Status

This project is in a pre-alpha to alpha stage of development and will
have interface and design changes as development proceeds. The current
level of testing at this phase is based on rough visual, side-by-side 
comparisons of transformation output against trusted HTML versions.

# Usage

The stylesheets in this project require an XSLT 2.0 processor. 

Given that a DOCX file is an archive, the XSLT processor must be 
provided access to the archive's 'word/document.xml' member, either
on disk or in memory, depending on how the transformation is being
executed. In addition, other docx archive members that are used 
during transformation, e.g., 'word/styles.xml', must be provided 
if required.

The stylesheets currently support usage within a transformation
scenario where Saxon-CE is being used as the processor, i.e., within
a Javascript environment. This usage requires a callback interface
that will change as development proceeds.  

See the wiki pages for details on command line usage and parameters.

# Basis 

The docx/html transformation specified by the stylesheets is based on C# code 
in the file HtmlConverter.cs from "PowerTools for Open XML" 
(<http://powertools.codeplex.com/>). The license for that project has been
included in this project's notices.

# Testing

Test documents for this project drawn from another DOCX-related project,
OpenXML/ODF Translator Add-in for Office 
<http://sourceforge.net/projects/odf-converter/>

"Gold standard" renditions of DOCX -> HTML/CSS transformation (e.g., the
test file "test/output/Char Styles stage2.html") were produced by processing the 
test/input DOCX files using the PowerTools for Open XML tool.

Departures from markup produced by "PowerTools for Open XML":

* formatting properties from inline formatting elements, e.g., &lt;i&gt; and &lt;b&gt;, are 
currently output in CSS classes and not as elements
