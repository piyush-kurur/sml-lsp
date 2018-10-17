structure lspAST =
struct
	type Id = string;  (* Unique Id identifying a request/response *)
	type Message = string;
	datatype Method = CancelRequest | string;  (* Method called for the request *)
	datatype Params = CancelParams | string;  (* parameters for the method *)
    type RequestMessage = Id * Method * Params;
    
    datatype ErrorCode = ParseError | InvalidRequest | MethodNotFound | InvalidParams
                   | InternalError | ServerErrorStart | ServerErrorEnd | ServerNotInitialized
                   | UnknownErrorCode | RequestCancelled;
    type Data = string  (* structured data about error code *)
    type ResponseError = ErrorCode * Message * Data;
    type Result = string; (* result of the response *)
    type ResponseMessage = Id * Result * ResponseError;
    
    type NotificationMessage = Method * Params;
    
    type CancelParams = Id;
    
    (* uri *)
    (* parsed into scheme, authority, path, query, and fragment *)
    type Scheme = string;
    type Authority = string;
    type Path = string;
    type Query = string;
    type Fragment = string;
    
    type DocumentUri = Scheme * Authority * Path * Query * Fragment;
    
    datatype EOL = NEWLINE | CARRIAGE | CARRIAGENEWLINE;
    
    type Line = int;
    type CharPos = int;
    type Position = Line * CharPos;
    
    type Range = Position * Position;
    
    type Location = DocumentUri * Range;
    
    (* Diagnostic related types *)
    
    datatype DiagnosticSeverity = Error | Warning | Information | Hint;
    datatype DiagnosticCode = string;  (* Diagnostic Code for appearing in UI *)
    type DiagnosticSource = string;   (* source of the diagnostic - human readable string *)
    type DiagnosticMessage = string;
    type DiagnosticRelatedInfoMessage = string;
    type DiagnosticRelatedInfo = Location * DiagnosticRelatedInfoMessage;
    type Diagnostic = Range * DiagnosticSeverity * DiagnosticCode * DiagnosticSource * DiagnosticMessage * DiagnosticRelatedInfo;
    
    datatype Argument = NOARG | string;
    datatype Arguments = Argument | ArgumentList of Argument * Arguments;
    
    type CommandId = string;
    type Title = string;
    type Command = Title * CommandId * Arguments;
    
    type NewText = string;
    type TextEdit = Range * NewText;
    
    
    datatype TextEdits = TextEdit | TextEditList of TextEdit * TextEdits;
    
    type TextDocumentIdentifier = DocumentUri;
    type TextDocument = string;
    type TextDocumentEdit = TextDocument * TextEdits;
    type TextDocument = TextDocumentIdentifier;
    
    
    type Overwrite = bool;
    type IgnoreIfExists = bool;
    type IgnoreIfNotExists = bool;
    type Recursive = bool;
    
    type CreateFileOptions = Overwrite * IgnoreIfExists;
    type RenameFileOptions = Overwrite * IgnoreIfExists;
    type DeleteFileOptions = Recursive * IgnoreIfNotExists;
    
    datatype CreateFile = CREATE of DocumentUri * CreateFileOptions;
    datatype RenameFile = RENAME of DocumentUri * DocumentUri * RenameFileOptions;
    datatype DeleteFile = DELETE of DocumentUri * DeleteFileOptions;
    
    (* Edits in a workspace *)
    datatype WorkspaceEdit = TextDocumentEdit | CreateFile | NewFile | DeleteFile;
    datatype WorkspaceEdits = WorkspaceEdit | WorkspaceEditList of WorkspaceEdit * WorkspaceEdits;
    
    
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
                        | YAML;
    
    (* type TextDocumentItem = DocumentUri * LanguageId * Version * Text; *)
end
