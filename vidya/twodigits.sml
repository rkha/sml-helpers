structure TwoDigits =
struct
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
end