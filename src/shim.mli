type stub

module Response : sig
  type t [@@deriving show, eq]

  val success : ?payload:string -> unit -> t

  val error : ?message:string -> unit -> t
end

val getFunctionAndParams : stub -> string * string list

val getState : stub -> string -> string

val putState : stub -> key:string -> value:string -> unit

val loop :
  id_name:string ->
  target:string ->
  init:(stub -> Response.t) ->
  invoke:(stub -> Response.t) ->
  'a
