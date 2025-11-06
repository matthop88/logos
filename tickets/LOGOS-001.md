# LOGOS-001
## Passage Painter

Type: STORY

### Description:
Given the existence of Philippians Chapter 1:1-6 in the data and the prompt:

    love . Philippians 1:1-3

The Bible program responds with

    Philippians 1:1-3 (NASB 95)
    ---------------------------
    
    1  Paul and Timothy, bond-servants of Christ Jesus,
       To all the saints in Christ Jesus who are in Philippi,
       including the overseers and deacons:
    2  Grace to you and peace from God our Father and the Lord Jesus Christ.
    3  I thank my God in all my remembrance of you,


Given the same data and the prompt:

    love . Colossians 1:1-3

The Bible program responds with

    [ERROR] Book not found: Colossians

Given the same data and the prompt:

    love . Philippians 2:1-3

The Bible program responds with

    [ERROR] Chapter not found: Philippians 2

Given the same data and the prompt:

    love . Philippians 1:4-9

The Bible program responds with

    [ERROR] Verses not found: Philippians 1:7-9

Given the same data and the prompt:

    love . Philippians 1

The Bible program responds with

    Philippians 1:1-6 (NASB 95)
    ---------------------------
    
    1  Paul and Timothy, bond-servants of Christ Jesus,
       To all the saints in Christ Jesus who are in Philippi,
       including the overseers and deacons:
    2  Grace to you and peace from God our Father and the Lord Jesus Christ.
    3  I thank my God in all my remembrance of you,
    4  always offering prayer with joy in my every prayer for you all,
    5  in view of your participation in the gospel from the first day until now.
    6  For I am confident of this very thing,
       that He who began a good work in you will perfect it until the day of Christ Jesus.

The same response happens when prompting with

    love . Philippians


### Acceptance Criteria:
- [X] Can use the love . Philippians       prompt. Responds "[OK]". If specifying another book, throws error
- [ ] Can use the love . Philippians 1     prompt. Responds "[OK]". If specifying another chapter, throws error
- [ ] Can use the love . Philippians 1:1-6 prompt. Responds "[OK]". If specifying verses out of range, throws error
- [ ] Display caption to screen.
- [ ] Display chosen verses to screen.
- [ ] Preface with verse numbers.

**Story Points**: 2 <br/>
**Resolution**: UNRESOLVED <br/>
**Sprint**: FY25 Q4 Sprint 3 <br/>

**Dates**: <br/>
**Created**: 11/04/25 4:34 pm <br/>
**Completed**: --/--/-- --:-- -m <br/>

