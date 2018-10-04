structure lspAST =
struct
	datatype id = ID of string;
	type message = string;
	datatype method = CODECOMPELTION;
	datatype params = CancelParams;
	
    datatype RequestMessage = RequestMessage of id * method * params;
    
    
    datatype result = Result;
    datatype errorCode = ParseError | InvalidRequest | MethodNotFound | InvalidParams
                    | InternalError | ServerErrorStart | ServerErrorEnd
                    | ServerNotInitialized | UnknownErrorCode | RequestCancelled;
    type data = string;
    datatype responseError = ResponseError of errorCode * message * data;
    datatype error = Error of responseError;
    datatype ResponseMessage = ResponseMessage of id * result * error;
    
    datatype cancelParams = CancelParams of id;
    type scheme = string;
    type authority = string;
    type path = string;
    type query = string;
    type fragment = string;
    datatype uri = DocumentUri of scheme * authority * path * query * fragment;
    
    datatype EOL = NEWLINE | CARRIAGE | CARRIAGENEWLINE;
    type line = int;
    type character = int;
    datatype position = POSITION of line * character;
    datatype range = Range of position * position;
    
    datatype location = Location of uri * range;
    
    datatype severity = Error | Warning | Information | Hint;
    datatype relatedInformation = RelatedInformation of location * message;
    type source = string;
    type code = string;
    datatype diagnostic = Diagnostic of range * severity * code * source * message * relatedInformation;
    
end
