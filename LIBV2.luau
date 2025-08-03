local Lib = {
	GetService = function(service)
		return cloneref and cloneref(game:GetService(service)) or game:GetService(service)
	end
}

local TweenService = Lib.GetService("TweenService")
local RunService = Lib.GetService("RunService")
local HttpService = Lib.GetService("HttpService")
local ContentProvider = Lib.GetService("ContentProvider")
local UserInputService = Lib.GetService("UserInputService")
local Lighting = Lib.GetService("Lighting")
local Players = Lib.GetService("Players")

local isStudio = RunService:IsStudio()
local LocalPlayer = Players.LocalPlayer

local assets = {
	interFont = "rbxassetid://12187365364",
	userInfoBlurred = "rbxassetid://18824089198",
	toggleBackground = "rbxassetid://18772190202",
	togglerHead = "rbxassetid://18772309008",
	buttonImage = "rbxassetid://10709791437",
	searchIcon = "rbxassetid://86737463322606",
	colorWheel = "rbxassetid://2849458409",
	colortarget = "rbxassetid://73265255323268",
	grid = "rbxassetid://121484455191370",
	globe = "rbxassetid://108952102602834",
	transform = "rbxassetid://90336395745819",
	dropdown = "rbxassetid://18865373378",
	sliderbar = "rbxassetid://18772615246",
	sliderhead = "rbxassetid://18772834246",
	shadow = "rbxassetid://6014261993",
	check = "rbxassetid://7733715400",
	tab = "rbxassetid://90991999539475",
	hide = "rbxassetid://92186614586776",
	minimize = "rbxassetid://11255032783"
}

function GetGui()
	local newGui = Instance.new("ScreenGui")
	newGui.ScreenInsets = Enum.ScreenInsets.None
	newGui.ResetOnSpawn = false
	newGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	newGui.DisplayOrder = 2147483647

	local parent = RunService:IsStudio() 
		and LocalPlayer:FindFirstChild("PlayerGui")
		or (gethui and gethui())
		or (cloneref and cloneref(Lib.GetService("CoreGui")) or Lib.GetService("CoreGui"))

	newGui.Parent = parent
	return newGui
end

function CreateElement(type, properties)
	local element = Instance.new(type)
	for prop, value in pairs(properties) do
		element[prop] = value
	end
	return element
end

