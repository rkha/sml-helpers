signature TWODIGITS =
sig
    val size : int

    val solve : int list -> (int list * int list) list
    val solveN : int -> (int list * int list) list
    val solveAll : unit -> {id : int, group : string, sols : (int list * int list) list} list
end

signature TWODIGITSPROBLEMS =
sig
    type problem = {id : int, group : string, nums : int list}
    val problems : problem list
end