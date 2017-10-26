--------------------------- MODULE simpleProgram1 ---------------------------

EXTENDS Integers
VARIABLES i, pc

Init == (pc = "start") /\ (i = 0)

Pick == \/ /\ pc = "start"
           /\ i' \in 0..1000
           /\ pc' = "middle"

Add1 == \/ /\ pc = "middle"
           /\ i' = i + 1
           /\ pc' = "done"
           
Next == Pick \/ Add1 


=============================================================================
\* Modification History
\* Last modified Thu Oct 26 10:38:06 CDT 2017 by root
\* Created Thu Oct 26 10:33:56 CDT 2017 by root
