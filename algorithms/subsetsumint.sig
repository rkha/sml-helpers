(* Signature for implementation of the subset sum problem.
 * Given a set of numbers S, find two disjoint subsets X and Y where
 * the sum of the elements of the subsets are equal.
 * e.g. Given S = {1, 2, 3, 4, 5}
 *      X = {1,5}, Y = {2,4} is a valid solution.
 * solve() finds all possible solutions.
 * Solutions will be a pair of lists representing the subsets,
 * so the solution list will be a list of pairs of lists.
 *)
signature SUBSETSUMINT =
sig
    val solve : int list -> (int list * int list) list
end