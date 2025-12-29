-- SERVICES
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local Player = game.Players.LocalPlayer

-- CONFIG
local VALID_KEY = "wd001"
local LOGO_IMAGE = "rbxassetid://YOUR_ASSET_ID" -- IMPORTANT

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "WieldingHubGui"
gui.ResetOnSpawn = false
gui.Parent = Player:WaitForChild("PlayerGui")

-- UTILS
local function tween(obj, t, props)
	return TweenService:Create(
		obj,
		TweenInfo.new(t, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
		props
	)
end

-- ================= FLOATING ICON =================
local icon = Instance.new("ImageButton")
icon.Size = UDim2.new(0,46,0,46)
icon.Position = UDim2.new(0,18,0.5,-23)
icon.BackgroundColor3 = Color3.fromRGB(15,15,15)
icon.Image = LOGO_IMAGE
icon.Visible = false
icon.Parent = gui
Instance.new("UICorner", icon).CornerRadius = UDim.new(1,0)

-- ================= MAIN FRAME =================
local main = Instance.new("Frame")
main.Size = UDim2.new(0,460,0,340)
main.Position = UDim2.new(0.5,0,0.5,0)
main.AnchorPoint = Vector2.new(0.5,0.5)
main.BackgroundColor3 = Color3.fromRGB(10,10,10)
main.BackgroundTransparency = 1
main.BorderSizePixel = 0
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)

-- ================= DRAG SYSTEM =================
do
	local dragging, dragStart, startPos

	main.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = main.Position
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			main.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)

	UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)
end

-- CLOSE
local close = Instance.new("TextButton")
close.Size = UDim2.new(0,32,0,32)
close.Position = UDim2.new(1,-40,0,8)
close.Text = "✕"
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.TextColor3 = Color3.new(1,1,1)
close.BackgroundTransparency = 1
close.Parent = main

-- TITLE
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.Text = "Wielding Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.TextColor3 = Color3.new(1,1,1)
title.TextTransparency = 1
title.Parent = main

-- CONTENT
local content = Instance.new("Frame")
content.Position = UDim2.new(0,20,0,60)
content.Size = UDim2.new(1,-40,1,-80)
content.BackgroundTransparency = 1
content.Parent = main

-- ================= HUB UI =================
local hubText = Instance.new("TextLabel")
hubText.Size = UDim2.new(1,0,0,30)
hubText.Text = "Main Features"
hubText.Font = Enum.Font.GothamBold
hubText.TextSize = 18
hubText.TextColor3 = Color3.new(1,1,1)
hubText.Visible = false
hubText.BackgroundTransparency = 1
hubText.Parent = content

-- ================= TOGGLE BUTTON CREATOR =================
local function createToggle(text, yPos)
	local toggle = Instance.new("TextButton")
	toggle.Size = UDim2.new(1,0,0,40)
	toggle.Position = UDim2.new(0,0,0,yPos)
	toggle.BackgroundColor3 = Color3.fromRGB(18,18,18)
	toggle.Text = text
	toggle.Font = Enum.Font.Gotham
	toggle.TextSize = 15
	toggle.TextColor3 = Color3.fromRGB(200,200,200)
	toggle.Parent = content
	Instance.new("UICorner", toggle).CornerRadius = UDim.new(0,10)

	local enabled = false

	-- Hover
	toggle.MouseEnter:Connect(function()
		tween(toggle,0.2,{BackgroundColor3 = Color3.fromRGB(30,30,30)}):Play()
	end)

	toggle.MouseLeave:Connect(function()
		tween(toggle,0.2,{
			BackgroundColor3 = enabled and Color3.fromRGB(255,255,255) or Color3.fromRGB(18,18,18),
			TextColor3 = enabled and Color3.fromRGB(0,0,0) or Color3.fromRGB(200,200,200)
		}):Play()
	end)

	-- Click
	toggle.MouseButton1Click:Connect(function()
		enabled = not enabled
		tween(toggle,0.25,{
			BackgroundColor3 = enabled and Color3.fromRGB(255,255,255) or Color3.fromRGB(18,18,18),
			TextColor3 = enabled and Color3.fromRGB(0,0,0) or Color3.fromRGB(200,200,200)
		}):Play()
	end)

	return toggle
end

-- CREATE TOGGLES
local t1 = createToggle("ESP", 45)
local t2 = createToggle("Aimbot", 95)
local t3 = createToggle("Speed Boost", 145)

hubText.Visible = true

-- ================= OPEN ANIM =================
tween(main,0.5,{BackgroundTransparency=0}):Play()
tween(title,0.5,{TextTransparency=0}):Play()

-- ================= CLOSE / REOPEN =================
close.MouseButton1Click:Connect(function()
	tween(main,0.4,{BackgroundTransparency=1}):Play()
	task.wait(0.4)
	main.Visible = false
	icon.Visible = true
end)

icon.MouseButton1Click:Connect(function()
	icon.Visible = false
	main.Visible = true
	tween(main,0.4,{BackgroundTransparency=0}):Play()
end)
