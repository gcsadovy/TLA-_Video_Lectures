------------------------------ MODULE TCommit ------------------------------

CONSTANT RM \*this is a set of all resource managers

VARIABLE rmState \*the state of the resource manager

TCTypeOK == /\ rmState \in [RM -> {"working", "prepared", "committed", "aborted"}]

TCInit == /\ rmState = [r \in RM -> "working"] \*the array with index set RM such that [r \in RM -> "working"][rm] = "working" for all rm in RM

Prepare(r) == /\ rmState[r] = "working"
              /\ rmState' = [rmState EXCEPT ![r] = "prepared"]
              
Decide(r) == \/ /\ rmState[r] = "prepared"
                /\ \A s \in RM : rmState[s] \in {"prepared", "committed"}
                /\ rmstate' = [rmState EXCEPT ![r] = "aborted"
             \/ /\ rmState[r] \in {"working", "prepared"}
                /\ \A s \in RM : rmState[s] /= "committed"
                /\ rmState' = [rmState EXCEPT ![r] = "aborted"]
                
TCNext == \E r \in RM : Prepare(r) /\ Decide(r) \* there exists some r in RM for which this subformula is true

=============================================================================
\* Modification History
\* Last modified Thu Oct 26 13:44:47 EDT 2017 by root
\* Created Thu Oct 26 13:06:57 EDT 2017 by root
