# LOGOS-003
## Scripture Memory

Type: STORY

### Description:

MEM will remember any and all verses the user tells it to memorize

Example:

    love . MEM STORE Philippians 1:1-3 -z 3

LOGOS remembers that Philippians 1:1-3 -z 3 is important.

    love . MEM RECALL

LOVE responds with Philippians 1:1-3 -z 3

    love . MEM STORE Philippians 1:1-3 -z 4

LOGOS replaces its internal memory with the new verse.

    love . MEM RECALL Philippians 1:1-3

LOGOS responds with Philippians 1:1-3 -z 4

    love . MEM RECALL Philippians 1:2-3

LOGOS responds with Philippians 1:1-2 -z 4

    love . MEM STORE Colossians 1:1-3 -z 2

LOGOS remembers that Colossians 1:1-3 -z 2 is important

    love . MEM RECALL

LOGOS responds with the oldest verse learned (Philippians 1:1-3 -z 4)

    love . MEM RECALL

LOGOS responds with the next oldest verse learned (Colossians 1:1-3 -z 2)

### Acceptance Criteria:
- [X] New memory program, triggered by love . MEM on command line
- [ ] MEM STORE remembers a verse with proper filtering (and timestamp)
- [ ] MEM RECALL command shows memorized verse with oldest timestamp, refreshes timestamp
- [ ] MEM STORE updates verse filters
- [ ] MEM RECALL can specifically recall verses
- [ ] MEM RECALL works on subsets of memorized verses

**Story Points**: 2 <br/>
**Resolution**: UNRESOLVED <br/>
**Sprint**: FY25 Q4 Sprint 5 <br/>

**Dates**: <br/>
**Created**: 12/04/25 10:39 am <br/>
**Completed**: --/--/-- --:-- -m <br/>

