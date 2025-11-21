# LOGOS-002
## Passage Filter

Type: STORY

### Description:
A minimum word size filter can be added to the command-line.
--wordSize or -z

Example:

    love . Philippians 1:1-3 -z 3

The Bible program responds with

    Philippians 1:1-3 (NASB 95)
    ---------------------------
    
    1  Paul --- Timothy, bond-servants -- Christ Jesus,
       -- --- --- saints -- Christ Jesus --- --- -- Philippi,
       including --- overseers --- deacons:
    2  Grace -- --- --- peace from --- --- Father --- --- Lord Jesus Christ.
    3  - thank -- --- -- --- -- remembrance -- ---,

Note: this isn't a minimum word size filter, but more like a filter which blocks out all
words of length z or less.

### Acceptance Criteria:
- [X] Command-line parser which allows parsing of word size.
- [X] Unit testing of command-line parser.
- [ ] Filtering utility
- [ ] Unit testing of filtering utility
- [ ] Full integration

**Story Points**: 2 <br/>
**Resolution**: UNRESOLVED <br/>
**Sprint**: FY25 Q4 Sprint 4 <br/>

**Dates**: <br/>
**Created**: 11/17/25 1:03 pm <br/>
**Completed**: --/--/-- --:-- -m <br/>

