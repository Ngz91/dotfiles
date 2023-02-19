function ConstructColour(colour)
	return { gui = colour }
end

local Transparent = ConstructColour("NONE")
local Grey1 = ConstructColour("#262626")
local Grey2 = ConstructColour("#424242")
local Grey3 = ConstructColour("#8B8B8B")
local Grey4 = ConstructColour("#bdbdbd")
local Grey5 = ConstructColour("#F8F8F8")

local Violet = ConstructColour("#D484FF")
local Blue = ConstructColour("#2f628e")
local Cyan = ConstructColour("#00f1f5")
local Green = ConstructColour("#A9FF68")
local DarkGreen = ConstructColour("#142818")
local Yellow = ConstructColour("#FFF59D")
local Orange = ConstructColour("#F79000")
local Red = ConstructColour("#F70067")
local DarkRed = ConstructColour("#3F0001")
local FloatBackground = ConstructColour("#132434")
local Background = ConstructColour("NONE")

local function setHighlight(group, args)
	local fg = args[1]
	local bg = Background
	local attrs
	if type(args[2]) == "table" then
		bg = args[2]
		if type(args[3]) == "string" then
			attrs = args[3]
		end
	elseif type(args[2]) == "string" then
		attrs = args[2]
	end
	local args = { fg = fg.gui, bg = bg.gui }
	if attrs then
		for val in vim.gsplit(attrs, ",") do
			args[val] = true
		end
	end
	vim.api.nvim_set_hl(0, group, args)
end

local function loadHighlights(highlights)
	for group, groupArgs in pairs(highlights) do
		setHighlight(group, groupArgs)
	end
end

local Normal = Grey5
local Border = Grey3
local Decoration = Orange
local Hidden = Grey3
local BuiltIn = Red
local VarName = Grey5
local FuncName = Cyan
local TypeName = Violet
local Key = Cyan
local Val = Violet
local Parameter = Green
local String = Yellow
local Operator = Orange
local Success = Green
local Warning = Yellow
local Info = Cyan
local Error = Red