function Lib:Window(Window)
    Window.Title = Window.Title or "KALIU"
    Window.SubTitle = Window.SubTitle or "LIB"
    Window.Theme = Window.Theme or "Red"
    Window.KeyBind = Window.KeyBind or Enum.KeyCode.K
    Window.Size = Window.Size or {650, 420}
    Window.Acrylic = Window.Acrylic or false
    Window.Max = Window.Max or {900, 600}
    Window.Min = Window.Min or {450, 270}

    local ScreenGui = GetGui()
    local existingFrame = ScreenGui:FindFirstChild(Window.Title)
    if existingFrame then
        existingFrame:Destroy()
    end

    local Main = CreateElement("Frame", {
		Name = Window.Title,
		Size = UDim2.fromOffset(unpack(Window.Size)),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = Color3.fromRGB(12, 12, 12),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,
		Active = true,
		Draggable = false,
		ClipsDescendants = false,
		Parent = ScreenGui
	})
	
	local UiMain = CreateElement("UICorner", {
		CornerRadius = UDim.new(0, 10),
		Parent = Main
	})
	
	local DropShadow = CreateElement("Frame", {
		Name = "DropShadow",
		Size = UDim2.new(1, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(15, 15, 15),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = Main.ZIndex - 1,
		Visible = true,
		ClipsDescendants = false,
		Parent = Main
	})
	
	local UiDropShadow = CreateElement("UICorner", {
		CornerRadius = UDim.new(0, 20),
		Parent = DropShadow
	})
	
	local ImgDropShadow = CreateElement("ImageLabel", {
		Name = "ImgDropShadow",
		Parent = DropShadow,
		Active = false,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1.000,
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 47, 1, 47),
		Image = assets.shadow,
		ImageColor3 = Color3.fromRGB(0, 0, 0),
		ImageTransparency = 0.500,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(49, 49, 450, 450),
	})
	
	local Holder = CreateElement("Frame", {
		Name = "Holder",
		Size = UDim2.new(0.261538461538461538, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(12, 12, 12),
		BackgroundTransparency = 0.080,
		BorderSizePixel = 0,
		ZIndex = Main.ZIndex,
		Visible = true,	
		ClipsDescendants = false,
		Parent = Main
	})
	
	local UiHolder = CreateElement("UICorner", {
		CornerRadius = UDim.new(0, 10),
		Parent = Holder
	})
	
	local Conteiner = CreateElement("Frame", {
		Name = "Conteiner",
		Size = UDim2.new(0.753846153846153846, 0, 1, 0),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(12, 12, 12),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		ZIndex = Holder.ZIndex + 1,
		Visible = true,	
		ClipsDescendants = true,
		Parent = Main
	})
	
	local Hide_1 = CreateElement("Frame", {
		Name = "Hide_1",
		Size = UDim2.new(0.05, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(12, 12, 12),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,	
		ClipsDescendants = true,
		Parent = Conteiner
	})
	
	local Line_1 = CreateElement("Frame", {
		Name = "Line_1",
		Size = UDim2.new(0, 1, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,	
		ClipsDescendants = true,
		Parent = Hide_1
	})
	
	local UiConteiner = CreateElement("UICorner", {
		CornerRadius = UDim.new(0, 10),
		Parent = Conteiner
	})
	
	local BgTitle = CreateElement("Frame", {
		Name = "BgTitle",
		Size = UDim2.new(1, - 10, 0.119047619047619047, 0),
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(12, 12, 12),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,	
		ClipsDescendants = true,
		Parent = Holder
	})
	
	local Line_2 = CreateElement("Frame", {
		Name = "Line_2",
		Size = UDim2.new(1, 0, 0, 1),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,	
		ClipsDescendants = true,
		Parent = BgTitle
	})
    
    local Title = CreateElement("TextLabel", {
        Name = "Title",
        Parent = BgTitle,
        Size = UDim2.new(0, 50, 0, 24),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, - 10, 0.5, 0),
        BackgroundTransparency = 1,
        TextTransparency = 0,
        Text = Window.Title,
        TextColor3 = Color3.fromRGB(230, 230, 230),
        TextSize = 20,
        Font = Enum.Font.Sarpanch,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Center,
    })

    local STitle = CreateElement("TextLabel", {
        Name = "STitle",
        Parent = BgTitle,
        Size = UDim2.new(0, 50, 0, 24),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, - 5 + Title.AbsoluteSize.Y + 5, 0.5, 0),
        BackgroundTransparency = 1,
        TextTransparency = 0,
        Text = Window.SubTitle,
        TextColor3 = Color3.fromRGB(125, 15, 11),
        TextSize = 20,
        Font = Enum.Font.Sarpanch,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Center,
    })

    Title.AutomaticSize = Enum.AutomaticSize.Y
    STitle.AutomaticSize = Enum.AutomaticSize.Y

    local BgPlayer = CreateElement("Frame", {
		Name = "BgTitle",
		Size = UDim2.new(1, - 10, 0.119047619047619047, 0),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(12, 12, 12),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,	
		ClipsDescendants = true,
		Parent = Holder
	})
	
	local Line_3 = CreateElement("Frame", {
		Name = "Line_3",
		Size = UDim2.new(1, 0, 0, 1),
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,	
		ClipsDescendants = true,
		Parent = BgPlayer
	})

    local userId = LocalPlayer.UserId
	local thumbType = Enum.ThumbnailType.AvatarBust
	local thumbSize = Enum.ThumbnailSize.Size48x48
	local headshotImage = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

    local Headshot = CreateElement("ImageLabel", {
	    Name = "Headshot",
	    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	    BackgroundTransparency = 1,
	    BorderColor3 = Color3.fromRGB(0, 0, 0),
	    BorderSizePixel = 0,
	    Image = headshotImage,
	    Size = UDim2.fromOffset(32, 32),
	    AnchorPoint = Vector2.new(0, 0.5),
	    Position = UDim2.new(0, 10, 0.5, 0),
	    Parent = BgPlayer,
    })
    
    local UiHeadshot = CreateElement("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = Headshot
	})
	
	local UiStroke_1 = CreateElement("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Thickness = 1,
        Color = Color3.fromRGB(30, 30, 30),
        Parent = Headshot,
    })
    
    local NameAndDisplay = CreateElement("Frame", {
        Name = "NameAndDisplay",
        Parent = BgPlayer,
        ClipsDescendants = true,
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        Size = UDim2.new(1, - 52, 0, 0),
    })
    
    local UiList = CreateElement("UIListLayout", {
        Parent = NameAndDisplay,
        Padding = UDim.new(0, 2),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    
    local displayName = Instance.new("TextLabel")
	displayName.Name = "DisplayName"
	displayName.FontFace = Font.new(
		assets.interFont,
		Enum.FontWeight.SemiBold,
		Enum.FontStyle.Normal
	)
	displayName.TextColor3 = Color3.fromRGB(230, 230, 230)
	displayName.TextSize = 13
	displayName.TextTransparency = 0.1
	displayName.TextTruncate = Enum.TextTruncate.SplitWord
	displayName.TextXAlignment = Enum.TextXAlignment.Left
	displayName.TextYAlignment = Enum.TextYAlignment.Top
	displayName.AutomaticSize = Enum.AutomaticSize.XY
	displayName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	displayName.BackgroundTransparency = 1
	displayName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	displayName.BorderSizePixel = 0
	displayName.Parent = NameAndDisplay
	displayName.Size = UDim2.fromScale(1,0)
	
	local username = Instance.new("TextLabel")
	username.Name = "Username"
	username.FontFace = Font.new(
		assets.interFont,
		Enum.FontWeight.SemiBold,
		Enum.FontStyle.Normal
	)
	username.TextColor3 = Color3.fromRGB(190, 190, 190)
	username.TextSize = 12
	username.TextTransparency = 0.7
	username.TextTruncate = Enum.TextTruncate.SplitWord
	username.TextXAlignment = Enum.TextXAlignment.Left
	username.TextYAlignment = Enum.TextYAlignment.Top
	username.AutomaticSize = Enum.AutomaticSize.XY
	username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	username.BackgroundTransparency = 1
	username.BorderColor3 = Color3.fromRGB(0, 0, 0)
	username.BorderSizePixel = 0
	username.LayoutOrder = 1
	username.Parent = NameAndDisplay
	username.Size = UDim2.fromScale(1,0)
	
	username.Text = "@" .. LocalPlayer.Name
    displayName.Text = LocalPlayer.DisplayName
    
    local BgTop = CreateElement("Frame", {
		Name = "BgTop",
		Size = UDim2.new(1, 0, 0, 50),
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(12, 12, 12),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,	
		ClipsDescendants = true,
		Parent = Conteiner
	})
    
    local Line_4 = CreateElement("Frame", {
		Name = "Line_4",
		Size = UDim2.new(1, 0, 0, 1),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,	
		ClipsDescendants = true,
		Parent = BgTop
	})
	
	local Utilities = CreateElement("Frame", {
		Name = "Utilities",
		Size = UDim2.new(0.5, 0, 1, 0),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(12, 12, 12),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,	
		ClipsDescendants = true,
		Parent = BgTop
	})
	
	local UiList = CreateElement("UIListLayout", {
        Parent = Utilities,
        Padding = UDim.new(0, 9),
        SortOrder = Enum.SortOrder.LayoutOrder,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center 
    })
    
    local UiPadding = CreateElement("UIPadding", {
        Parent = Utilities,
        PaddingLeft = UDim.new(0, 9), 
        PaddingRight = UDim.new(0, 9),
        PaddingTop = UDim.new(0, 0),
        PaddingBottom = UDim.new(0, 0),
	})
	
	local KeyBoard = CreateElement("ImageLabel", {
	    Name = "KeyBoard",
	    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	    BackgroundTransparency = 1,
	    BorderColor3 = Color3.fromRGB(0, 0, 0),
	    BorderSizePixel = 0,
	    Image = "rbxassetid://11738672671",
	    ImageColor3 = Color3.fromRGB(230, 230, 230),
	    Size = UDim2.fromOffset(24, 24),
	    Parent = Utilities,
    })
    
    local Bell = CreateElement("ImageLabel", {
	    Name = "Bell",
	    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	    BackgroundTransparency = 1,
	    BorderColor3 = Color3.fromRGB(0, 0, 0),
	    BorderSizePixel = 0,
	    Image = "rbxassetid://70856241901857",
	    ImageColor3 = Color3.fromRGB(230, 230, 230),
	    Size = UDim2.fromOffset(22, 22),
	    AnchorPoint = Vector2.new(0, 0),
	    Parent = Utilities,
    })
    
    local HolderTabs = CreateElement("Frame", {
		Name = "HolderTabs",
		Size = UDim2.new(1, 0, 0.76, 0),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, -50),
		BackgroundColor3 = Color3.fromRGB(12, 12, 12),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = true,	
		ClipsDescendants = true,
		Parent = Holder
	})
	
	local ScrollTabs = CreateElement("ScrollingFrame", {
        Name = "ScrollTabs",
        Parent = HolderTabs,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        BorderSizePixel = 0,
        ScrollBarThickness = 0,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(0, 0, 0, 0),
    })
    
    local UiList = CreateElement("UIListLayout", {
        Parent = ScrollTabs,
        Padding = UDim.new(0, 10),
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top 
    })
    
    local UiPadding = CreateElement("UIPadding", {
        Parent = ScrollTabs,
        PaddingLeft = UDim.new(0, 7), 
        PaddingRight = UDim.new(0, 17),
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10),
	})
	
	UiList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ScrollTabs.CanvasSize = UDim2.new(0, 0, 0, UiList.AbsoluteContentSize.Y)
    end)
    
    local resizing = false
    local lastMousePos = Vector2.new(0, 0)
    
    local Size = CreateElement("Frame", {
        Name = "Size",
        Size = UDim2.new(0, 10, 0, 10),
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(12, 12, 12),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = true,    
        ClipsDescendants = true,
        Parent = Conteiner
    })
    
    local dragging = false
    local lastMousePos = Vector2.new(0, 0)
    
    BgTop.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            lastMousePos = UserInputService:GetMouseLocation()
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            if dragging then
                local newMousePos = UserInputService:GetMouseLocation()
                local delta = newMousePos - lastMousePos
                
                Main.Position = UDim2.new(
                    Main.Position.X.Scale, 
                    Main.Position.X.Offset + delta.X,
                    Main.Position.Y.Scale,
                    Main.Position.Y.Offset + delta.Y
                )
                
                lastMousePos = newMousePos
            end
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            resizing = false
        end
    end)

    Size.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = true
            lastMousePos = UserInputService:GetMouseLocation()
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and resizing then
            local newMousePos = UserInputService:GetMouseLocation()
            local delta = newMousePos - lastMousePos
            
            -- Usando os valores de Window.Min que você definiu na criação da janela
            local newSize = UDim2.fromOffset(
                math.max(Window.Min[1], Main.AbsoluteSize.X + delta.X),
                math.max(Window.Min[2], Main.AbsoluteSize.Y + delta.Y)
            )
    
            -- Limitar ao tamanho máximo se definido
            if Window.Max then
                newSize = UDim2.fromOffset(
                    math.min(Window.Max[1], newSize.X.Offset),
                    math.min(Window.Max[2], newSize.Y.Offset)
                )
            end
    
            Main.Size = newSize
            lastMousePos = newMousePos
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = false
        end
    end)
    
    local UserInputService = game:GetService("UserInputService")

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Window.KeyBind then
            Main.Visible = not Main.Visible
        end
    end)
    
    local GroupV = {
        CurrentGroup = nil
    }
    
    function GroupV:Group(Group)
        Group.Name = Group.Name or "Local Player"
        
        local Group_Frame = CreateElement("Frame", {
    		Name = "Group_Frame",
	    	Size = UDim2.new(1, 0, 0, 0),
	    	AnchorPoint = Vector2.new(0, 0),
	    	Position = UDim2.new(0, 0, 0, 0),
	    	BackgroundColor3 = Color3.fromRGB(12, 12, 12),
	    	BackgroundTransparency = 1,
	    	AutomaticSize = Enum.AutomaticSize.Y,
	    	BorderSizePixel = 0,
	    	Visible = true,	
	    	ClipsDescendants = true,
	    	Parent = ScrollTabs
	    })
	    
	    local Title = CreateElement("TextLabel", {
            Name = "Title",
            Parent = Group_Frame,
            Size = UDim2.new(1, - 20, 0, 24),
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.new(0, 10, 0, 0),
            BackgroundTransparency = 1,
            TextTransparency = 0,
            Text = Group.Name,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = 0,
            TextSize = 16,
            Font = Enum.Font.Sarpanch,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
        
        local UiList = CreateElement("UIListLayout", {
            Parent = Group_Frame,
            Padding = UDim.new(0, 5),
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top
        })
        
        UiList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Group_Frame.Size = UDim2.new(1, 0, 0, UiList.AbsoluteContentSize.Y)
        end)
        
        local TabV = {
            CurrentTab = nil,
            FirstTab = true
        }
        
        function TabV:Tab(tab)
            tab.Name = tab.Name or "Teste Tab"
            tab.Image = tab.Image or "rbxassetid://90991999539475"
            tab.PlayerList = tab.PlayerList or false
            tab.PlayerListSide = tab.PlayerListSide or "Right"
            tab.Min = tab.Min or 100
            tab.Max = tab.Max or 10000
            tab.Default = tab.Default or 500
            tab.Search = tab.Search or false
            tab.Callback = tab.Callback or function() end
            tab.Lines = tab.Lines or true
            
            local Tab = {
                Hover = false,
                Active = false
            }
            
            local  Tab_Frame = CreateElement("Frame", {
        		Name = "Tab_Frame",
	        	Size = UDim2.new(1, 0, 0, 30),
	        	AnchorPoint = Vector2.new(0, 0),
	    	    Position = UDim2.new(0, 0, 0, 0),
    	    	BackgroundColor3 = Color3.fromRGB(12, 12, 12),
	        	BackgroundTransparency = 1,
	        	--AutomaticSize = Enum.AutomaticSize.Y,
	    	    BorderSizePixel = 0,
    	    	Visible = true,	
	        	ClipsDescendants = true,
	        	Parent = Group_Frame
    	    })
    	    
    	    local UiTab = CreateElement("UICorner", {
    		    CornerRadius = UDim.new(0, 9),
    	    	Parent = Tab_Frame
	        })  
	
	        local View = CreateElement("Frame", {
        		Name = "View",
	        	Size = UDim2.new(0, 4, 1, 0),
	        	AnchorPoint = Vector2.new(0, 0),
	    	    Position = UDim2.new(0, 0, 0, 0),
    	    	BackgroundColor3 = Color3.fromRGB(125, 15, 11),
	        	BackgroundTransparency = 0,
	    	    BorderSizePixel = 0,
    	    	Visible = false,	
	        	ClipsDescendants = true,
	        	Parent = Tab_Frame
    	    })
    	    
    	    local UiView = CreateElement("UICorner", {
    		    CornerRadius = UDim.new(0, 4),
    	    	Parent = View
	        }) 
    	  
    	    local Icon = CreateElement("ImageLabel", {
        	    Name = "Icon",
	            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	            BackgroundTransparency = 1,
    	        BorderColor3 = Color3.fromRGB(0, 0, 0),
    	        BorderSizePixel = 0,
    	        ImageColor3 = Color3.fromRGB(125, 15, 11),
    	        Image = tab.Image,
	            Size = UDim2.new(0, 22, 0, 22),
    	        AnchorPoint = Vector2.new(0, 0.5),
    	        Position = UDim2.new(0, 10, 0.5, 0),
        	    Parent = Tab_Frame,
            })
            
            local Title = CreateElement("TextLabel", {
                Name = "Title",
                Parent = Tab_Frame,
                Size = UDim2.new(1, - 52, 0, 24),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 42, 0.5, 0),
                BackgroundTransparency = 1,
                TextTransparency = 0,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextTransparency = 0,
                TextSize = 16,
                Font = Enum.Font.Sarpanch,
                Text = tab.Name,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
            
            local OnClick = CreateElement("TextButton", {
                Name = "OnClick",
                Parent = Tab_Frame,
                BackgroundTransparency = 1.000,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 1, 0),
                AutoButtonColor = false,
                Text = "",
                TextSize = 0.000,
            })
            
            local HolderFuns = Instance.new("Frame")
            HolderFuns.Name = "HolderFuns"
            HolderFuns.Parent = Conteiner
            HolderFuns.ClipsDescendants = false
            HolderFuns.Visible = false
            HolderFuns.Selectable = true
            HolderFuns.BackgroundTransparency = 1
            HolderFuns.BorderSizePixel = 0
            HolderFuns.AnchorPoint = Vector2.new(1, 1) 
            HolderFuns.Position = UDim2.new(1, - 9, 1, - 9)
            HolderFuns.Size = UDim2.new(1, - 20, 1, - 70)
        
            local ScrollPages = Instance.new("ScrollingFrame")
            ScrollPages.Name = "ScrollPages"
            ScrollPages.Parent = HolderFuns
            ScrollPages.Size = UDim2.new(1, 0, 1, 0) 
            ScrollPages.BackgroundTransparency = 1
            ScrollPages.ClipsDescendants = true
            ScrollPages.BorderSizePixel = 0
            ScrollPages.ScrollBarThickness = 0
            ScrollPages.AutomaticCanvasSize = Enum.AutomaticSize.Y
            ScrollPages.CanvasSize = UDim2.new(0, 0, 0, 0)
            
                
            local UiPagScroll = Instance.new("UIPadding")
            UiPagScroll.Parent = ScrollPages
            UiPagScroll.PaddingLeft = UDim.new(0, 1)
            UiPagScroll.PaddingRight = UDim.new(0, 1)
            UiPagScroll.PaddingTop = UDim.new(0, 1)
            UiPagScroll.PaddingBottom = UDim.new(0, 1)
            
            local UiList = Instance.new("UIListLayout")
            UiList.Parent = ScrollPages
            UiList.Padding = UDim.new(0, 10)
            UiList.SortOrder = Enum.SortOrder.LayoutOrder
            UiList.FillDirection = Enum.FillDirection.Horizontal
            
            UiList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                ScrollPages.CanvasSize = UDim2.new(0, 0, 0, UiList.AbsoluteContentSize.Y)
            end)
            
            local left = Instance.new("Frame")
    		left.Name = "Left"
    		left.AutomaticSize = Enum.AutomaticSize.Y
    		left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    		left.BackgroundTransparency = 1
    		left.BorderColor3 = Color3.fromRGB(0, 0, 0)
    		left.BorderSizePixel = 0
    		left.Size = UDim2.new(0.5, - 5, 1, 0)
    
    		local leftUIListLayout = Instance.new("UIListLayout")
    		leftUIListLayout.Name = "LeftUIListLayout"
    		leftUIListLayout.Padding = UDim.new(0, 15)
    		leftUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    		leftUIListLayout.Parent = left
    
    		left.Parent = ScrollPages
    
    		local right = Instance.new("Frame")
    		right.Name = "Right"
    		right.AutomaticSize = Enum.AutomaticSize.Y
    		right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    		right.BackgroundTransparency = 2
    		right.BorderColor3 = Color3.fromRGB(0, 0, 0)
    		right.BorderSizePixel = 0
    		right.LayoutOrder = 1
    		right.Size = UDim2.new(0.5, - 5, 1, 0)
    
    		local rightUIListLayout = Instance.new("UIListLayout")
    		rightUIListLayout.Name = "RightUIListLayout"
    		rightUIListLayout.Padding = UDim.new(0, 15)
    		rightUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    		rightUIListLayout.Parent = right
    
    		right.Parent = ScrollPages
    		
    		local ViewPayer = Instance.new("Frame")
    		
    		if tab.PlayerList then
            		ViewPayer.Name = "ViewPayer"
    	        	ViewPayer.Size = UDim2.new(0, 170, 0, 25)
    	        	ViewPayer.AnchorPoint = Vector2.new(0, 0.5)
    	    	    ViewPayer.Position = UDim2.new(0, 20, 0.5, 0)
        	    	ViewPayer.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    	        	ViewPayer.BackgroundTransparency = 1
    	    	    ViewPayer.BorderSizePixel = 0
        	    	ViewPayer.Visible = false
    	        	ViewPayer.ClipsDescendants = true
    	        	ViewPayer.Parent = BgTop
        	    
        	    
        	    local UiCorner_1 = CreateElement("UICorner", {
            		CornerRadius = UDim.new(0, 6),
            		Parent = ViewPayer
            	})
            	
            	local UiStroke_2 = CreateElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Thickness = 1,
                    Color = Color3.fromRGB(30, 30, 30),
                    Parent = ViewPayer,
                })
        	    
        	    local IconP = CreateElement("ImageLabel", {
            	    Name = "IconP",
    	            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    	            BackgroundTransparency = 1,
        	        BorderColor3 = Color3.fromRGB(0, 0, 0),
        	        BorderSizePixel = 0,
        	        ImageColor3 = Color3.fromRGB(140, 140, 140),
        	        Image = "rbxassetid://10129796109",
    	            Size = UDim2.new(0, 16, 0, 16),
        	        AnchorPoint = Vector2.new(1, 0.5),
        	        Position = UDim2.new(1, -3, 0.5, 0),
            	    Parent = ViewPayer,
                })
                
                local PPTitle = CreateElement("TextLabel", {
                    Name = "PTitle",
                    Parent = ViewPayer,
                    Size = UDim2.new(1, 0, 0, 24),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 10, 0.5, 0),
                    BackgroundTransparency = 1,
                    TextTransparency = 0,
                    TextColor3 = Color3.fromRGB(140, 140, 140),
                    TextTransparency = 0,
                    TextSize = 14,
                    Font = Enum.Font.Sarpanch,
                    Text = "Jogadores... ".. displayName.Text,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
                
                local TopS = CreateElement("Frame", {
                    Name = "TopS",
                    Parent = tab.PlayerListSide == "Left" and left or right,
                    ClipsDescendants = false,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 10),
                })
                
                local Title = CreateElement("TextLabel", {
                    Name = "Title",
                    Parent = TopS,
                    Size = UDim2.new(1, 0, 0, 24),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 7, 0, 0),
                    BackgroundTransparency = 1,
                    TextTransparency = 0,
                    TextColor3 = Color3.fromRGB(140, 140, 140),
                    TextTransparency = 0,
                    TextSize = 16,
                    Font = Enum.Font.Sarpanch,
                    Text = "LISTA DE JOGADORES",
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
                    
                local PSection = CreateElement("Frame", {
                    Name = "FSection",
                    Parent = tab.PlayerListSide == "Left" and left or right,
                    ClipsDescendants = true,
                    BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                })
                
                local UiList = CreateElement("UIListLayout", {
                    Parent = PSection,
                    Padding = UDim.new(0, 10),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Top 
                })
                
                local UiPadding = CreateElement("UIPadding", {
                    Parent = PSection,
                    PaddingLeft = UDim.new(0, 10), 
                    PaddingRight = UDim.new(0, 10),
                    PaddingTop = UDim.new(0, 10),
                    PaddingBottom = UDim.new(0, 10),
            	})
            	
            	UiList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    PSection.Size = UDim2.new(1, 0, 0, UiList.AbsoluteContentSize.Y)
                end)
                    
                local UiCorner_1 = CreateElement("UICorner", {
            		CornerRadius = UDim.new(0, 6),
            		Parent = PSection
            	})
            	
            	local UiStroke_2 = CreateElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Thickness = 1,
                    Color = Color3.fromRGB(30, 30, 30),
                    Parent = PSection,
                })
                
                local SliderD = CreateElement("Frame", {
                    Name = "SliderD",
                    Parent = PSection,
                    ClipsDescendants = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 45),
                    --AutomaticSize = Enum.AutomaticSize.Y,
                })
                
                local TopSd = CreateElement("Frame", {
                    Name = "TopSd",
                    Parent = SliderD,
                    ClipsDescendants = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 30),
                })
                
                local SDTitle = CreateElement("TextLabel", {
                    Name = "SDTitle",
                    Parent = TopSd,
                    Size = UDim2.new(1, -150, 0, 24),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 2, 0.5, 0),
                    BackgroundTransparency = 1,
                    TextTransparency = 0,
                    TextColor3 = Color3.fromRGB(140, 140, 140),
                    TextTransparency = 0,
                    TextSize = 14,
                    Font = Enum.Font.Sarpanch,
                    Text = "Distância maxima",
                    TextWrapped = false,
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
                
                local BGps = CreateElement("Frame", {
                    Name = "BGps",
                    Parent = SliderD,
                    ClipsDescendants = false,
                    BackgroundColor3 = Color3.fromRGB(19, 19, 19),
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(1, 1),
                    Position = UDim2.new(1, 0, 1, -5),
                    Size = UDim2.new(1, 0, 0, 3),
                })
                
                local UiCorner_1 = CreateElement("UICorner", {
            		CornerRadius = UDim.new(1, 0),
            		Parent = BGps
            	})
            	
            	local FundoVermelho = CreateElement("Frame", {
                    Name = "FundoVermelho",
                    Parent = BGps,
                    ClipsDescendants = false,
                    BackgroundColor3 = Color3.fromRGB(125, 15, 11),
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    Size = UDim2.new(0, 0, 1, 0),
                })
                
                local UiCorner_1 = CreateElement("UICorner", {
            		CornerRadius = UDim.new(1, 0),
            		Parent = FundoVermelho
            	})
            	
            	local BgBall = CreateElement("Frame", {
                    Name = "BgBall",
                    Parent = BGps,
                    ClipsDescendants = true,
                    BackgroundColor3 = Color3.fromRGB(125, 15, 11),
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    Size = UDim2.new(0, 12, 0, 12),
                })
                
                local UiCorner_1 = CreateElement("UICorner", {
            		CornerRadius = UDim.new(1, 0),
            		Parent = BgBall
            	})
            	
            	local OnClick = CreateElement("TextButton", {
                    Name = "OnClick",
                    Parent = BgBall,
                    BackgroundTransparency = 1.000,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    AutoButtonColor = false,
                    Text = "",
                    TextSize = 0.000,
                })
                
                local SDValue = CreateElement("TextLabel", {
                    Name = "SDValue",
                    Parent = TopSd,
                    Size = UDim2.new(0, 0, 0, 20),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -2, 0.5, 0),
                    BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                    TextTransparency = 0,
                    TextColor3 = Color3.fromRGB(140, 140, 140),
                    TextTransparency = 0,
                    TextSize = 14,
                    Font = Enum.Font.Sarpanch,
                    Text = "",
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Center,
                })
                
                local UiCorner_1 = CreateElement("UICorner", {
            		CornerRadius = UDim.new(0, 5),
            		Parent = SDValue
            	})
            	
            	local UiStroke_2 = CreateElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Thickness = 1,
                    Color = Color3.fromRGB(30, 30, 30),
                    Parent = SDValue,
                })
                
                local Line_01 = CreateElement("Frame", {
                    Name = "Line_01",
                    Parent = SliderD,
                    ClipsDescendants = true,
                    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 1),
                    AnchorPoint = Vector2.new(1, 1),
                    Position = UDim2.new(1, 0, 1, 5)
                    --AutomaticSize = Enum.AutomaticSize.Y,
                })
                
                local PesquisaP = CreateElement("Frame", {
                    Name = "SliderD",
                    Parent = PSection,
                    ClipsDescendants = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 35),
                })
                
                local PsTitle = CreateElement("TextLabel", {
                    Name = "PsTitle",
                    Parent = PesquisaP,
                    Size = UDim2.new(1, -150, 0, 24),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 2, 0.5, 0),
                    BackgroundTransparency = 1,
                    TextTransparency = 0,
                    TextColor3 = Color3.fromRGB(140, 140, 140),
                    TextTransparency = 0,
                    TextSize = 14,
                    Font = Enum.Font.Sarpanch,
                    Text = "Buscar pelo nome",
                    TextWrapped = false,
                    TextXAlignment = Enum.TextXAlignment.Left,
                })
                
                local HolderPs = CreateElement("Frame", {
                    Name = "HolderPs",
                    Parent = PesquisaP,
                    ClipsDescendants = true,
                    BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -2, 0.5, 0),
                    Size = UDim2.new(0, 88, 0, 22),
                })
                
                local IconPs = CreateElement("ImageLabel", {
            	    Name = "IconPs",
    	            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    	            BackgroundTransparency = 1,
        	        BorderColor3 = Color3.fromRGB(0, 0, 0),
        	        BorderSizePixel = 0,
        	        ImageColor3 = Color3.fromRGB(140, 140, 140),
        	        Image = "rbxassetid://15911231575",
    	            Size = UDim2.new(0, 16, 0, 16),
        	        AnchorPoint = Vector2.new(0, 0.5),
        	        Position = UDim2.new(0, 3, 0.5, 0),
            	    Parent = HolderPs,
                })
                
                local TSearch = CreateElement("TextBox", {
                    Parent = HolderPs,
                    Text = "",
                    PlaceholderText = ". . .",
                    ClearTextOnFocus = false,
                    MultiLine = false,
                    TextWrapped = false,
                    BackgroundTransparency = 1,
                    TextColor3 = Color3.fromRGB(140, 140, 140),
                    TextTransparency = 0,
                    PlaceholderColor3 = Color3.fromRGB(140, 140, 140),
                    BorderSizePixel = 0,
                    TextSize = 14,
                    Font = Enum.Font.Sarpanch,
                    Size = UDim2.new(1, - 23, 1, 0),
                    Position = UDim2.new(1, 0, 0.5, 0),
                    AnchorPoint = Vector2.new(1, 0.5),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextInputType = Enum.TextInputType.Default,
                })
                
                local UiCorner_1 = CreateElement("UICorner", {
            		CornerRadius = UDim.new(0, 6),
            		Parent = HolderPs
            	})
            	
            	local UiStroke_2 = CreateElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Thickness = 1,
                    Color = Color3.fromRGB(30, 30, 30),
                    Parent = HolderPs,
                })
                
                local Line_02 = CreateElement("Frame", {
                    Name = "Line_02",
                    Parent = PesquisaP,
                    ClipsDescendants = true,
                    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 1),
                    AnchorPoint = Vector2.new(1, 1),
                    Position = UDim2.new(1, 0, 1, 5)
                })
                
                local SELECTED_COLOR = Color3.fromRGB(220, 220, 220)
                local DEFAULT_COLOR = Color3.fromRGB(140, 140, 140)
                local CHECK_ICON = "rbxassetid://138861967300749"
                local selectedPlayer = nil
                
                local Players = game:GetService("Players")
                local RunService = game:GetService("RunService")
                
                -- Configurações
                local DisValue = tab.Default
                local ENTRY_HEIGHT = 25
                local LINE_HEIGHT = 1
                local UPDATE_INTERVAL = 0.5
                local searchFilter = ""
                
                -- Variáveis de controle
                local LocalPlayer = Players.LocalPlayer
                local lastUpdate = 0
                local playerEntries = {}
                local playerFrames = {}
                
                -- Função para filtrar jogadores por nome
                function filterPlayersByName(name)
                    searchFilter = string.lower(name)
                    updatePlayerVisibility()
                end
                
                -- Conectar a caixa de pesquisa
                TSearch:GetPropertyChangedSignal("Text"):Connect(function()
                    filterPlayersByName(TSearch.Text)
                end)
                
                -- Função para criar entrada do jogador
                function createPlayerEntry(player)
                    local entryFrame = CreateElement("Frame", {
                        Name = "Pl_"..player.UserId,
                        Parent = PSection,
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 0, ENTRY_HEIGHT),
                        LayoutOrder = layoutOrder or #playerEntries + 1
                    })
                
                    local playerButton = CreateElement("TextButton", {
                        Name = "PlayerButton",
                        Parent = entryFrame,
                        Size = UDim2.new(1, 0, 1, 0),
                        BackgroundTransparency = 1,
                        Text = "",
                        AutoButtonColor = false
                    })
                
                    local PTitle = CreateElement("TextLabel", {
                        Name = "PTitle",
                        Parent = playerButton,
                        Size = UDim2.new(1, -25, 1, 0), -- Espaço para o check
                        BackgroundTransparency = 1,
                        TextColor3 = DEFAULT_COLOR,
                        TextSize = 14,
                        Font = Enum.Font.Sarpanch,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    })
                
                    -- Ícone de check (inicialmente invisível)
                    local CheckIcon = CreateElement("ImageLabel", {
                        Name = "CheckIcon",
                        Parent = playerButton,
                        Size = UDim2.new(0, 16, 0, 16),
                        Position = UDim2.new(1, -5, 0.5, 0),
                        AnchorPoint = Vector2.new(1, 0.5),
                        BackgroundTransparency = 1,
                        ImageTransparency = 1, -- Inicialmente transparente
                        ImageColor3 = SELECTED_COLOR,
                        Image = CHECK_ICON
                    })
                
                    local Line = CreateElement("Frame", {
                        Name = "Line_"..player.UserId,
                        Parent = PSection,
                        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                        Size = UDim2.new(1, 0, 0, LINE_HEIGHT),
                        Visible = tab.Lines and true or false,
                        BorderSizePixel = 0,
                        LayoutOrder = #playerEntries + 1.5
                    })
                
                    playerEntries[player.UserId] = {
                        frame = entryFrame,
                        line = Line,
                        label = PTitle,
                        player = player,
                        visible = true,
                        checkIcon = CheckIcon
                    }
                
                    -- Conectar o clique do botão
                    playerButton.MouseButton1Click:Connect(function()
                        if not selectedPlayer or selectedPlayer.UserId ~= player.UserId then
                            selectedPlayer = player
                            if tab.Callback then
                                tab.Callback(player)
                            end
                            
                            -- Atualiza o texto do label corretamente
                            if PPTitle then
                                PPTitle.Text = "Jogadores... ".. player.DisplayName -- Ou player.Name
                            end
                            
                            updatePlayerSelection() -- Atualiza a aparência visual
                        end
                    end)
                
                    return entryFrame
                end
                
                function updatePlayerSelection()
                    -- Se não houver selecionado, define o LocalPlayer
                    if not selectedPlayer then
                        selectedPlayer = LocalPlayer
                        if tab.Callback then
                            tab.Callback(LocalPlayer)
                        end
                    end
                
                    for userId, entry in pairs(playerEntries) do
                        local isSelected = entry.player.UserId == selectedPlayer.UserId
                        
                        entry.label.TextColor3 = isSelected and SELECTED_COLOR or DEFAULT_COLOR
                        entry.checkIcon.ImageTransparency = isSelected and 0 or 1
                    end
                end
                                
                -- Função de atualização otimizada
                function updatePlayerVisibility()
                    local localChar = LocalPlayer.Character
                    local localHRP = localChar and localChar:FindFirstChild("HumanoidRootPart")
                    
                    -- Primeiro atualiza todos os players
                    for userId, entry in pairs(playerEntries) do
                        local player = entry.player
                        if player then
                            local distanceText = "[??m]"
                            local shouldShow = true
                            
                            -- Verificar filtro de nome
                            if searchFilter ~= "" then
                                shouldShow = string.find(string.lower(player.Name), searchFilter) ~= nil or 
                                           string.find(string.lower(player.DisplayName), searchFilter) ~= nil
                            end
                            
                            -- Verificar distância se passar no filtro de nome
                            if shouldShow and localHRP and player ~= LocalPlayer then
                                local playerChar = player.Character
                                local playerHRP = playerChar and playerChar:FindFirstChild("HumanoidRootPart")
                                
                                if playerHRP then
                                    local distance = (playerHRP.Position - localHRP.Position).Magnitude
                                    distanceText = "["..math.floor(distance).."m]"
                                    shouldShow = distance <= DisValue
                                else
                                    shouldShow = false
                                end
                            end
                            
                            -- O LocalPlayer sempre deve ser mostrado
                            if player == LocalPlayer then
                                shouldShow = true
                                distanceText = "[Você]"
                                -- Garante que o LocalPlayer sempre tenha LayoutOrder 0
                                entry.frame.LayoutOrder = 0
                            end
                            
                            entry.label.Text = player.DisplayName.." "..distanceText
                            entry.frame.Visible = shouldShow
                            entry.line.Visible = shouldShow
                            entry.visible = shouldShow
                        end
                    end
                    
                    -- Ordena os outros players após o LocalPlayer
                    local order = 1
                    for userId, entry in pairs(playerEntries) do
                        if entry.player ~= LocalPlayer and entry.visible then
                            entry.frame.LayoutOrder = order
                            entry.line.LayoutOrder = order + 0.5
                            order = order + 1
                        end
                    end
                    
                    -- Manter a seleção atualizada
                    updatePlayerSelection()
                end
                
                -- Sistema de observação da variável DisValue
                local DisValueChanged = Instance.new("BindableEvent")
                local lastDisValue = DisValue
                
                function watchDisValue()
                    while true do
                        wait(0.1)
                        if DisValue ~= lastDisValue then
                            lastDisValue = DisValue
                            DisValueChanged:Fire(DisValue)
                        end
                    end
                end
                
                coroutine.wrap(watchDisValue)()
                
                -- Conexão de eventos
                DisValueChanged.Event:Connect(function(newValue)
                    updatePlayerVisibility()
                end)
                
                RunService.Heartbeat:Connect(function(deltaTime)
                    lastUpdate = lastUpdate + deltaTime
                    if lastUpdate >= UPDATE_INTERVAL then
                        lastUpdate = 0
                        updatePlayerVisibility()
                    end
                end)
                
                -- Gerenciamento de jogadores
                function onPlayerAdded(player)
                    -- Se for o LocalPlayer, cria com LayoutOrder 0
                    if player == LocalPlayer then
                        createPlayerEntry(player, 0)
                        selectedPlayer = player
                        if tab.Callback then
                            tab.Callback(player)
                        end
                    else
                        -- Outros players são criados com LayoutOrder padrão
                        createPlayerEntry(player)
                    end
                    
                    updatePlayerVisibility()
                    updatePlayerSelection()
                    
                    player.CharacterAdded:Connect(function()
                        wait()
                        updatePlayerVisibility()
                    end)
                end

                function onPlayerRemoving(player)
                    local userId = player.UserId
                    if playerEntries[userId] then
                        playerEntries[userId].frame:Destroy()
                        playerEntries[userId].line:Destroy()
                        playerEntries[userId] = nil
                        updatePlayerVisibility()
                    end
                end
                
                -- Inicialização
                Players.PlayerAdded:Connect(onPlayerAdded)
                Players.PlayerRemoving:Connect(onPlayerRemoving)
                
                if Players.LocalPlayer then
                    coroutine.wrap(onPlayerAdded)(Players.LocalPlayer)
                end
                
                -- Depois cria os outros players
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= Players.LocalPlayer then
                        coroutine.wrap(onPlayerAdded)(player)
                    end
                end
                
                -- Atualização inicial
                updatePlayerVisibility()
                
                -- Sistema do Slider (mantido igual)
                local Slide = {
                    Min = tab.Min,
                    Max = tab.Max,
                    Default = tab.Default
                }
                
                local CSlider = BGps
                local OnClick = OnClick
                local Value = SDValue
                
                local dragging = false
                local startDragX = 0
                local startClickX = 0
                
                local MARGIN_LEFT = 7
                local MARGIN_RIGHT = -15
                local BUTTON_WIDTH = BgBall.AbsoluteSize.X
                
                local sliderMinX = MARGIN_LEFT
                local sliderMaxX = CSlider.AbsoluteSize.X - MARGIN_RIGHT - BUTTON_WIDTH
                local sliderWidth = CSlider.AbsoluteSize.X - MARGIN_LEFT - MARGIN_RIGHT - BUTTON_WIDTH
                
                local initialScale = (Slide.Default - Slide.Min) / (Slide.Max - Slide.Min)
                local initialPos = sliderMinX + (initialScale * sliderWidth) + BgBall.AbsoluteSize.X/2
                BgBall.Position = UDim2.new(0, initialPos, 0.5, 0)
                Value.Text = " ".. tostring(math.floor(Slide.Default)).. " "
                local ballCenter = BgBall.AbsolutePosition.X + BgBall.AbsoluteSize.X/2
                local sliderStart = CSlider.AbsolutePosition.X
                local redWidth = ballCenter - sliderStart
                FundoVermelho.Size = UDim2.new(0, redWidth, 1, 0)
                
                function UpdateSlider()
                    local currentPos = BgBall.Position.X.Offset
                    local scale = math.clamp((currentPos - MARGIN_LEFT) / sliderWidth, 0, 1)
                    DisValue = math.floor(Slide.Min + (Slide.Max - Slide.Min) * scale)
                    Value.Text = " ".. tostring(DisValue).. " "
                    updatePlayerVisibility()
                    local ballCenter = BgBall.AbsolutePosition.X + BgBall.AbsoluteSize.X/2
                    local sliderStart = CSlider.AbsolutePosition.X
                    local redWidth = ballCenter - sliderStart
                    
                    FundoVermelho.Size = UDim2.new(0, redWidth, 1, 0)
                end
                
                OnClick.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = true
                        startDragX = input.Position.X
                        startClickX = BgBall.Position.X.Offset
                    end
                end)
                
                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        local deltaX = input.Position.X - startDragX
                        local newPos = startClickX + deltaX
                        newPos = math.clamp(newPos, MARGIN_LEFT, CSlider.AbsoluteSize.X - MARGIN_RIGHT - BUTTON_WIDTH)
                        BgBall.Position = UDim2.new(0, newPos, 0.5, 0)
                        UpdateSlider()
                    end
                end)
                
                game:GetService("UserInputService").InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = false
                    end
                end)
                                
            end
            
            OnClick.MouseButton1Click:Connect(function(input)
                Tab:Activate()
            end)
        
            function Tab:Activate()
                if not Tab.Active then
                
                    if TabV.CurrentTab and TabV.CurrentTab ~= Tab then
                        TabV.CurrentTab:Deactivate()
                    end
    
                    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
                    if GroupV.CurrentGroup and GroupV.CurrentGroup ~= TabV then
                        GroupV.CurrentGroup.CurrentTab:Deactivate()
                    end
    
                    Tab.Active = true
                    TabV.CurrentTab = Tab
                    GroupV.CurrentGroup = TabV
                    HolderFuns.Visible = true
                    if tab.PlayerList then
                        ViewPayer.Visible = true
                    end
                    View.Visible = true

                    local bgTween = TweenService:Create(Tab_Frame, tweenInfo, {
                        BackgroundTransparency = 0.4,
                    })
                    bgTween:Play()
                end
            end

            function Tab:Deactivate()
                if Tab.Active then
                    Tab.Active = false
                    
                    -- Animação de desativação
                    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    
                    HolderFuns.Visible = false
                    if tab.PlayerList then
                        ViewPayer.Visible = false
                    end
                    View.Visible = false
                    
                    local bgTween = TweenService:Create(Tab_Frame, tweenInfo, {
                        BackgroundTransparency = 1,
                    })
                    bgTween:Play()
                end
            end
            
            if TabV.FirstTab and not GroupV.CurrentGroup then
                Tab:Activate()
                TabV.FirstTab = false
            end
            
            function Tab:Section(section)
                section.Title = section.Title or ""
                section.Side = section.Side or "Left"
                
                local Section = {}
                
                if section.Title ~= "" then
                    local TopS = CreateElement("Frame", {
                        Name = "TopS",
                        Parent = section.Side == "Left" and left or right,
                        ClipsDescendants = false,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 10), 
                    })
                
                    local Title = CreateElement("TextLabel", {
                        Name = "Title",
                        Parent = TopS,
                        Size = UDim2.new(1, 0, 0, 24),
                        AnchorPoint = Vector2.new(0, 0),
                        Position = UDim2.new(0, 7, 0, 0),
                        BackgroundTransparency = 1,
                        TextTransparency = 0,
                        TextColor3 = Color3.fromRGB(140, 140, 140),
                        TextTransparency = 0,
                        TextSize = 16,
                        Font = Enum.Font.Sarpanch,
                        Text = section.Title,
                        TextWrapped = true,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    })
                end
                
                local FSection = CreateElement("Frame", {
                    Name = "FSection",
                    Parent = section.Side == "Left" and left or right,
                    ClipsDescendants = true,
                    BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                })
                
                local UiList = CreateElement("UIListLayout", {
                    Parent = FSection,
                    Padding = UDim.new(0, 10),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Top 
                })
                
                local UiPadding = CreateElement("UIPadding", {
                    Parent = FSection,
                    PaddingLeft = UDim.new(0, 10), 
                    PaddingRight = UDim.new(0, 10),
                    PaddingTop = UDim.new(0, 10),
                    PaddingBottom = UDim.new(0, 10),
            	})
            	
            	UiList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    FSection.Size = UDim2.new(1, 0, 0, UiList.AbsoluteContentSize.Y)
                end)
                    
                local UiCorner_1 = CreateElement("UICorner", {
            		CornerRadius = UDim.new(0, 6),
            		Parent = FSection
            	})
            	
            	local UiStroke_2 = CreateElement("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Thickness = 1,
                    Color = Color3.fromRGB(30, 30, 30),
                    Parent = FSection,
                })
                
                function Section:Button(button)
                    button.Name = button.Name or "Example Button"
                    button.Callback = button.Callback or function() end
                    
                    local Button = {}
                    
                    local F_Button = CreateElement("Frame", {
                        Name = button.Name.. "_Button",
                        Parent = FSection,
                        ClipsDescendants = true,
                        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 30),
                    })
                    
                    local Line = CreateElement("Frame", {
                        Name = "Line",
                        Parent = FSection,
                        ClipsDescendants = true,
                        Visible = tab.Lines and true or false,
                        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 1),
                        AnchorPoint = Vector2.new(1, 1),
                        Position = UDim2.new(1, 0, 1, 5)
                    })
                    
                    local Title = CreateElement("TextLabel", {
                        Name = "Title",
                        Parent = F_Button,
                        Size = UDim2.new(0, 0, 0, 24),
                        AutomaticSize = Enum.AutomaticSize.X,
                        AnchorPoint = Vector2.new(0, 0),
                        Position = UDim2.new(0, 2, 0, 0),
                        BackgroundTransparency = 1,
                        TextTransparency = 0,
                        TextColor3 = Color3.fromRGB(140, 140, 140),
                        TextTransparency = 0,
                        TextSize = 16,
                        Font = Enum.Font.Sarpanch,
                        Text = button.Name,
                        TextWrapped = true,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    })
                    
                    local Icon = CreateElement("ImageLabel", {
                        Name = "Icon",
                        Parent = F_Button,
                        Size = UDim2.new(0, 16, 0, 16),
                        Position = UDim2.new(1, -3, 0.5, 0),
                        AnchorPoint = Vector2.new(1, 0.5),
                        BackgroundTransparency = 1,
                        ImageTransparency = 0,
                        ImageColor3 = Color3.fromRGB(140, 140, 140),
                        Image = "rbxassetid://12804017021"
                    })
                    
                    local OnClick = CreateElement("TextButton", {
                        Name = "OnClick",
                        Parent = F_Button,
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        AutoButtonColor = false,
                        Text = "",
                        TextSize = 0,
                    })
                    
                    F_Button.MouseEnter:Connect(function()
                        Title.TextColor3 = Color3.fromRGB(230, 230, 230)
                    end)
                    
                    F_Button.MouseLeave:Connect(function()
                        Title.TextColor3 = Color3.fromRGB(140, 140, 140)
                    end)
                    
                    function Callback()
                        spawn(function()
                            if button.Callback then
                                button.Callback()
                            end
                        end)
                    end
                    
                    OnClick.MouseButton1Click:Connect(function()
                        Callback()
                    end)
                    
                    function Button:SetName(setname)
                        Title.Text = setname
                        button.Name = setname
                    end
                    
                    function Button:GetCallback()
                        return button.Callback
                    end
                    
                    return Button
                end
                
                function Section:Toggle(toggle)
                    toggle.Name = toggle.Name or "Example toggle"
                    toggle.Default = toggle.Default or false
                    toggle.BindEnabled = toggle.BindEnabled or false
                    toggle.Bind = toggle.Bind or Enum.KeyCode.Unknown
                    toggle.Callback = toggle.Callback or function() end
                    
                    local Toggle = {}
                    
                    local F_Toggle = CreateElement("Frame", {
                        Name = toggle.Name.. "_Toggle",
                        Parent = FSection,
                        ClipsDescendants = true,
                        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 30),
                    })
                    
                    local Line = CreateElement("Frame", {
                        Name = "Line",
                        Parent = FSection,
                        ClipsDescendants = true,
                        Visible = tab.Lines and true or false,
                        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 1),
                        AnchorPoint = Vector2.new(1, 1),
                        Position = UDim2.new(1, 0, 1, 5)
                    })
                    
                    local Title = CreateElement("TextLabel", {
                        Name = "Title",
                        Parent = F_Toggle,
                        Size = UDim2.new(1, -52, 0, 24),
                        --AutomaticSize = Enum.AutomaticSize.X,
                        AnchorPoint = Vector2.new(0, 0),
                        Position = UDim2.new(0, 2, 0, 0),
                        BackgroundTransparency = 1,
                        TextTransparency = 0,
                        TextColor3 = Color3.fromRGB(140, 140, 140),
                        TextTransparency = 0,
                        TextSize = 16,
                        Font = Enum.Font.Sarpanch,
                        Text = toggle.Name,
                        TextWrapped = true,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    })
                    
                    local F_Holder = CreateElement("Frame", {
                        Name = "F_Holder",
                        Parent = F_Toggle,
                        ClipsDescendants = true,
                        Visible = true,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(0, 38, 0, 20),
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.new(1, -3, 0.5, 0)
                    })
                    
                    CreateElement("UICorner", {
                		CornerRadius = UDim.new(0.4, 0),
                		Parent = F_Holder
                	})
                	
                	CreateElement("UIStroke", {
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        Thickness = 1,
                        Color = Color3.fromRGB(30, 30, 30),
                        Parent = F_Holder,
                    })
                    
                    local F_Ball = CreateElement("Frame", {
                        Name = "F_Ball",
                        Parent = F_Holder,
                        ClipsDescendants = true,
                        Visible = true,
                        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                        BorderSizePixel = 0,
                        Size = UDim2.new(0, 15, 0, 15),
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.new(0, 3, 0.5, 0)
                    })
                    
                    CreateElement("UICorner", {
                		CornerRadius = UDim.new(0, 5),
                		Parent = F_Ball
                	})
                	
                	local OnClick = CreateElement("TextButton", {
                        Name = "OnClick",
                        Parent = F_Toggle,
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        AutoButtonColor = false,
                        Text = "",
                        TextSize = 0,
                    })
                    
                    local isEnabled = toggle.Default
                    
                    F_Toggle.MouseEnter:Connect(function()
                        Title.TextColor3 = Color3.fromRGB(230, 230, 230)
                    end)
                    
                    F_Toggle.MouseLeave:Connect(function()
                        Title.TextColor3 = Color3.fromRGB(140, 140, 140)
                    end)
                     
                    OnClick.MouseButton1Click:Connect(function()
                        isEnabled = not isEnabled
                        if isEnabled then
                            Toggle:Activate()
                        else
                            Toggle:Disable()
                        end
                    end)
                
                    function Callback(Value)
                        spawn(function()
                            if toggle.Callback then
                                toggle.Callback(Value)
                            end
                        end)
                    end
                
                    function Toggle:Activate()
                        isEnabled = true
                        local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                        local tweenColor = TweenService:Create(F_Ball, tweenInfo, {BackgroundColor3 = Color3.fromRGB(125, 15, 11)})
                        local tweenPos = TweenService:Create(F_Ball, tweenInfo, {
                            AnchorPoint = Vector2.new(1, 0.5),
                            Position = UDim2.new(1, -3, 0.5, 0)
                        })
                        tweenColor:Play()
                        tweenPos:Play()
                        Callback(isEnabled)
                    end
                    
                    function Toggle:Disable()
                        isEnabled = false
                        local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                        local tweenColor = TweenService:Create(F_Ball, tweenInfo, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
                        local tweenPos = TweenService:Create(F_Ball, tweenInfo, {
                            AnchorPoint = Vector2.new(0, 0.5),
                            Position = UDim2.new(0, 3, 0.5, 0)
                        })
                        tweenColor:Play()
                        tweenPos:Play()
                        Callback(isEnabled)
                    end
                    
                    if isEnabled then
                        Toggle:Activate()
                    else
                        Toggle:Disable()
                    end
                    
                    if toggle.BindEnabled then
                        -- Variáveis de estado
                        local isBinding = false
                        local currentBind = toggle.Bind or Enum.KeyCode.Unknown
                        
                        -- Elemento do bind (TextLabel)
                        local BindLabel = CreateElement("TextLabel", {
                            Parent = F_Toggle,
                            Text = currentBind == Enum.KeyCode.Unknown and "None" or " ".. tostring(currentBind):gsub("Enum.KeyCode.", "").. " ",
                            Visible = true,
                            BackgroundTransparency = 1,
                            TextColor3 = Color3.fromRGB(140, 140, 140),
                            TextSize = 13,
                            Font = Enum.Font.Sarpanch,
                            Size = UDim2.new(0, 0, 0, 20),
                            AutomaticSize = Enum.AutomaticSize.X,
                            Position = UDim2.new(1, -48, 0.5, 0),
                            AnchorPoint = Vector2.new(1, 0.5),
                            TextXAlignment = Enum.TextXAlignment.Center,
                        })
                        
                        CreateElement("UICorner", {
                            CornerRadius = UDim.new(0, 4),
                            Parent = BindLabel
                        })
                        
                        CreateElement("UIStroke", {
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            Color = Color3.fromRGB(30, 30, 30),
                            Thickness = 1,
                            Parent = BindLabel
                        })
                        
                        -- Botão invisível para capturar clicks
                        local BindButton = CreateElement("TextButton", {
                            Parent = BindLabel,
                            BackgroundTransparency = 1,
                            Size = UDim2.new(1, 0, 1, 0),
                            Text = "",
                            AutoButtonColor = false,
                        })
                        
                        local function updateBind(newBind)
                            currentBind = newBind
                            local displayText = newBind == Enum.KeyCode.Unknown and " None " or " "..tostring(newBind):gsub("Enum.KeyCode.", "").." "
                            BindLabel.Text = displayText
                            isBinding = false
                            BindLabel.TextColor3 = Color3.fromRGB(140, 140, 140)
                        end
                        
                        -- Função para alternar o Toggle
                        local function toggleState()
                            isEnabled = not isEnabled
                            if isEnabled then
                                Toggle:Activate()
                            else
                                Toggle:Disable()
                            end
                        end
                        
                        -- Variável para armazenar a conexão de input
                        local inputConnection
                        
                        -- Função para configurar o bind
                        local function startBinding()
                            if isBinding then return end
                            
                            isBinding = true
                            BindLabel.Text = " None "
                            BindLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            
                            -- Conexão temporária para capturar a nova tecla
                            local tempConnection
                            tempConnection = game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
                                if gameProcessed then return end
                                
                                -- Verifica se o clique foi fora do bind
                                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                    local mousePos = game:GetService("Players").LocalPlayer:GetMouse()
                                    if not BindLabel:IsDescendantOf(mousePos.Target) then
                                        tempConnection:Disconnect()
                                        updateBind(currentBind)
                                        return
                                    end
                                end
                                
                                -- Captura nova tecla
                                if toggle.BindEnabled and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode ~= Enum.KeyCode.Unknown then
                                    tempConnection:Disconnect()
                                    updateBind(input.KeyCode)
                                    
                                    -- Reconecta o listener principal se necessário
                                    if not inputConnection then
                                        setupInputListener()
                                    end
                                end
                            end)
                        end
                        
                        -- Função principal para ouvir inputs
                        local function setupInputListener()
                            inputConnection = game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
                                if gameProcessed then return end
                                
                                -- Ativa/desativa o toggle quando a tecla é pressionada
                                if toggle.BindEnabled and input.KeyCode == currentBind and currentBind ~= Enum.KeyCode.Unknown and not isBinding then
                                    toggleState()
                                end
                            end)
                        end
                        
                        -- Configura o listener inicial
                        setupInputListener()
                        
                        -- Evento de clique no botão do bind
                        BindButton.MouseButton1Click:Connect(startBinding)
                        
                        -- Funções para acessar o bind de fora
                        function Toggle:SetBind(newBind)
                            updateBind(newBind or Enum.KeyCode.Unknown)
                        end
                        
                        function Toggle:GetBind()
                            return currentBind
                        end
                    end
                    
                    function Toggle:SetName(setname)
                        Title.Text = setname
                        toggle.Name = setname
                    end
                    
                    function Toggle:GetState()
                        return isEnabled
                    end
                    
                    return Toggle
                end
                
                function Section:Checkbox(checkbox)
                    checkbox.Name = checkbox.Name or "Example checkbox"
                    checkbox.Default = checkbox.Default or false
                    checkbox.Callback = checkbox.Callback or function() end
                    
                    local Checkbox = {}
                    
                    local F_Checkbox = CreateElement("Frame", {
                        Name = checkbox.Name.. "_Checkbox",
                        Parent = FSection,
                        ClipsDescendants = true,
                        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 30),
                    })
                    
                    local Line = CreateElement("Frame", {
                        Name = "Line",
                        Parent = FSection,
                        ClipsDescendants = true,
                        Visible = tab.Lines and true or false,
                        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 1),
                        AnchorPoint = Vector2.new(1, 1),
                        Position = UDim2.new(1, 0, 1, 5)
                    })
                    
                    local Title = CreateElement("TextLabel", {
                        Name = "Title",
                        Parent = F_Checkbox,
                        Size = UDim2.new(0, 0, 0, 24),
                        AutomaticSize = Enum.AutomaticSize.X,
                        AnchorPoint = Vector2.new(0, 0),
                        Position = UDim2.new(0, 2, 0, 0),
                        BackgroundTransparency = 1,
                        TextTransparency = 0,
                        TextColor3 = Color3.fromRGB(140, 140, 140),
                        TextTransparency = 0,
                        TextSize = 16,
                        Font = Enum.Font.Sarpanch,
                        Text = checkbox.Name,
                        TextWrapped = true,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    })
                    
                    local F_Holder = CreateElement("Frame", {
                        Name = "F_Holder",
                        Parent = F_Checkbox,
                        ClipsDescendants = true,
                        Visible = true,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(0, 22, 0, 22),
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.new(1, -3, 0.5, 0)
                    })
                    
                    CreateElement("UICorner", {
                		CornerRadius = UDim.new(0.4, 0),
                		Parent = F_Holder
                	})
                	
                	CreateElement("UIStroke", {
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        Thickness = 1,
                        Color = Color3.fromRGB(30, 30, 30),
                        Parent = F_Holder,
                    })
                    
                    local Icon = CreateElement("ImageLabel", {
                        Name = "Icon",
                        Parent = F_Holder,
                        Size = UDim2.new(0, 16, 0, 16),
                        Position = UDim2.new(1, -3, 0.5, 0),
                        AnchorPoint = Vector2.new(1, 0.5),
                        BackgroundTransparency = 1,
                        ImageTransparency = 1,
                        ImageColor3 = Color3.fromRGB(140, 140, 140),
                        Image = "rbxassetid://138861967300749"
                    })
                    
                    local OnClick = CreateElement("TextButton", {
                        Name = "OnClick",
                        Parent = F_Checkbox,
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        AutoButtonColor = false,
                        Text = "",
                        TextSize = 0,
                    })
                    
                    F_Checkbox.MouseEnter:Connect(function()
                        Title.TextColor3 = Color3.fromRGB(230, 230, 230)
                    end)
                    
                    F_Checkbox.MouseLeave:Connect(function()
                        Title.TextColor3 = Color3.fromRGB(140, 140, 140)
                    end)
                    
                    local isEnabled = checkbox.Default
                    
                    OnClick.MouseButton1Click:Connect(function()
                        isEnabled = not isEnabled
                        if isEnabled then
                            Checkbox:Activate2()
                        else
                            Checkbox:Disable2()
                        end
                    end)
                
                    function Callback(Value)
                        spawn(function()
                            if checkbox.Callback then
                                checkbox.Callback(Value)
                            end
                        end)
                    end
                
                    function Checkbox:Activate2()
                        isEnabled = true
                        local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                        local tweenColor = TweenService:Create(Icon, tweenInfo, {
                            ImageTransparency = 0
                        })
                        tweenColor:Play()
                        Callback(isEnabled)
                    end
                    
                    function Checkbox:Disable2()
                        isEnabled = false
                        local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                        local tweenColor = TweenService:Create(Icon, tweenInfo, {
                            ImageTransparency = 1
                        })
                        tweenColor:Play()
                        Callback(isEnabled)
                    end
                    
                    if isEnabled then
                        Checkbox:Activate2()
                    else
                        Checkbox:Disable2()
                    end
                    
                    function Checkbox:GetState()
                        return isEnabled
                    end
                    
                    function Checkbox:SetName(Name)
                        Title.Text = Name
                        checkbox.Name = Name
                    end
                    
                    return Checkbox
                end
                
                function Section:Input(input)
                    input.Name = input.Name or "Example input"
                    input.Default = input.Default or ""
                    input.Placeholder = input.Placeholder or ". . ."
                    input.MultiLine = input.MultiLine or false
                    input.ClearTextOnFocus = input.ClearTextOnFocus or false
                    input.Callback = input.Callback or function() end
                    
                    local Input = {}
                    
                    local F_Input = CreateElement("Frame", {
                        Name = input.Name.. "_Input",
                        Parent = FSection,
                        ClipsDescendants = true,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 30),
                    })
                    
                    local Line = CreateElement("Frame", {
                        Name = "Line",
                        Parent = FSection,
                        ClipsDescendants = true,
                        Visible = tab.Lines and true or false,
                        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 1),
                        AnchorPoint = Vector2.new(1, 1),
                        Position = UDim2.new(1, 0, 1, 5)
                    })
                    
                    local Title = CreateElement("TextLabel", {
                        Name = "Title",
                        Parent = F_Input,
                        Size = UDim2.new(1, -95, 0, 24),
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.new(0, 2, 0.5, 0),
                        BackgroundTransparency = 1,
                        TextTransparency = 0,
                        TextColor3 = Color3.fromRGB(140, 140, 140),
                        TextTransparency = 0,
                        TextSize = 14,
                        Font = Enum.Font.Sarpanch,
                        Text = input.Name,
                        TextWrapped = true,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    })
                    
                    local F_Holder = CreateElement("Frame", {
                        Name = "F_Holder",
                        Parent = F_Input,
                        ClipsDescendants = true,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.new(1, -2, 0.5, 0),
                        Size = UDim2.new(0, 90, 0, 22),
                    })
                    
                    local Icon = CreateElement("ImageLabel", {
                	    Name = "Icon",
        	            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        	            BackgroundTransparency = 1,
            	        BorderColor3 = Color3.fromRGB(0, 0, 0),
            	        BorderSizePixel = 0,
            	        ImageColor3 = Color3.fromRGB(140, 140, 140),
            	        Image = "rbxassetid://15911231575",
        	            Size = UDim2.new(0, 16, 0, 16),
            	        AnchorPoint = Vector2.new(0, 0.5),
            	        Position = UDim2.new(0, 3, 0.5, 0),
                	    Parent = F_Holder,
                    })
                    
                    local InputText = CreateElement("TextBox", {
                        Parent = F_Holder,
                        Text = input.Default,
                        TextWrapped = true,
                        PlaceholderText = input.Placeholder,
                        ClearTextOnFocus = input.ClearTextOnFocus,
                        MultiLine = input.MultiLine,
                        BackgroundTransparency = 1,
                        TextColor3 = Color3.fromRGB(140, 140, 140),
                        TextTransparency = 0,
                        PlaceholderColor3 = Color3.fromRGB(140, 140, 140),
                        BorderSizePixel = 0,
                        TextSize = 14,
                        Font = Enum.Font.Sarpanch,
                        Size = UDim2.new(1, - 23, 1, 0),
                        Position = UDim2.new(1, 0, 0.5, 0),
                        AnchorPoint = Vector2.new(1, 0.5),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextInputType = Enum.TextInputType.Default,
                    })
                    
                    CreateElement("UICorner", {
                		CornerRadius = UDim.new(0, 6),
                		Parent = F_Holder
                	})
                	
                	CreateElement("UIStroke", {
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        Thickness = 1,
                        Color = Color3.fromRGB(30, 30, 30),
                        Parent = F_Holder,
                    })
                    
                    local OnClick = CreateElement("TextButton", {
                        Name = "OnClick",
                        Parent = F_Input,
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, -115, 1, 0),
                        AutoButtonColor = false,
                        Text = "",
                        TextSize = 0,
                    })
                    
                    F_Input.MouseEnter:Connect(function()
                        Title.TextColor3 = Color3.fromRGB(230, 230, 230)
                    end)
                    
                    F_Input.MouseLeave:Connect(function()
                        Title.TextColor3 = Color3.fromRGB(140, 140, 140)
                    end)
                    
                    OnClick.MouseButton1Click:Connect(function()
                        input.Callback(InputText.Text)
                    end)

                    InputText.FocusLost:Connect(function(enterPressed)
                        input.Callback(InputText.Text)
                    end)
                    
                    function Input:SetName(setName)
                        Title.Text = setName
                        input.Name = setName
                    end

                    function Input:GetValue()
                        return InputText.Text
                    end
                    
                    function Input:SetValue(value)
                        InputText.Text = value or input.Default
                    end

                    function Input:Focus()
                        InputText:CaptureFocus()
                        if input.ClearTextOnFocus then
                            InputText.Text = ""
                        end
                    end
                    
                    function Input:SetCallback(newCallback)
                        if type(newCallback) == "function" then
                            input.Callback = newCallback
                        end
                    end  
                    
                    return Input
                end
                
                function Section:Slide(slide)
                    slide.Name = slide.Name or "Example slide"
                    slide.Max = slide.Max or 100 -- 10.0
                    slide.Min = slide.Min or 0 -- 0.0
                    slide.Default = slide.Default or 50 -- 5.0
                    slide.DisplayMethod = slide.DisplayMethod or "Value" -- Value, Percentage, Decimal 
                    slide.Callback = slide.Callback or function() end
                    
                    local Slide = {}
                    
                    local F_Slider = CreateElement("Frame", {
                        Name = slide.Name.. "_Slider",
                        Parent = FSection,
                        ClipsDescendants = true,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 40),
                    })
                    
                    local Line = CreateElement("Frame", {
                        Name = "Line",
                        Parent = FSection,
                        ClipsDescendants = true,
                        Visible = tab.Lines and true or false,
                        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 1),
                        AnchorPoint = Vector2.new(1, 1),
                        Position = UDim2.new(1, 0, 1, 5)
                    })
                    
                    local F_Top = CreateElement("Frame", {
                        Name = "F_Top",
                        Parent = F_Slider,
                        ClipsDescendants = true,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 30),
                    })
                    
                    local Title = CreateElement("TextLabel", {
                        Name = "Title",
                        Parent = F_Top,
                        Size = UDim2.new(0, 0, 0, 24),
                        AutomaticSize = Enum.AutomaticSize.X,
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.new(0, 2, 0.5, 0),
                        BackgroundTransparency = 1,
                        TextTransparency = 0,
                        TextColor3 = Color3.fromRGB(140, 140, 140),
                        TextTransparency = 0,
                        TextSize = 14,
                        Font = Enum.Font.Sarpanch,
                        Text = slide.Name,
                        TextWrapped = true,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    })
                    
                    local F_Bg = CreateElement("Frame", {
                        Name = "F_Bg",
                        Parent = F_Slider,
                        ClipsDescendants = false,
                        BackgroundColor3 = Color3.fromRGB(19, 19, 19),
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(1, 1),
                        Position = UDim2.new(1, 0, 1, -5),
                        Size = UDim2.new(1, 0, 0, 3),
                    })
                    
                    local UiCorner = CreateElement("UICorner", {
                		CornerRadius = UDim.new(1, 0),
                		Parent = F_Bg
                	})
                	
                	local F_BgRed = CreateElement("Frame", {
                        Name = "F_BgRed",
                        Parent = F_Bg,
                        ClipsDescendants = false,
                        BackgroundColor3 = Color3.fromRGB(125, 15, 11),
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(0, 0),
                        Position = UDim2.new(0, 0, 0, 0),
                        Size = UDim2.new(0, 0, 1, 0),
                    })
                    
                    local UiCorner = CreateElement("UICorner", {
                		CornerRadius = UDim.new(1, 0),
                		Parent = F_BgRed
                	})
                	
                	local F_Ball = CreateElement("Frame", {
                        Name = "F_Ball",
                        Parent = F_Bg,
                        ClipsDescendants = true,
                        BackgroundColor3 = Color3.fromRGB(125, 15, 11),
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.new(1, 0, 0.5, 0),
                        Size = UDim2.new(0, 12, 0, 12),
                    })
                    
                    local UiCorner = CreateElement("UICorner", {
                		CornerRadius = UDim.new(1, 0),
                		Parent = F_Ball
                	})
                	
                	local OnClick = CreateElement("TextButton", {
                        Name = "OnClick",
                        Parent = F_Ball,
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        AutoButtonColor = false,
                        Text = "",
                        TextSize = 0.000,
                    })
                    
                    local Value = CreateElement("TextLabel", {
                        Name = "Value",
                        Parent = F_Top,
                        Size = UDim2.new(0, 0, 0, 20),
                        AutomaticSize = Enum.AutomaticSize.X,
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.new(1, -2, 0.5, 0),
                        BackgroundTransparency = 1,
                        TextTransparency = 0,
                        TextColor3 = Color3.fromRGB(140, 140, 140),
                        TextTransparency = 0,
                        TextSize = 14,
                        Font = Enum.Font.Sarpanch,
                        Text = "",
                        TextWrapped = true,
                        TextXAlignment = Enum.TextXAlignment.Center,
                    })
                    
                    CreateElement("UICorner", {
                		CornerRadius = UDim.new(0, 5),
                		Parent = Value
                	})
                	
                	CreateElement("UIStroke", {
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        Thickness = 1,
                        Color = Color3.fromRGB(30, 30, 30),
                        Parent = Value,
                    })
                    
                    F_Slider.MouseEnter:Connect(function()
                        Title.TextColor3 = Color3.fromRGB(230, 230, 230)
                    end)
                    
                    F_Slider.MouseLeave:Connect(function()
                        Title.TextColor3 = Color3.fromRGB(140, 140, 140)
                    end)
                    
                    local lastSentValue = nil
                    local dragging = false
                    local startDragX = 0
                    local startClickX = 0
                    
                    -- Configurações de margem
                    local MARGIN_LEFT = 7
                    local MARGIN_RIGHT = -15
                    local BALL_WIDTH = F_Ball.AbsoluteSize.X
                    local BALL_HALF_WIDTH = BALL_WIDTH / 2
                    
                    -- Área útil do slider (considerando metade da largura da bola nas bordas)
                    local sliderMinX = MARGIN_LEFT + BALL_HALF_WIDTH
                    local sliderMaxX = F_Bg.AbsoluteSize.X - MARGIN_RIGHT - BALL_HALF_WIDTH
                    local sliderWidth = F_Bg.AbsoluteSize.X - MARGIN_LEFT - MARGIN_RIGHT - BALL_WIDTH
                    
                    -- Posição inicial
                    local initialScale = (slide.Default - slide.Min) / (slide.Max - slide.Min)
                    local initialPos = sliderMinX + (initialScale * sliderWidth) - BALL_HALF_WIDTH
                    F_Ball.Position = UDim2.new(0, initialPos, 0.5, 0)
                    F_BgRed.Size = UDim2.new(0, initialPos - BALL_HALF_WIDTH, 1, 0)

                    local function UpdateDisplay(value)
                        if slide.DisplayMethod == "Percentage" then
                            local percentage = math.floor(((value - slide.Min) / (slide.Max - slide.Min)) * 100)
                            Value.Text = " "..tostring(percentage).."% "
                        elseif slide.DisplayMethod == "Decimal" then
                            Value.Text = " "..string.format("%.1f", value).." "
                        else -- "Value"
                            Value.Text = " "..tostring(math.floor(value)).." "
                        end
                    end

                    local function UpdateSlider()
                        local ballPos = F_Ball.Position.X.Offset
                        F_BgRed.Size = UDim2.new(0, ballPos - BALL_HALF_WIDTH, 1, 0)
                        
                        local scale = math.clamp((ballPos - sliderMinX + BALL_HALF_WIDTH) / sliderWidth, 0, 1)
                        local rawValue = slide.Min + (slide.Max - slide.Min) * scale
                        local roundedValue = slide.DisplayMethod == "Decimal" and math.floor(rawValue * 10)/10 or math.floor(rawValue)
                        
                        UpdateDisplay(roundedValue)
                        
                        -- Só envia para o callback se o valor mudou
                        if lastSentValue ~= roundedValue then
                            slide.Callback(roundedValue)
                            lastSentValue = roundedValue
                        end
                    end

                    UpdateDisplay(slide.Default)
                    
                    -- Controles
                    OnClick.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            dragging = true
                            startDragX = input.Position.X
                            startClickX = F_Ball.Position.X.Offset
                        end
                    end)
                    
                    game:GetService("UserInputService").InputChanged:Connect(function(input)
                        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                            local deltaX = input.Position.X - startDragX
                            local newPos = math.clamp(startClickX + deltaX, sliderMinX - BALL_HALF_WIDTH, sliderMaxX - BALL_HALF_WIDTH)
                            
                            F_Ball.Position = UDim2.new(0, newPos, 0.5, 0)
                            UpdateSlider()
                        end
                    end)
                    
                    game:GetService("UserInputService").InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            dragging = false
                        end
                    end)
                    
                    function Slide:SetName(Name)
                        slide.Name = Name
                        Title.Text = Name
                    end
                    
                    function Slide:GetValue()
                        -- Retorna o valor numérico atual (não o texto exibido)
                        local currentPos = F_Ball.Position.X.Offset
                        local scale = math.clamp((currentPos - sliderMinX - BALL_HALF_WIDTH) / sliderWidth, 0, 1)
                        local value = slide.Min + (slide.Max - slide.Min) * scale
                        
                        if slide.DisplayMethod == "Decimal" then
                            return math.floor(value * 10) / 10
                        end
                        return math.floor(value)
                    end
                    
                    function Slide:SetMax(Max)
                        slide.Max = Max
                    end
                    
                    function Slide:SetMin(Min)
                        slide.Min = Min
                    end
                    
                    function Slide:SetDefault(Def)
                        slide.Default = Def
                    end
                    
                    function Slide:SetValue(Val)
                        -- Garante que o valor está dentro dos limites
                        Val = math.clamp(Val, slide.Min, slide.Max)
                        
                        -- Calcula a nova posição
                        local scale = (Val - slide.Min) / (slide.Max - slide.Min)
                        local newPos = sliderMinX + (scale * sliderWidth) - BALL_HALF_WIDTH
                        
                        -- Aplica as mudanças
                        F_Ball.Position = UDim2.new(0, newPos, 0.5, 0)
                        F_BgRed.Size = UDim2.new(0, newPos - BALL_HALF_WIDTH, 1, 0)
                        
                        -- Atualiza o display
                        if slide.DisplayMethod == "Percentage" then
                            local percentage = math.floor(scale * 100)
                            Value.Text = " "..tostring(percentage).."% "
                        elseif slide.DisplayMethod == "Decimal" then
                            Value.Text = " "..string.format("%.1f", Val).." "
                        else
                            Value.Text = " "..tostring(math.floor(Val)).." "
                        end
                        
                        -- Chama o callback se o valor mudou
                        if lastSentValue ~= Val then
                            slide.Callback(Val)
                            lastSentValue = Val
                        end
                    end
                    
                    function Slide:SetDisplayMethod(Dis)
                        slide.DisplayMethod = Dis
                        -- Atualiza o display com o novo formato
                        self:SetValue(self:GetValue())
                    end
                                        
                    return Slide
                end
                
                return Section
            end
                       
            return Tab
        end

        return TabV
    end

    return GroupV
end

return Lib
