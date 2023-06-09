(* ----------------------------------------------------------------------------------------- *)
(* ----------------------------------------- 命名参数 -------------------------------------- *)

(* 使用带标签的参数定义函数 *)
(* 
    类似 python 中的命名参数
    当指定了参数名称 first  和 last 后，后续传参可以不按照顺序，而是按照名称

    val range : first:int -> last:int -> int list = <fun>
*)
let rec range ~first: a  ~last: b = 
  if a > b then []
  else a :: range ~first: (a + 1) ~last: b;;
  

(* 指定参数的值，调用函数 *)
(* 
    - : int list = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]   
    - : int list = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]  
*)
range ~first: 1 ~last: 10;;

range ~last: 10 ~first: 1;;



(* 除非指定了标签名称，否则按标签名称定义应用 *) 

(* - : int list = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10] *)
range 1 10;;

(* - : int list = [] *)
range 10 1;;



(* ----------------------------------------------------------------------------------------- *)
(* ----------------------------------------- 可选参数 -------------------------------------- *)


let concat ?sep x y = 
  let s = match sep with None->"" | Some x -> x in
  x ^ s ^ y;;
  val concat : ?sep:string -> string -> string -> string = <fun>   


  (*   - : string = "dogcat"   *)
concat "dog" "cat";;
   

(* - : string = "dog,cat"  *)
concat "dog" "cat" ~sep:",";;


(* 
      默认值1给出步骤值
      val range : ?step:int -> int -> int -> int list = <fun>
*)
let rec range ?(step = 1) a b = 
  if a > b then []
  else a :: range ~step (a + step) b;;


(* - : int list = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10] *)
range 1 10;;



(* 
    - : int list = [1; 3; 5; 7; 9]  
*)

range 1 10 ~step:2;;



(* 
    - : int list = [1; 4; 7; 10]   
*)
range 1 ~step:3 10;;


(* 
      Error: The function applied to this argument has type ?step:int -> int list
      This argument cannot be applied without label   
*)
range 2 1 10;;
