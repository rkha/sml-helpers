functor TwoDigitsFn (TDP : TWODIGITSPROBLEMS) :> TWODIGITS =
struct
    val size = TDP.size;

    fun sum L = List.foldl (fn (x,z) => Int.+(x,z)) 0 L;

    fun solve L =
    let
        val naiveSolutions = SubsetSumInt.solve L

        fun dupeCheck ((X,Y), (X',Y')) =
        let
            val sortedX = ListMergeSort.sort (Int.>) X
            val sortedY = ListMergeSort.sort (Int.>) Y
            val sortedX' = ListMergeSort.sort (Int.>) X'
            val sortedY' = ListMergeSort.sort (Int.>) Y'
            val dupeFlag =  ((sortedX = sortedX') andalso (sortedY = sortedY')) orelse
                            ((sortedX = sortedY') andalso (sortedY = sortedX'))
        in
            if (dupeFlag)
            then
                EQUAL
            else if ((sum X) < (sum X'))
            then
                LESS
            else
                GREATER
        end
    in
        ListMergeSort.uniqueSort (dupeCheck) naiveSolutions
    end;

    fun solveN' n [] = []
    |   solveN' n ((x as {id = id, group = group, nums = nums}) :: L) =
        if (n = id)
        then
            solve nums
        else
            solveN' n L;
    fun solveN n = solveN' n (TDP.problems);

    fun solveAll() = List.map (fn {id=id, group=group, nums=nums} => {id=id, group=group, sols=solve nums}) (TDP.problems);

    fun isPartition (X,Y) = ((length X) + (length Y) = size);
    fun findAllPartitions() =
        List.filter (fn {id=id, group=group, sols=[]} => false | _ => true) (
            List.map (fn {id=id, group=group, sols=sols} => {id=id, group=group, sols=List.filter (isPartition) sols}) (solveAll())
        );
end;

structure TwoDigits :> TWODIGITS = TwoDigitsFn (TwoDigitsProblems);