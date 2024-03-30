open Core

let prompt () =
  printf "Oisp]=> %!"
;;

let read () =
  prompt ();
  In_channel.input_line In_channel.stdin
;;

let eval expr =
  expr
;;

let rec rep () =
  let resp =
    match read () with
    | None ->
       failwith "exiting"
    | Some expr ->
       eval expr
  in
  printf "%s\n%!" resp;
  rep ()
;;

let () =
  rep ()
;;
