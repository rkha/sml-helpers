(* Structure for implementation of the subset sum problem.
 * Given a set of numbers S, find two disjoint subsets X and Y where
 * the sum of the elements of the subsets are equal.
 * e.g. Given S = {1, 2, 3, 4, 5}
 *      X = {1,5}, Y = {2,4} is a valid solution.
 * solve() finds all possible solutions.
 *
 * Warning: I wrote this for correctness, not performance.
 *)
structure SubsetSumInt :> SUBSETSUMINT =
struct
    fun sum L = List.foldl (fn (x,z) => Int.+(x,z)) 0 L;

    (* Empty subsets technically have no sum and shouldn't count *)
    fun isSolution ([], _) = false
    |   isSolution (_, []) = false
    |   isSolution (X, Y) = (sum X) = (sum Y);

    (* Recursive backtracking brute-forcer *)
    fun solveHelper solAcc (currentState as (leftacc, rightacc)) [] =
        if (isSolution(leftacc, rightacc))
        then
            currentState :: solAcc
        else
            solAcc
    |   solveHelper solAcc (currentState as (leftacc, rightacc)) (x :: L) =
    let
        (* Check if we have a solution with the current left and right subsets *)
        val currentSols = if (isSolution currentState) then currentState :: solAcc else solAcc
        (* Brute-force the cases where the next element x goes into the left subset, the right subset, or no subset *)
        val leftBranchSols = solveHelper currentSols (x :: leftacc, rightacc) L
        val rightBranchSols = solveHelper leftBranchSols (leftacc, x :: rightacc) L
        val midBranchSols = solveHelper rightBranchSols currentState L
    in
        midBranchSols
    end;

    fun solve [] = []
    |   solve L = solveHelper [] ([], []) L;
end