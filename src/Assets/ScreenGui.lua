--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 39 | Scripts: 0 | Modules: 0 | Tags: 0
local G2L = {};

-- StarterGui.ScreenGui
G2L["1"] = Instance.new("ScreenGui");
G2L["1"]["IgnoreGuiInset"] = true;
G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
G2L["1"]["ResetOnSpawn"] = false;


-- StarterGui.ScreenGui.Frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
G2L["2"]["Size"] = UDim2.new(0, 430, 0, 354);
G2L["2"]["Position"] = UDim2.new(0.34797, 0, 0.24, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 181, 255);


-- StarterGui.ScreenGui.Frame.UICorner
G2L["3"] = Instance.new("UICorner", G2L["2"]);
G2L["3"]["CornerRadius"] = UDim.new(0, 4);


-- StarterGui.ScreenGui.Frame.Sidebar
G2L["4"] = Instance.new("Frame", G2L["2"]);
G2L["4"]["ZIndex"] = 0;
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
G2L["4"]["AnchorPoint"] = Vector2.new(1, 0);
G2L["4"]["ClipsDescendants"] = true;
G2L["4"]["Size"] = UDim2.new(0.5, 0, 1, 0);
G2L["4"]["Position"] = UDim2.new(0, 4, 0, 0);
G2L["4"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["4"]["Name"] = [[Sidebar]];


-- StarterGui.ScreenGui.Frame.Sidebar.Songs
G2L["5"] = Instance.new("ScrollingFrame", G2L["4"]);
G2L["5"]["Active"] = true;
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["Name"] = [[Songs]];
G2L["5"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
G2L["5"]["ClipsDescendants"] = false;
G2L["5"]["Size"] = UDim2.new(1, -8, 1, -16);
G2L["5"]["ScrollBarImageColor3"] = Color3.fromRGB(146, 146, 146);
G2L["5"]["Position"] = UDim2.new(0, 0, 0, 8);
G2L["5"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["5"]["ScrollBarThickness"] = 3;
G2L["5"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Frame.Sidebar.Songs.Song
G2L["6"] = Instance.new("Frame", G2L["5"]);
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
G2L["6"]["Size"] = UDim2.new(1, 0, 0, 32);
G2L["6"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["6"]["Name"] = [[Song]];
G2L["6"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Frame.Sidebar.Songs.Song.Title
G2L["7"] = Instance.new("TextLabel", G2L["6"]);
G2L["7"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
G2L["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["TextSize"] = 16;
G2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["7"]["TextColor3"] = Color3.fromRGB(232, 232, 232);
G2L["7"]["BackgroundTransparency"] = 1;
G2L["7"]["Size"] = UDim2.new(1, -48, 1, 0);
G2L["7"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["7"]["Text"] = [[Festival.mid]];
G2L["7"]["Name"] = [[Title]];
G2L["7"]["Position"] = UDim2.new(0, 48, 0, 2);


-- StarterGui.ScreenGui.Frame.Sidebar.Songs.Song.Icon
G2L["8"] = Instance.new("ImageLabel", G2L["6"]);
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["ImageColor3"] = Color3.fromRGB(232, 232, 232);
G2L["8"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["8"]["Image"] = [[rbxassetid://5915498345]];
G2L["8"]["Size"] = UDim2.new(0, 16, 0, 16);
G2L["8"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["8"]["BackgroundTransparency"] = 1;
G2L["8"]["Name"] = [[Icon]];
G2L["8"]["Position"] = UDim2.new(0, 14, 0.5, 0);


-- StarterGui.ScreenGui.Frame.Sidebar.Songs.Song.Selection
G2L["9"] = Instance.new("Frame", G2L["6"]);
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(38, 172, 255);
G2L["9"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["9"]["Size"] = UDim2.new(0, 3, 0, 16);
G2L["9"]["Position"] = UDim2.new(0, -4, 0.5, 0);
G2L["9"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["9"]["Name"] = [[Selection]];


-- StarterGui.ScreenGui.Frame.Sidebar.Songs.AutoLayout
G2L["a"] = Instance.new("UIListLayout", G2L["5"]);
G2L["a"]["Padding"] = UDim.new(0, 8);
G2L["a"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["a"]["Name"] = [[AutoLayout]];


-- StarterGui.ScreenGui.Frame.Sidebar.Songs.Padding
G2L["b"] = Instance.new("UIPadding", G2L["5"]);
G2L["b"]["PaddingTop"] = UDim.new(0, 16);
G2L["b"]["PaddingRight"] = UDim.new(0, 8);
G2L["b"]["Name"] = [[Padding]];
G2L["b"]["PaddingLeft"] = UDim.new(0, 8);
G2L["b"]["PaddingBottom"] = UDim.new(0, 8);


-- StarterGui.ScreenGui.Frame.Sidebar.UICorner
G2L["c"] = Instance.new("UICorner", G2L["4"]);
G2L["c"]["CornerRadius"] = UDim.new(0, 4);


-- StarterGui.ScreenGui.Frame.Preview
G2L["d"] = Instance.new("Frame", G2L["2"]);
G2L["d"]["BorderSizePixel"] = 0;
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["ClipsDescendants"] = true;
G2L["d"]["Size"] = UDim2.new(0, 365, 0, 172);
G2L["d"]["Position"] = UDim2.new(0, 32, 0, 102);
G2L["d"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["d"]["Name"] = [[Preview]];
G2L["d"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Frame.Preview.Notes
G2L["e"] = Instance.new("Frame", G2L["d"]);
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["AnchorPoint"] = Vector2.new(0, 1);
G2L["e"]["Size"] = UDim2.new(1, 0, 0, 0);
G2L["e"]["Position"] = UDim2.new(0, 0, 1, 0);
G2L["e"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["e"]["Name"] = [[Notes]];
G2L["e"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Frame.Preview.Notes.Note
G2L["f"] = Instance.new("Frame", G2L["e"]);
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(38, 172, 255);
G2L["f"]["AnchorPoint"] = Vector2.new(0, 1);
G2L["f"]["Size"] = UDim2.new(0.016, 0, 0, 24);
G2L["f"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["f"]["Name"] = [[Note]];


-- StarterGui.ScreenGui.Frame.Main
G2L["10"] = Instance.new("Frame", G2L["2"]);
G2L["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["10"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["10"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["10"]["Name"] = [[Main]];
G2L["10"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Frame.Main.Title
G2L["11"] = Instance.new("TextLabel", G2L["10"]);
G2L["11"]["TextWrapped"] = true;
G2L["11"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
G2L["11"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["TextSize"] = 24;
G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["11"]["TextColor3"] = Color3.fromRGB(232, 232, 232);
G2L["11"]["BackgroundTransparency"] = 1;
G2L["11"]["Size"] = UDim2.new(0, 329, 0, 24);
G2L["11"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["11"]["Text"] = [[Festival]];
G2L["11"]["Name"] = [[Title]];
G2L["11"]["Position"] = UDim2.new(0, 77, 0, 48);


-- StarterGui.ScreenGui.Frame.Main.Controller
G2L["12"] = Instance.new("Frame", G2L["10"]);
G2L["12"]["BorderSizePixel"] = 0;
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
G2L["12"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["12"]["Size"] = UDim2.new(1, -64, 0, 32);
G2L["12"]["Position"] = UDim2.new(0.5, 0, 1, -32);
G2L["12"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["12"]["Name"] = [[Controller]];
G2L["12"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Frame.Main.Controller.UICorner
G2L["13"] = Instance.new("UICorner", G2L["12"]);
G2L["13"]["CornerRadius"] = UDim.new(0, 4);


-- StarterGui.ScreenGui.Frame.Main.Controller.Scrubber
G2L["14"] = Instance.new("Frame", G2L["12"]);
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(129, 129, 129);
G2L["14"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["14"]["Size"] = UDim2.new(0.75, 0, 0, 3);
G2L["14"]["Position"] = UDim2.new(0.25, 0, 0.5, 0);
G2L["14"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["14"]["Name"] = [[Scrubber]];
G2L["14"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Frame.Main.Controller.Scrubber.UICorner
G2L["15"] = Instance.new("UICorner", G2L["14"]);
G2L["15"]["CornerRadius"] = UDim.new(1, 0);


-- StarterGui.ScreenGui.Frame.Main.Controller.Scrubber.Hitbox
G2L["16"] = Instance.new("Frame", G2L["14"]);
G2L["16"]["BorderSizePixel"] = 0;
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
G2L["16"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["16"]["Size"] = UDim2.new(1, 12, 1, 16);
G2L["16"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["16"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["16"]["Name"] = [[Hitbox]];


-- StarterGui.ScreenGui.Frame.Main.Controller.Scrubber.Fill
G2L["17"] = Instance.new("Frame", G2L["14"]);
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(129, 129, 129);
G2L["17"]["AnchorPoint"] = Vector2.new(1, 0);
G2L["17"]["Size"] = UDim2.new(0.7, 0, 1, 0);
G2L["17"]["Position"] = UDim2.new(1, 0, 0, 0);
G2L["17"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["17"]["Name"] = [[Fill]];


-- StarterGui.ScreenGui.Frame.Main.Controller.Scrubber.Fill.UICorner
G2L["18"] = Instance.new("UICorner", G2L["17"]);
G2L["18"]["CornerRadius"] = UDim.new(1, 0);


-- StarterGui.ScreenGui.Frame.Main.Controller.Scrubber.Progress
G2L["19"] = Instance.new("Frame", G2L["14"]);
G2L["19"]["ZIndex"] = 2;
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(38, 172, 255);
G2L["19"]["Size"] = UDim2.new(0.3, 0, 1, 0);
G2L["19"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["19"]["Name"] = [[Progress]];


-- StarterGui.ScreenGui.Frame.Main.Controller.Scrubber.Progress.UICorner
G2L["1a"] = Instance.new("UICorner", G2L["19"]);
G2L["1a"]["CornerRadius"] = UDim.new(1, 0);


-- StarterGui.ScreenGui.Frame.Main.Controller.Scrubber.Progress.Marker
G2L["1b"] = Instance.new("Frame", G2L["19"]);
G2L["1b"]["ZIndex"] = 2;
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(38, 172, 255);
G2L["1b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1b"]["Size"] = UDim2.new(0, 20, 0, 20);
G2L["1b"]["Position"] = UDim2.new(1, 0, 0.5, 0);
G2L["1b"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["1b"]["Name"] = [[Marker]];


-- StarterGui.ScreenGui.Frame.Main.Controller.Scrubber.Progress.Marker.UICorner
G2L["1c"] = Instance.new("UICorner", G2L["1b"]);
G2L["1c"]["CornerRadius"] = UDim.new(1, 0);


-- StarterGui.ScreenGui.Frame.Main.Controller.Scrubber.Progress.Marker.Fill
G2L["1d"] = Instance.new("Frame", G2L["1b"]);
G2L["1d"]["ZIndex"] = 2;
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
G2L["1d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1d"]["Size"] = UDim2.new(1, -6, 1, -6);
G2L["1d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["1d"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["1d"]["Name"] = [[Fill]];


-- StarterGui.ScreenGui.Frame.Main.Controller.Scrubber.Progress.Marker.Fill.UICorner
G2L["1e"] = Instance.new("UICorner", G2L["1d"]);
G2L["1e"]["CornerRadius"] = UDim.new(1, 0);


-- StarterGui.ScreenGui.Frame.Main.Controller.Resume
G2L["1f"] = Instance.new("ImageButton", G2L["12"]);
G2L["1f"]["BackgroundColor3"] = Color3.fromRGB(129, 129, 129);
G2L["1f"]["ImageColor3"] = Color3.fromRGB(232, 232, 232);
G2L["1f"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["1f"]["Image"] = [[rbxassetid://5915551861]];
G2L["1f"]["Size"] = UDim2.new(0, 12, 0, 12);
G2L["1f"]["BackgroundTransparency"] = 1;
G2L["1f"]["Name"] = [[Resume]];
G2L["1f"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["1f"]["Position"] = UDim2.new(0, 0, 0.5, 1);


-- StarterGui.ScreenGui.Frame.Main.Controller.Time
G2L["20"] = Instance.new("TextLabel", G2L["12"]);
G2L["20"]["TextWrapped"] = true;
G2L["20"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
G2L["20"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["TextSize"] = 16;
G2L["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["20"]["TextColor3"] = Color3.fromRGB(232, 232, 232);
G2L["20"]["BackgroundTransparency"] = 1;
G2L["20"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["20"]["Size"] = UDim2.new(0, 68, 0, 24);
G2L["20"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["20"]["Text"] = [[0:06]];
G2L["20"]["Name"] = [[Time]];
G2L["20"]["Position"] = UDim2.new(0, 32, 0.5, 1);


-- StarterGui.ScreenGui.Frame.Main.TogglePreview
G2L["21"] = Instance.new("ImageButton", G2L["10"]);
G2L["21"]["BorderSizePixel"] = 0;
G2L["21"]["AutoButtonColor"] = false;
G2L["21"]["BackgroundColor3"] = Color3.fromRGB(232, 232, 232);
G2L["21"]["Size"] = UDim2.new(0, 24, 0, 24);
G2L["21"]["Name"] = [[TogglePreview]];
G2L["21"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["21"]["Position"] = UDim2.new(0, 32, 0, 48);


-- StarterGui.ScreenGui.Frame.Main.TogglePreview.UICorner
G2L["22"] = Instance.new("UICorner", G2L["21"]);
G2L["22"]["CornerRadius"] = UDim.new(1, 0);


-- StarterGui.ScreenGui.Frame.Main.TogglePreview.Clip
G2L["23"] = Instance.new("Frame", G2L["21"]);
G2L["23"]["Active"] = true;
G2L["23"]["BorderSizePixel"] = 0;
G2L["23"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
G2L["23"]["Selectable"] = true;
G2L["23"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["23"]["Size"] = UDim2.new(1, -6, 1, -6);
G2L["23"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["23"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["23"]["Name"] = [[Clip]];


-- StarterGui.ScreenGui.Frame.Main.TogglePreview.Clip.UICorner
G2L["24"] = Instance.new("UICorner", G2L["23"]);
G2L["24"]["CornerRadius"] = UDim.new(1, 0);


-- StarterGui.ScreenGui.Frame.Main.TogglePreview.Fill
G2L["25"] = Instance.new("Frame", G2L["21"]);
G2L["25"]["Active"] = true;
G2L["25"]["BorderSizePixel"] = 0;
G2L["25"]["BackgroundColor3"] = Color3.fromRGB(232, 232, 232);
G2L["25"]["Selectable"] = true;
G2L["25"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["25"]["Size"] = UDim2.new(1, -12, 1, -12);
G2L["25"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["25"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["25"]["Name"] = [[Fill]];


-- StarterGui.ScreenGui.Frame.Main.TogglePreview.Fill.UICorner
G2L["26"] = Instance.new("UICorner", G2L["25"]);
G2L["26"]["CornerRadius"] = UDim.new(1, 0);

-- Transpose controls container
-- StarterGui.ScreenGui.Frame.Main.Transpose
G2L["28"] = Instance.new("Frame", G2L["10"]);
G2L["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["28"]["BackgroundTransparency"] = 1;
G2L["28"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["28"]["Name"] = [[Transpose]];
G2L["28"]["Position"] = UDim2.new(0, 64, 0, 48);
G2L["28"]["Size"] = UDim2.new(0, 120, 0, 24);

-- StarterGui.ScreenGui.Frame.Main.Transpose.Minus
G2L["29"] = Instance.new("TextButton", G2L["28"]);
G2L["29"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
G2L["29"]["BackgroundTransparency"] = 0.2;
G2L["29"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["29"]["Size"] = UDim2.new(0, 24, 0, 24);
G2L["29"]["Text"] = "-";
G2L["29"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["29"]["TextSize"] = 18;
G2L["29"]["TextColor3"] = Color3.fromRGB(232, 232, 232);
G2L["29"]["Name"] = [[Minus]];

-- StarterGui.ScreenGui.Frame.Main.Transpose.Value
G2L["2a"] = Instance.new("TextLabel", G2L["28"]);
G2L["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2a"]["BackgroundTransparency"] = 1;
G2L["2a"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["2a"]["Size"] = UDim2.new(1, -48, 0, 24);
G2L["2a"]["Position"] = UDim2.new(0, 24, 0, 0);
G2L["2a"]["Text"] = [[0]];
G2L["2a"]["TextColor3"] = Color3.fromRGB(232, 232, 232);
G2L["2a"]["TextXAlignment"] = Enum.TextXAlignment.Center;
G2L["2a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2a"]["TextSize"] = 16;
G2L["2a"]["Name"] = [[Value]];

-- StarterGui.ScreenGui.Frame.Main.Transpose.Plus
G2L["2b"] = Instance.new("TextButton", G2L["28"]);
G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
G2L["2b"]["BackgroundTransparency"] = 0.2;
G2L["2b"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["2b"]["Size"] = UDim2.new(0, 24, 0, 24);
G2L["2b"]["Position"] = UDim2.new(1, -24, 0, 0);
G2L["2b"]["Text"] = "+";
G2L["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["2b"]["TextSize"] = 18;
G2L["2b"]["TextColor3"] = Color3.fromRGB(232, 232, 232);
G2L["2b"]["Name"] = [[Plus]];

-- StarterGui.ScreenGui.Frame.Main.AutoTranspose
G2L["2c"] = Instance.new("ImageButton", G2L["10"]);
G2L["2c"]["BorderSizePixel"] = 0;
G2L["2c"]["AutoButtonColor"] = false;
G2L["2c"]["BackgroundColor3"] = Color3.fromRGB(232, 232, 232);
G2L["2c"]["Size"] = UDim2.new(0, 24, 0, 24);
G2L["2c"]["Name"] = [[AutoTranspose]];
G2L["2c"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["2c"]["Position"] = UDim2.new(0, 192, 0, 48);

-- StarterGui.ScreenGui.Frame.Main.AutoTranspose.UICorner
G2L["2d"] = Instance.new("UICorner", G2L["2c"]);
G2L["2d"]["CornerRadius"] = UDim.new(1, 0);

-- StarterGui.ScreenGui.Frame.Main.AutoTranspose.Clip
G2L["2e"] = Instance.new("Frame", G2L["2c"]);
G2L["2e"]["Active"] = true;
G2L["2e"]["BorderSizePixel"] = 0;
G2L["2e"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
G2L["2e"]["Selectable"] = true;
G2L["2e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2e"]["Size"] = UDim2.new(1, -6, 1, -6);
G2L["2e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["2e"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["2e"]["Name"] = [[Clip]];

-- StarterGui.ScreenGui.Frame.Main.AutoTranspose.Clip.UICorner
G2L["2f"] = Instance.new("UICorner", G2L["2e"]);
G2L["2f"]["CornerRadius"] = UDim.new(1, 0);

-- StarterGui.ScreenGui.Frame.Main.AutoTranspose.Fill
G2L["30"] = Instance.new("Frame", G2L["2c"]);
G2L["30"]["Active"] = true;
G2L["30"]["BorderSizePixel"] = 0;
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(232, 232, 232);
G2L["30"]["Selectable"] = true;
G2L["30"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["30"]["Size"] = UDim2.new(0, 0, 0, 0);
G2L["30"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["30"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["30"]["Name"] = [[Fill]];

-- StarterGui.ScreenGui.Frame.Main.AutoTranspose.Fill.UICorner
G2L["31"] = Instance.new("UICorner", G2L["30"]);
G2L["31"]["CornerRadius"] = UDim.new(1, 0);

-- StarterGui.ScreenGui.Frame.Handle
G2L["27"] = Instance.new("Frame", G2L["2"]);
G2L["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["27"]["Size"] = UDim2.new(1, 0, 0.5, 0);
G2L["27"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["27"]["Name"] = [[Handle]];
G2L["27"]["BackgroundTransparency"] = 1;



return G2L["1"], require;