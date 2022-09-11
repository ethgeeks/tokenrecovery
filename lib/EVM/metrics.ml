(* This is free and unencumbered software released into the public domain. *)

let rec program_size program =
  List.fold_left (fun sum block -> sum + block_size block) 0 program

and block_size (_, block) = opcodes_size block

and opcodes_size opcodes =
  List.fold_left (fun sum op -> sum + opcode_size op) 0 opcodes

and opcode_size = function
  | PUSH (n, _) -> 1 + n
  | _ -> 1
