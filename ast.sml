structure lspAST =
struct

	type CancelParams = {id : string}
	type Params = CancelParams   (* parameters for the method *)
    type RequestMessage = {id : string,  method : string,  params : Params}
    
    (* error codes used in ResponseError *)
    datatype ErrorCode = ParseError | InvalidRequest | MethodNotFound | InvalidParams
                       | InternalError | ServerErrorStart | ServerErrorEnd | ServerNotInitialized
                       | UnknownErrorCode | RequestCancelled
    
    (* a responseError captures errors with message and data to be sent back in response message *)
    type ResponseError = {errorCode : ErrorCode, message : string, data : string}
    
    (* response message is a reply to a request message *)
    type ResponseMessage = {id : string,  result : string, responseError : ResponseError}
    
    type NotificationMessage = {method : string, params : Params}
    
    
    
    (* uri *)
    (* parsed into scheme, authority, path, query, and fragment *)
    type DocumentUri = {scheme: string, authority: string, path: string, query:string, fragment:string}
    
    datatype EOL = NEWLINE | CARRIAGE | CARRIAGENEWLINE
    
    type Position = {line : int, character : int}
    
    type Range = {start: Position, last : Position}
    
    type Location = {uri : DocumentUri, range : Range}
    
    (* Diagnostic related types *)
    
    datatype DiagnosticSeverity = Error | Warning | Information | Hint
    type DiagnosticRelatedInfo = {location : Location, message : string}
    type Diagnostic = {range : Range, severity : DiagnosticSeverity, code : string, source : string, message : string, relatedInformation : DiagnosticRelatedInfo list}
    
    datatype Argument = NOARG | string
    datatype Arguments = Argument | ArgumentList of Argument * Arguments
    
    type CommandId = string
    type Title = string
    type Command = Title * CommandId * Arguments
    
    type NewText = string
    type TextEdit = Range * NewText
    
    
    datatype TextEdits = TextEdit | TextEditList of TextEdit * TextEdits
    
    type TextDocumentIdentifier = DocumentUri
    type TextDocument = string
    type TextDocumentEdit = TextDocument * TextEdits
    type TextDocument = TextDocumentIdentifier
    
    
    type Overwrite = bool
    type IgnoreIfExists = bool
    type IgnoreIfNotExists = bool
    type Recursive = bool
    
    type CreateFileOptions = Overwrite * IgnoreIfExists
    type RenameFileOptions = Overwrite * IgnoreIfExists
    type DeleteFileOptions = Recursive * IgnoreIfNotExists
    
    datatype CreateFile = CREATE of DocumentUri * CreateFileOptions
    datatype RenameFile = RENAME of DocumentUri * DocumentUri * RenameFileOptions
    datatype DeleteFile = DELETE of DocumentUri * DeleteFileOptions
    
    (* Edits in a workspace *)
    datatype WorkspaceEdit = TextDocumentEdit | CreateFile | NewFile | DeleteFile
    datatype WorkspaceEdits = WorkspaceEdit | WorkspaceEditList of WorkspaceEdit * WorkspaceEdits
    
    
    (* Text Document Identifiers *)
    
    
    
    
    datatype LanguageId = WindowsBat
                        | BibTex
                        | Closure | Coffeescript | C | CPP | CSHARP | CSS
                        | Diff | Dockerfile
                        | FSHARP
                        | Git | Go | Groovy
                        | Handlebars | HTML | Ini
                        | Java | Javascript | JSON
                        | LaTeX | Less | Lua
                        | Makefile | Markdown
                        | ObjectiveC | ObjectiveCPP
                        | Perl | PHP | Powershell | Pug | Python 
                        | R | Razor | Rust
                        | Sass | SQL | Swift 
                        | TypeScript | TeX
                        | VisualBasic
                        | XML | XSL
                        | YAML
    
    (* type TextDocumentItem = DocumentUri * LanguageId * Version * Text *)
end;
