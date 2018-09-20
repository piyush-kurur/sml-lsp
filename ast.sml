structure jsonRpcAst = struct {

(* header *)
datatype contenttype = Contenttype of string;
datatype contentlength = int;
datatype header = HEADER of contenttype * contentlength;

(* request message *)
datatype jsonrpc = JSONRPC of string;
datatype method = METHOD of string; (* this method will be invoked on a request *)
datatype params = PARAMS of object; (* "object" can be an array or must match a predefined type by server*)
datatype idtypes = string | int | NULL;
datatype id = ID of idtypes;

datatype request = REQUEST of jsonrpc * method * params * id;

(* notification message *)
datatype notification = NOTIFICATION of jsonrpc * method * params;

(* response message *)
(* produced by the method invoked by request object *)

datatype result = RESULT of any; (* this value is determined by the method invoked *)

datatype code = CODE of int; (* error code*)
datatype desc = DESC of string; (* error code description *)
datatype error = ERROR of code * desc * data;

datatype response = RESULTRESPONSE of jsonrpc * result * id
                  | ERRORRESPONSE of jsonrpc * error * id;


datatype content = REQUESTCONTENT of request
                 | RESPONSECONTENT of response
                 | NOTIFICATIONCONTENT of notification;

(* message *)
datatype message = MESSAGE of header * content;


}
