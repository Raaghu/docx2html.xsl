
Issues with test files
----------------------

test/visual/DIaLOGIKa-Testsuite-DOCX-4.0/Font_Name
* p height/line-height/margin-top/etc is 3-pt off

test/visual/DIaLOGIKa-Testsuite-DOCX-4.0/idtrust-press-release
* w:spacing/@w:after is not being applied correctly from w:pPr for w:p

Unimplemented pre-conversion document updates
---------------------------------------------

RevisionAccepter.AcceptRevisions(wordDoc); 
MarkupSimplifier.SimplifyMarkup(wordDoc, settings);
FormattingAssembler.AssembleFormatting(wordDoc, formattingAssemblerSettings);            
InsertAppropriateNonbreakingSpaces(wordDoc);
ReverseTableBordersForRtlTables(wordDoc);
AnnotateForSections(wordDoc);
