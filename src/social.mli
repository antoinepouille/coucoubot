(* Social : garde un registre "nick -> informations" et les met à jour. On peut
   étendre le type Social.contact pour mémoriser de nouvelles informations. 

   Il faut alors penser à mettre à jour les fonctions contacts_of_json et
   json_of_contact pour gérer les nouveaux champs (et gérer le cas où on importe
   du json qui n'a pas les nouveaux champs; dans ce cas mettre une valeur par
   défaut bien choisie pour les nouveaux champs).

   Les informations contenues dans la base de contacts sont usuellement
   automatiquement mises à jour par des callbacks définis dans social.ml (grâce
   à [Signal.on']).
*)

(* Data for contacts *)
type contact = {
  lastSeen: float;
  to_tell: (string   (* from       *)
            * string (* on channel *)
            * string (* message    *)
           ) list;
}

val data : string -> contact

(* by default, [force_sync] is true. Setting data with [force_sync] as false may
   result in data loss in case of reload/crash of the bot *)
val set_data : ?force_sync:bool -> string -> contact -> unit

(* Sync the in-memory db with the on-disk storage *)
val sync : unit -> unit
