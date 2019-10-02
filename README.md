# COP-3402 Systems Software Syllabus

- Fall 2019
- Section 1
- University of Central Florida
- Prerequisite(s): CDA 3103C and COP 3502C each with a grade of C (2.0) or better.


## Personnel

- Instructor
    - [Paul Gazzillo](https://paulgazzillo.com) [paul.gazzillo@ucf.edu](mailto:paul.gazzillo@ucf.edu)
- GTA
    - Mesut Ozdag [mesut.ozdag@knights.ucf.edu](mailto:mesut.ozdag@knights.ucf.edu)

## Office Hours

- Mondays 2pm-3pm (Mesut, the cave HEC-308) except 09/02
- Tuesdays 3pm-4pm (Paul, HEC-239) except 08/27
- Wednesdays ~~1pm-2pm~~ 5:30pm-6:30pm (Mesut, the cave HEC-308)
- Thursdays 3pm-4pm (Paul, HEC-239) except 08/27, 11/28
- by appointment if necessary

## Schedule

Class: Tuesday/Thursday 7:30PM-8:50PM CB2 O106

Dates: 08/27-12/03

No lecture: 08/29, 11/28

Labs (check your schedule for the room assignment)

- Wednesday 2:30PM-3:20PM CB1 O120
- Wednesday 3:30PM-4:20PM CB1 O120
- Wednesday 4:30PM-5:20PM CB1 O120

Final exam period: Thursday 12/05/2019 7:30 PM–9:50 PM (will end at 9pm)

_All dates in year of semester, times in UCF's time zone._

### Lecture Schedule

_DB_ stands for the "Dragon Book", i.e., the recommended textbook for this course.

| Date     | Tuesday Lecture                                                                  | Date   | Thursday Lecture                                                           |
|----------|----------------------------------------------------------------------------------|--------|----------------------------------------------------------------------------|
| 08/27    | Course overview, using git                                                       | 08/29  | (no lecture, game)                                                         |
| 09/03    | (cancelled, storm)                                                               | 09/05  | (cancelled, storm) Online: OS overview, dev tools, running LLVM            |
| 09/10    | Compiler overview and basic LLVM IR, _DB chapters 1 and 2_                                              | 09/12  | Lexing, ascii, _DB 3.1--3.3_                                                             |
| 09/17    | Automata theory, regular expressions, _DB 3.4--3.6_                                             | 09/19  | Regular expressions to NFAs to DFAs, _DB 3.7_                                        |
| 09/24    | Formal grammars and parsing (**proj0 due**) _DB 4.1--4.3_                                      | 09/26  | Predictive parsing with recursive descent _DB 4.4_                                  |
| 10/01    | Arithmetic expressions in assembly, _DB 6.4_                                               | 10/03  | Recursion                                                                  |
| 10/08    | LR parsing _DB 4.5-4.6_                                                                       | 10/10  | Variable constructs (**proj1 due**) _DB 6.3_                                          |
| 10/15    | Symbol tables and type checking _DB 6.5_                                                 | 10/17  | Memory management on the stack _DB 7.1-7.2_                                            |
| 10/22    | Structured programming and control-flow                                        | 10/24  | Implementing control-flow in LLVM IR _DB 6.6_                                      |
| 10/29    | Implementing control-flow constructs (**proj2 due**)                             | 10/31  | The function abstraction, stack frames                                     |
| 11/05    | Function constructs, symbol tables and type-checking revisited                   | 11/07  | Functions in LLVM IR, Intel ABI                                            |
| 11/12    | Optimization _DB 8.1_                                                                     | 11/14  | Control-flow and data-flow analysis (**proj3 due**) _DB 8.4, 9.1-9.4_                        |
| 11/19    | Software security                                                                | 11/21  | Program analysis                                                           |
| 11/26    | Review                                                                           | 11/28  | (no lecture, thanksgiving)                                                 |
| 12/03    | Review (**proj4 due**)                                                           | 12/05  | Final exam period 7:30pm-9:50pm (end at 9pm) (**late project deadline**)   |

<!-- _All readings are chapters and sections (inclusive) from the Dragon book (Compilers: Principles, Techniques, & Tools, Second Edition)_ -->

### Due Dates

All homework is due _**one week after assignment, i.e., 7:30pm Tuesday or Thursday**_.  Homework assigned at each lecture, except 08/29, 11/26, 11/28, or 12/03.  _**No late homework permitted**_.

All projects are due _**7:30pm Tuesday or Thursday before class**_.  There are about 2.5 weeks between project due dates.

- Project 0 Thursday ~~09/19~~ 09/24 7:30PM
- Project 1 Tuesday ~~10/08~~ 10/10 7:30PM
- Project 2 Thursday ~~10/24~~ 10/29 7:30PM
- Project 3 Tuesday ~~11/12~~ 11/14 7:30PM
- Project 4 Thursday ~~11/28~~ 12/03 7:30PM

_**The final deadline for all late project submissions is Thursday 12/05 7:30PM**_ before the final exam.

## Grading

- 60% Programming projects, 5 projects, 12pt each.

  - There are five programming projects, each worth 12pt.
  - Students work individually on the project.
  - Submission must be via release on their GitHub repository in the classroom GitHub organization and remain private.  Submission time is determined by time of release on GitHub.
  - Project source code must never be made public.
  - Projects are cumulative
  - Grading scheme
      - 0pt for no release.
      - 1pt for effort.
      - 1pt if it compiles.
      - Remaining 10pt pro-rated by number of tests passed.
      - Half of the tests are public, half are secret.
  - Students may resubmit up to late deadline for regrading (minus late penalties).

  - Late policy: up to two weeks late, 1pt off.  2pt off any time
    after.  Absolute deadline for late projects is 7:30pm day of final
    (12/05).
      
- 20% Homework, 25 short homeworks, lowest 5 are dropped, 1pt each.

    - Assigned and submitted via webcourses.
    
    - Contents will be used for final exam.
    
    - Effort taken into consideration with correctness.

- 20% Final

    - Questions based on homework, programming projects, and lectures.

- +5% Discretionary and bonus points (bonus projects, participation, effort, etc).

### Letter Grades

A >= 90%, B+ >= 87%, B >= 80%, C+ >= 77%, C >= 70%, D >= 60%, F < 60%. (minuses may be used in some cases)

## Course Info

### Description

Design and development compilers, assemblers, linkers, and loaders. Basic operating systems will be covered as well as brief introductions to advanced topics such as optimization, software security, and program analysis.

### Learning Outcomes

This course will provide students an understanding of systems software
tools, in particularly the compiler and other tools for processing and
executing programming languages.  Student will learn both the big
picture view of these tools as well as the details of their
development.  Students will gain both conceptual and practical
understanding of the mechanics of these tools.  The following include
motivational benefits of such study:

  - To understand well your development tools and be a better engineer
  - To work on large, complex piece of software and gain experience with
    - modularity, apis and invariants
    - incremental improvement
  - To think formally about algorithms
  - To think practically about working with data structures
  - To think about invariants, i.e., pre and post conditions, in large software products.
  - To use real-world development tools

## Course Materials

### Recommended

- Compilers: Principles, Techniques, & Tools, Second Edition by Alfred V. Aho, Monica S. Lam, Ravi Sethi, and Jeffrey D. Ullman. Addison Wesley, 2007
- The Practice of Programming by Brian W. Kernighan and Rob Pike. https://www.cs.princeton.edu/~bwk/tpop.webpage/

### Supplementary

- Advanced Compiler Design and Implementation  by Steven Muchnich. Morgan Kaufman, 1997
- Modern Compiler Implementation in C by Andrew Appel. Cambridge University Press, 1998
- Compiler Construction: Principles and Practice by Kenneth C. Louden, PWS, 1997
- Concepts of Programming Languages, 8th Edition by Robert W. Sebesta.  Addison Wesley, 2010.

## Core Policy Statements

### Academic Integrity

The Center for Academic Integrity (CAI) defines academic integrity as
a commitment, even in the face of adversity, to five fundamental
values: honesty, trust, fairness, respect, and responsibility. From
these values flow principles of behavior that enable academic
communities to translate ideals into action.
<http://academicintegrity.org/>

UCF Creed: Integrity, scholarship, community, creativity, and excellence are the core values that guide our conduct, performance, and decisions.

1. Integrity: I will practice and defend academic and personal honesty.

2. Scholarship: I will cherish and honor learning as a fundamental purpose of my membership in the UCF community.

3. Community: I will promote an open and supportive campus environment by respecting the rights and contributions of every individual.

4. Creativity: I will use my talents to enrich the human experience.

5. Excellence: I will strive toward the highest standards of performance in any endeavor I undertake.

The following definitions of plagiarism and misuse of sources come
from the Council of Writing Program Administrators
<http://wpacouncil.org/node/9> and have been adopted by UCF's
Department of Writing & Rhetoric.

#### Plagiarism
In an instructional setting, plagiarism occurs when a writer deliberately uses someone else's language, ideas, or other original (not common-knowledge) material without acknowledg­ing its source. This definition applies to texts published in print or on-line, to manuscripts, and to the work of other student writers.

#### Misuse of Sources
A student who attempts (even if clumsily) to identify and credit his or her source, but who misuses a specific citation format or incorrectly uses quotation marks or other forms of identifying material taken from other sources, has not plagiarized. Instead, such a student should be considered to have failed to cite and document sources appropri­ately.

#### Responses to Academic Dishonesty, Plagiarism, or Cheating
UCF faculty members have a responsibility for your education and the value of a UCF degree, and so seek to prevent unethical behavior and when necessary respond to infringements of academic integrity. Penalties can include a failing grade in an assignment or in the course, suspension or expulsion from the university, and/or a "Z Designation" on a student's official transcript indicating academic dishonesty, where the final grade for this course will be preceded by the letter Z. For more information about the Z Designation, see <http://goldenrule.sdes.ucf.edu/zgrade>.

For more information about UCF's Rules of Conduct, see <http://www.osc.sdes.ucf.edu/>.

#### Unauthorized Use of Class Materials
There are many fraudulent websites claiming to offer study aids to students but are actually cheat sites. They encourage students to upload course materials, such as test questions, individual assignments, and examples of graded material. Such materials are the intellectual property of instructors, the university, or publishers and may not be distributed without prior authorization. Students who engage in such activity are in violation of academic conduct standards and may face penalties.

#### Unauthorized Use of Class Notes
Faculty have reported errors in class notes being sold by third parties, and the errors may be contributing to higher failure rates in some classes. The following is a statement appropriate for distribution to your classes or for inclusion on your syllabus:

Third parties may be selling class notes from this class without my authorization. Please be aware that such class materials may contain errors, which could affect your performance or grade. Use these materials at your own risk.

#### In-Class Recording Policy
Outside of the notetaking and recording services offered by Student Accessibility Services, the creation of an audio or video recording of all or part of a class for personal use is allowed only with the advance and explicit written consent of the instructor. Such recordings are only acceptable in the context of personal, private studying and notetaking and are not authorized to be shared with anyone without the separate written approval of the instructor.

### Course Accessibility Statement 
The University of Central Florida is committed to providing access and inclusion for all persons with disabilities. This syllabus is available in alternate formats upon request. Students with disabilities who need specific access in this course, such as accommodations, should contact the professor as soon as possible to discuss various access options. Students should also connect with Student Accessibility Services (Ferrell Commons, 7F, Room 185, sas@ucf.edu, phone (407) 823-2371). Through Student Accessibility Services, a Course Accessibility Letter may be created and sent to professors, which informs faculty of potential access and accommodations that might be reasonable.

### Campus Safety Statement
Emergencies on campus are rare, but if one should arise in our class, we will all need to work together. Everyone should be aware of the surroundings and familiar with some basic safety and security concepts. 

- In case of an emergency, dial 911 for assistance. 

- Every UCF classroom contains an emergency procedure guide posted on a wall near the door. Please make a note of the guide's physical location and consider reviewing the online version at <http://emergency.ucf.edu/emergency_guide.html>.

- Familiarize yourself with evacuation routes from each of your classrooms and have a plan for finding safety in case of an emergency. (Insert class-specific details if appropriate)

- If there is a medical emergency during class, we may need to access a first aid kit or AED (Automated External Defibrillator). To learn where those items are located in this building, see <http://www.ehs.ucf.edu/AEDlocations-UCF> (click on link from menu on left). (insert class specific information if appropriate)

- To stay informed about emergency situations, sign up to receive UCF text alerts by going to my.ucf.edu and logging in. Click on "Student Self Service" located on the left side of the screen in the tool bar, scroll down to the blue "Personal Information" heading on your Student Center screen, click on "UCF Alert", fill out the information, including your e-mail address, cell phone number, and cell phone provider, click "Apply" to save the changes, and then click "OK."

- If you have a special need related to emergency situations, please speak with me during office hours.

- Consider viewing this video (<https://youtu.be/NIKYajEx4pk>) about how to manage an active shooter situation on campus or elsewhere.

### Deployed Active Duty Military Students
If you are a deployed active duty military student and feel that you may need a special accommodation due to that unique status, please contact your instructor to discuss your circumstances.