-- For reference elsewhere
loadHighlights({
	Normal = { Normal },
	NormalFloat = { Normal },
	Border = { Border },
	FloatBorder = { Border },
	Decoration = { Orange },
	Hidden = { Grey3 },
	Path = { Blue },
	BuiltIn = { Red },
	VarName = { Grey5, "bold" },
	FuncName = { Cyan },
	TypeName = { Violet },
	Key = { Cyan },
	Val = { Violet },
	String = { Yellow },
	Operator = { Orange },
	Success = { Green },
	Warning = { Yellow },
	Info = { Cyan },
	Error = { Red },
	User1 = { Success, FloatBackground },
	User2 = { Warning, FloatBackground },
	User3 = { Error, FloatBackground },
	User4 = { Grey1, Info },
	-- Vim
	Cursor = { Grey1, Red },
	CursorLine = { Transparent, Grey1 },
	CursorColumn = { Transparent, Grey1 },
	ColorColumn = { Transparent, Grey1 },
	LineNr = { Hidden },
	CursorLineNr = { Success, "bold" },
	VertSplit = { Hidden },
	MatchParen = { Key, "underline" },
	StatusLine = { Normal },
	StatusLineNC = { Hidden },
	WinBar = { Normal },
	WinBarSep = { Decoration, Grey1 },
	WinBarPath = { Grey5, Grey1 },
	IncSearch = { Green, "bold,underline" },
	Search = { Green, "bold,underline" },
	Directory = { Cyan },
	Folded = { Grey3 },
	WildMenu = { Cyan },
	VisualNOS = { Grey3, Yellow },
	ModeMsg = { Yellow },
	FoldColumn = { Grey4 },
	MoreMsg = { Yellow },
	cursorim = { Violet },
	Pmenu = { Grey4 },
	PmenuSel = { Transparent, Grey3, "bold" },
	PMenuSbar = { Transparent },
	PMenuThumb = { Transparent, Grey4 },
	Visual = { Transparent, Grey2, "bold,underline" },
	EndOfBuffer = { Grey1 },
	Underlined = { Transparent, "underline" },
	SpellBad = { Transparent, "undercurl" },
	SpellCap = { Transparent, "undercurl" },
	SpellLocal = { Transparent, "undercurl" },
	SignColumn = { Key },
	Question = { Info },
	TabLineFill = { Grey3 },
	NotificationInfo = { Normal, FloatBackground },
	NotificationError = { Error, FloatBackground },
	NotificationWarning = { Warning, FloatBackground },
	WinSeparator = { Grey2 },
	-- General
	Boolean = { Val },
	Character = { Val },
	Comment = { Hidden, "italic" },
	Conditional = { BuiltIn },
	Constant = { VarName },
	Define = { BuiltIn },
	DiffAdd = { Background, DarkGreen },
	DiffChange = { Background, Grey1 },
	DiffDelete = { Background, DarkRed },
	DiffText = { Background, DarkRed },
	ErrorMsg = { Error },
	WarningMsg = { Warning },
	Float = { Val },
	Function = { FuncName },
	Identifier = { VarName },
	Keyword = { BuiltIn },
	Label = { Key },
	NonText = { Hidden },
	Number = { Val },
	PreProc = { Key },
	Special = { Cyan },
	SpecialKey = { BuiltIn },
	Statement = { BuiltIn },
	Tag = { Key },
	Title = { Normal, "bold" },
	Todo = { Normal, "bold" },
	Type = { TypeName },
	SpecialComment = { Info, "bold" },
	Typedef = { TypeName },
	PreCondit = { BuiltIn },
	Include = { BuiltIn },
	Ignore = { BuiltIn },
	Delimiter = { Decoration },
	Conceal = { Transparent, "bold" },
	-- Viml
	vimContinue = { Decoration },
	vimFunction = { FuncName },
	vimIsCommand = { VarName },
	-- Haskell
	haskellIdentifier = { FuncName },
	haskellDecl = { BuiltIn },
	haskellDeclKeyword = { BuiltIn },
	haskellLet = { BuiltIn },
	-- Vim Fugitive
	diffRemoved = { Background, DarkRed },
	diffAdded = { Background, DarkGreen },
	-- HTML
	htmlTagName = { Key },
	htmlSpecialTagName = { BuiltIn },
	htmlTag = { Decoration },
	htmlEndTag = { Decoration },
	htmlArg = { VarName },
	-- Vim Signify
	SignifySignAdd = { Success, "bold" },
	SignifySignDelete = { Error, "bold" },
	SignifySignChange = { Warning, "bold" },
	--Floaterm
	FloatermBorder = { Border },
	-- ALE
	ALEWarningSign = { Warning },
	ALEVirtualTextError = { Error },
	ALEVirtualTextWarning = { Warning },
	ALEVirtualTextInfo = { Info },
	-- Markdown
	markdownHeadingDelimiter = { BuiltIn },
	markdownCodeDelimiter = { BuiltIn },
	markdownCode = { Hidden },
	markdownRule = { BuiltIn },
	markdownUrl = { Key },
	markdownEscape = { Normal },
	-- Makefile
	makeCommands = { Normal, "bold" },
	-- vim-signature
	SignatureMarkText = { TypeName, "bold" },
	-- Vista.vim
	VistaScope = { TypeName, "bold" },
	VistaTag = { FuncName },
	-- LeaderF
	Lf_hl_popup_window = { Normal, FloatBackground },
	Lf_hl_popup_blank = { Hidden, FloatBackground },
	Lf_hl_popup_inputText = { Key, FloatBackground },
	Lf_hl_cursorline = { Normal, FloatBackground, "bold" },
	-- vim-which-key
	WhichKeySeperator = { BuiltIn },
	WhichKeyFloating = { VarName, FloatBackground, "bold" },
	WhichKeyGroup = { TypeName },
	WhichKey = { VarName },
	WhichKeyDesc = { Info, "bold" },
	-- JSX/TSX
	jsxTagName = { Key },
	jsxComponentName = { TypeName },
	jsxAttrib = { Green },
	-- Javascript
	jsImport = { BuiltIn },
	jsExport = { BuiltIn },
	jsVariableType = { BuiltIn },
	jsAssignmentEqual = { BuiltIn },
	jsParens = { Decoration },
	jsObjectBraces = { Decoration },
	jsFunctionBraces = { Decoration },
	-- vim-jumpmotion
	JumpMotion = { Red, "bold" },
	JumpMotionTail = { Yellow },
	-- TypeScript
	typescriptVariable = { BuiltIn },
	typescriptImport = { BuiltIn },
	typescriptExport = { BuiltIn },
	typescriptCall = { VarName },
	typescriptTypeReference = { TypeName },
	typescriptArrowFunc = { BuiltIn },
	typescriptBraces = { Decoration },
	typescriptMember = { Green },
	typescriptObjectLabel = { Key },
	typescriptStringLiteralType = { TypeName },
	typescriptInterfaceName = { TypeName },
	typescriptFuncType = { VarName },
	typescriptFuncTypeArrow = { BuiltIn },
	--hiPairs
	hiPairs_matchPair = { Success, "bold,underline" },
	hiPairs_unmatchPair = { Error, "bold,underline" },
	--LaTex
	texBeginEndName = { FuncName },
	--YAML
	yamlBlockMappingKey = { Key },
	--ini
	dosiniLabel = { Key },
	dosiniValue = { Val },
	dosiniHeader = { BuiltIn },
	-- Conflict Markers
	ConflictMarkerBegin = { Transparent, DarkGreen },
	ConflictMarkerOurs = { Transparent, DarkGreen },
	ConflictMarkerTheirs = { Transparent, DarkRed },
	ConflictMarkerEnd = { Transparent, DarkRed },
	ConflictMarkerCommonAncestorsHunk = { Transparent, Red },
	-- TreeSitter
	TSError = { Error },
	TSComment = { Hidden, "italic" },
	TSPunctDelimiter = { Decoration },
	TSPunctBracket = { Decoration },
	TSPunctSpecial = { Decoration },
	TSConstant = { VarName },
	TSConstBuiltin = { BuiltIn },
	TSConstMacro = { BuiltIn },
	TSString = { String },
	TSStringRegex = { Operator },
	TSStringEscape = { Operator },
	TSCharacter = { Val },
	TSNumber = { Val },
	TSBoolean = { Val },
	TSFloat = { Val },
	TSFunction = { FuncName },
	TSFuncBuiltin = { BuiltIn },
	TSFuncMacro = { BuiltIn },
	TSParameter = { Green },
	TSParameterReference = { Green },
	TSMethod = { FuncName },
	TSField = { FuncName },
	TSProperty = { Parameter },
	TSTag = { FuncName },
	TSConstructor = { TypeName },
	TSConditional = { BuiltIn },
	TSRepeat = { BuiltIn },
	TSLabel = { Key },
	TSOperator = { Operator },
	TSKeyword = { BuiltIn },
	TSKeywordFunction = { BuiltIn },
	TSException = { Error },
	TSType = { TypeName },
	TSTypeBuiltin = { TypeName },
	TSStructure = { Error },
	TSInclude = { BuiltIn },
	TSAnnotation = { String },
	TSText = { String },
	TSStrong = { Transparent, "bold" },
	TSEmphasis = { Transparent, "bold,underline" },
	TSUnderline = { Transparent, "underline" },
	TSTitle = { Key, "bold" },
	TSLiteral = { Decoration },
	TSURI = { Info },
	TSVariable = { VarName },
	TSVariableBuiltin = { BuiltIn },
	TSDefinition = { Transparent, "bold,underline" },
	TSDefinitionUsage = { Transparent, "bold,underline" },
	TSCurrentScope = { Transparent, "bold" },
	TSTextReference = { Normal, "bold,underline" },
	-- Golang
	goFunctionCall = { FuncName },
	goVarDefs = { VarName },
	-- Telescope
	TelescopeBorder = { Border },
	-- barbar
	BufferCurrent = { Normal, FloatBackground },
	BufferCurrentMod = { Info, FloatBackground, "bold" },
	BufferCurrentSign = { Info, FloatBackground },
	BufferCurrentTarget = { Info, Grey1, "bold" },
	BufferVisible = { Normal, Grey1, "bold" },
	BufferVisibleMod = { Normal, Grey1, "bold,underline" },
	BufferVisibleSign = { Info, Grey1 },
	BufferVisibleTarget = { Error, "bold,underline" },
	BufferInactive = { Grey3, Grey1 },
	BufferInactiveMod = { Grey3, Grey1, "underline" },
	BufferInactiveSign = { Grey3, Grey1 },
	BufferInactiveTarget = { Error, Grey1, "bold" },
	BufferTabpages = { Info, "bold" },
	BufferTabpageFill = { Grey3 },
	-- LSP
	DiagnosticsError = { Error },
	DiagnosticsWarning = { Warning },
	DiagnosticsInformation = { Info },
	DiagnosticsHint = { Hidden },
	LspReferenceText = { Background, "bold,underline" },
	LspReferenceRead = { Background, "bold,underline" },
	LspReferenceWrite = { Background, "bold,underline" },
	-- Lsp saga
	LspFloatWinBorder = { Border },
	ProviderTruncateLine = { Hidden },
	LspSagaFinderSelection = { Green, "bold" },
	LspSagaBorderTitle = { BuiltIn, "bold" },
	TargetWord = { BuiltIn },
	ReferencesCount = { Val },
	DefinitionCount = { Val },
	TargetFileName = { Operator },
	DefinitionIcon = { Decoration },
	ReferencesIcon = { Decoration },
	SagaShadow = { Transparent, Grey1 },
	DiagnosticTruncateLine = { Hidden },
	DiagnosticError = { Error },
	DiagnosticWarning = { Warning },
	DiagnosticInformation = { Info },
	DiagnosticHint = { Hidden },
	DefinitionPreviewTitle = { BuiltIn, "bold" },
	LspSagaDiagnosticBorder = { Border },
	LspSagaDiagnosticHeader = { BuiltIn },
	LspSagaDiagnostcTruncateLine = { Hidden },
	LspDiagnosticsFloatingError = { Error },
	LspDiagnosticsFloatingWarn = { Warning },
	LspDiagnosticsFloatingInfo = { Info },
	LspDiagnosticsFloatingHint = { Hidden },
	LspSagaShTruncateLine = { Hidden },
	LspSagaDocTruncateLine = { Hidden },
	LspSagaCodeActionTitle = { BuiltIn },
	LspSagaCodeActionTruncateLine = { Hidden },
	LspSagaCodeActionContent = { Grey4 },
	LspSagaRenamePromptPrefix = { Decoration },
	LspSagaRenameBorder = { Border },
	LspSagaHoverBorder = { Border },
	LspSagaSignatureHelpBorder = { Border },
	LspSagaLspFinderBorder = { Border },
	LspSagaCodeActionBorder = { Border },
	LspSagaAutoPreview = { Yellow },
	LspSagaDefPreviewBorder = { Border },
	LspCodeLens = { TypeName, "italic" },
	IndentBlanklineChar = { Grey2 },
	IndentBlanklineContextChar = { Key },
	-- LSP Signature
	LspSelectedParam = { Normal, "bold,underline" },
	-- LSP Inlay-Hints
	LspInlayHint = { Hidden },
	-- nvim-compe
	CompeDocumentationBorder = { Border },

	--nvim-cmp
	CmpItemAbbr = { Normal },
	CmpDocumentationBorder = { Border },
	CmpItemAbbrMatch = { Normal, "bold" },
	CmpItemAbbrMatchFuzzy = { Normal, "bold,underline" },
	CmpItemAbbrDeprecated = { Normal, "bold" },
	CmpItemKindVariable = { VarName, "bold" },
	CmpItemKindInterface = { TypeName, "bold" },
	CmpItemKindText = { Normal, "bold" },
	CmpItemKindFunction = { FuncName, "bold" },
	CmpItemKindMethod = { FuncName, "bold" },
	CmpItemKindKeyword = { BuiltIn, "bold" },
	CmpItemKindProperty = { Key, "bold" },
	CmpItemKindUnit = { Yellow, "bold" },
	CmpBorderedWindow_FloatBorder = { Border },

	logDate = { Info },
	logLevelDebug = { Grey3 },
	logLevelInfo = { Info },

	--symbols-outline.nvim
	FocusedSymbol = { Background, "bold" },
})
