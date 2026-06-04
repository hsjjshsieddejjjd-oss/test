local zay = {}
local function assert_no_setfenv()
	if rawget(_G, "setfenv") ~= nil then
		error("FATAL: setfenv detected", 0)
	end
end

assert_no_setfenv()
function zay:Run(id)
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local UserInputService = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")
	local TweenService = game:GetService("TweenService")

	local discordLink = "https://discord.gg/HfMBj367jT"
	local clipboardFunc = setclipboard or toclipboard or print
	
	local fileName = string.format("zay_key_cache_%s.txt", tostring(id))

	local function getUIParent()
		local suc, gui = pcall(function()
			return gethui and gethui() or game:GetService("CoreGui")
		end)
		return (suc and gui) or player:WaitForChild("PlayerGui")
	end

	local function notify(title, text, time)
		pcall(function()
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = title,
				Text = text,
				Duration = time or 5
			})
		end)
	end

	-- Dark Red and Right Half Dark Purple Split Theme
	local Theme = {
		Background = Color3.fromRGB(30, 0, 5), -- Base dark red fallback
		TopBar = Color3.fromRGB(20, 0, 20),
		InputBG = Color3.fromRGB(25, 5, 25),
		Accent = Color3.fromRGB(80, 0, 100),
		Success = Color3.fromRGB(0, 200, 0),
		Failure = Color3.fromRGB(200, 0, 0)
	}

	local function runkey(key)
		local HttpService = game:GetService("HttpService")
		local url = "https://zkeys.pages.dev/api"
		local body = {
			key = key,
			id = id
		}

		local response = request({
			Url = url,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = HttpService:JSONEncode(body)
		})

		return HttpService:JSONDecode(response.Body)
	end

	if readfile and writefile then
		local success, savedKey = pcall(readfile, fileName)
		if success and savedKey and savedKey ~= "" then
			local data = runkey(savedKey)
			if data and data.success then
				notify("Access Auto-Granted", "Loaded key from device storage.", 2)
				return loadstring(data.code)()
			end
		end
	end

	local no = Instance.new("ScreenGui")
	no.Name = "mom im famous"
	no.ResetOnSpawn = false
	no.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	no.Parent = getUIParent()

	local mother = Instance.new("Frame")
	mother.Name = "MainFrame"
	mother.Size = UDim2.new(0, 0, 0, 0)
	mother.Position = UDim2.new(0.5, 0, 0.5, 0)
	mother.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Needed for gradient
	mother.BorderSizePixel = 0
	mother.ClipsDescendants = true
	mother.Parent = no

	-- Left half Dark Red, Right half Dark Purple Split Gradient
	local splitGradient = Instance.new("UIGradient")
	splitGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0.0, Color3.fromRGB(35, 2, 5)),    -- Dark Red
		ColorSequenceKeypoint.new(0.48, Color3.fromRGB(35, 2, 5)),   -- Hard split line left
		ColorSequenceKeypoint.new(0.52, Color3.fromRGB(20, 2, 35)),  -- Hard split line right
		ColorSequenceKeypoint.new(1.0, Color3.fromRGB(20, 2, 35))    -- Dark Purple
	})
	splitGradient.Rotation = 0
	splitGradient.Parent = mother

	local dad = Instance.new("UICorner")
	dad.CornerRadius = UDim.new(0, 9)
	dad.Parent = mother

	local dude = Instance.new("UIStroke")
	dude.Color = Color3.fromRGB(55, 15, 55)
	dude.Thickness = 1.5
	dude.Transparency = 1
	dude.Parent = mother

	local dogpound = Instance.new("TextLabel")
	dogpound.Size = UDim2.new(1, 0, 1, 0)
	dogpound.BackgroundTransparency = 1
	dogpound.Text = "mom im famous"
	dogpound.TextColor3 = Color3.fromRGB(255, 255, 255)
	dogpound.TextSize = 24
	dogpound.Font = Enum.Font.GothamBold
	dogpound.TextTransparency = 1
	dogpound.Parent = mother

	local nope = Instance.new("Frame")
	nope.Name = "TopBar"
	nope.Size = UDim2.new(1, 0, 0, 45)
	nope.BackgroundColor3 = Theme.TopBar
	nope.BorderSizePixel = 0
	nope.BackgroundTransparency = 1
	nope.Parent = mother

	local cool = Instance.new("UICorner")
	cool.CornerRadius = UDim.new(0, 9)
	cool.Parent = nope

	local abs = Instance.new("Frame")
	abs.Size = UDim2.new(1, 0, 0, 5)
	abs.Position = UDim2.new(0, 0, 1, -5)
	abs.BackgroundColor3 = Theme.TopBar
	abs.BorderSizePixel = 0
	abs.BackgroundTransparency = 1
	abs.Parent = nope

	local bro = Instance.new("TextLabel")
	bro.Name = "Title"
	bro.Size = UDim2.new(1, -40, 1, 0)
	bro.Position = UDim2.new(0, 20, 0, 0)
	bro.BackgroundTransparency = 1
	bro.Text = "js a key system lmao"
	bro.TextColor3 = Color3.fromRGB(240, 240, 240)
	bro.TextSize = 15
	bro.Font = Enum.Font.GothamBold
	bro.TextXAlignment = Enum.TextXAlignment.Left
	bro.TextTransparency = 1
	bro.Parent = nope

	local like = Instance.new("TextLabel")
	like.Name = "Subtitle"
	like.Size = UDim2.new(1, -40, 0, 15)
	like.Position = UDim2.new(0, 145, 0.5, -7)
	like.BackgroundTransparency = 1
	like.Text = "hi"
	like.TextColor3 = Color3.fromRGB(150, 100, 150)
	like.TextSize = 12
	like.Font = Enum.Font.Gotham
	like.TextXAlignment = Enum.TextXAlignment.Left
	like.TextTransparency = 1
	like.Parent = nope

	local UIListLayout = Instance.new("Frame")
	UIListLayout.Name = "yo js a key system fam"
	UIListLayout.Size = UDim2.new(1, 0, 1, -45)
	UIListLayout.Position = UDim2.new(0, 0, 0, 45)
	UIListLayout.BackgroundTransparency = 1
	UIListLayout.Parent = mother

	local CopyButton = Instance.new("TextLabel")
	CopyButton.Name = "sup"
	CopyButton.Size = UDim2.new(1, -40, 0, 40)
	CopyButton.Position = UDim2.new(0, 20, 0, 15)
	CopyButton.BackgroundTransparency = 1
	CopyButton.Text = "js get the key from discord mate"
	CopyButton.TextColor3 = Color3.fromRGB(180, 160, 180)
	CopyButton.TextSize = 13
	CopyButton.Font = Enum.Font.Gotham
	CopyButton.TextWrapped = true
	CopyButton.TextYAlignment = Enum.TextYAlignment.Top
	CopyButton.TextXAlignment = Enum.TextXAlignment.Left
	CopyButton.TextTransparency = 1
	CopyButton.Parent = UIListLayout

	local CopyCorner = Instance.new("Frame")
	CopyCorner.Name = "InputFrame"
	CopyCorner.Size = UDim2.new(1, -40, 0, 44)
	CopyCorner.Position = UDim2.new(0, 20, 0, 65)
	CopyCorner.BackgroundColor3 = Theme.InputBG
	CopyCorner.BorderSizePixel = 0
	CopyCorner.BackgroundTransparency = 1
	CopyCorner.Parent = UIListLayout

	local CopyStroke = Instance.new("UICorner")
	CopyStroke.CornerRadius = UDim.new(0, 6)
	CopyStroke.Parent = CopyCorner

	local SubmitButton = Instance.new("UIStroke")
	SubmitButton.Color = Color3.fromRGB(60, 20, 70)
	SubmitButton.Thickness = 1
	SubmitButton.Transparency = 1
	SubmitButton.Parent = CopyCorner

	local SubmitCorner = Instance.new("TextBox")
	SubmitCorner.Size = UDim2.new(1, -20, 1, 0)
	SubmitCorner.Position = UDim2.new(0, 10, 0, 0)
	SubmitCorner.BackgroundTransparency = 1
	SubmitCorner.Text = ""
	SubmitCorner.PlaceholderText = "enter the key here"
	SubmitCorner.PlaceholderColor3 = Color3.fromRGB(110, 80, 110)
	SubmitCorner.TextColor3 = Color3.fromRGB(255, 255, 255)
	SubmitCorner.TextSize = 14
	SubmitCorner.Font = Enum.Font.Gotham
	SubmitCorner.TextXAlignment = Enum.TextXAlignment.Left
	SubmitCorner.TextTransparency = 1
	SubmitCorner.Parent = CopyCorner

	local SubmitStroke = Instance.new("Frame")
	SubmitStroke.Size = UDim2.new(1, -40, 0, 40)
	SubmitStroke.Position = UDim2.new(0, 20, 0, 125)
	SubmitStroke.BackgroundTransparency = 1
	SubmitStroke.Parent = UIListLayout

	local createHoverEffect = Instance.new("UIListLayout")
	createHoverEffect.FillDirection = Enum.FillDirection.Horizontal
	createHoverEffect.SortOrder = Enum.SortOrder.LayoutOrder
	createHoverEffect.Padding = UDim.new(0, 12)
	createHoverEffect.Parent = SubmitStroke

	local button = Instance.new("TextButton")
	button.Name = "CopyButton"
	button.Size = UDim2.new(0.5, -6, 1, 0)
	button.BackgroundColor3 = Theme.InputBG
	button.BorderSizePixel = 0
	button.Text = "get key"
	button.TextColor3 = Color3.fromRGB(230, 230, 230)
	button.TextSize = 13
	button.Font = Enum.Font.GothamBold
	button.AutoButtonColor = false
	button.BackgroundTransparency = 1
	button.TextTransparency = 1
	button.Parent = SubmitStroke

	local stroke = Instance.new("UICorner")
	stroke.CornerRadius = UDim.new(0, 6)
	stroke.Parent = button

	local baseColor = Instance.new("UIStroke")
	baseColor.Color = Color3.fromRGB(65, 25, 75)
	baseColor.Thickness = 1
	baseColor.Transparency = 1
	baseColor.Parent = button

	local hoverColor = Instance.new("TextButton")
	hoverColor.Name = "SubmitButton"
	hoverColor.Size = UDim2.new(0.5, -6, 1, 0)
	hoverColor.BackgroundColor3 = Color3.fromRGB(45, 15, 50)
	hoverColor.BorderSizePixel = 0
	hoverColor.Text = "submit key"
	hoverColor.TextColor3 = Color3.fromRGB(255, 255, 255)
	hoverColor.TextSize = 13
	hoverColor.Font = Enum.Font.GothamBold
	hoverColor.AutoButtonColor = false
	hoverColor.BackgroundTransparency = 1
	hoverColor.TextTransparency = 1
	hoverColor.Parent = SubmitStroke

	local baseStroke = Instance.new("UICorner")
	baseStroke.CornerRadius = UDim.new(0, 6)
	baseStroke.Parent = hoverColor

	local hoverStroke = Instance.new("UIStroke")
	hoverStroke.Color = Theme.Accent
	hoverStroke.Thickness = 1
	hoverStroke.Transparency = 1
	hoverStroke.Parent = hoverColor

	-- Much Better/Smoother Kinetic Button Dragging and Click Animations
	local function dragging(dragInput, dragStart, startPos, update, targetPos, delta)
		dragInput.MouseEnter:Connect(function()
			TweenService:Create(dragInput, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = update}):Play()
			TweenService:Create(dragStart, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = targetPos, Thickness = 1.5}):Play()
		end)
		dragInput.MouseLeave:Connect(function()
			TweenService:Create(dragInput, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = startPos}):Play()
			TweenService:Create(dragStart, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = delta, Thickness = 1}):Play()
		end)
		dragInput.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				TweenService:Create(dragInput, TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(dragInput.Size.X.Scale, dragInput.Size.X.Offset - 6, dragInput.Size.Y.Scale, dragInput.Size.Y.Offset - 4)}):Play()
			end
		end)
		dragInput.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				TweenService:Create(dragInput, TweenInfo.new(0.4, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Size = UDim2.new(dragInput.Size.X.Scale, dragInput.Size.X.Offset + 6, dragInput.Size.Y.Scale, dragInput.Size.Y.Offset + 4)}):Play()
			end
		end)
	end

	dragging(button, baseColor, Theme.InputBG, Color3.fromRGB(50, 10, 30), Color3.fromRGB(90, 20, 110), Color3.fromRGB(65, 25, 75))
	dragging(hoverColor, hoverStroke, Color3.fromRGB(45, 15, 50), Color3.fromRGB(70, 20, 80), Color3.fromRGB(140, 20, 170), Theme.Accent)

	local draggingToggle, dragInput, dragStart, startPos
	nope.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			draggingToggle = true
			dragStart = input.Position
			startPos = mother.Position

			local c;
			c = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					draggingToggle = false
					c:Disconnect()
				end
			end)
		end
	end)

	nope.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and draggingToggle then
			local delta = input.Position - dragStart
			-- Fluid Canvas Trailing Drag Translation Effect
			TweenService:Create(mother, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			}):Play()
		end
	end)

	button.MouseButton1Click:Connect(function()
		if clipboardFunc then 
			clipboardFunc(discordLink) 
			local oldText = button.Text
			button.Text = "Link Copied!"
			task.wait(1.5)
			button.Text = oldText
		end
	end)

	local verifyEvent = Instance.new("BindableEvent")
	local run

	hoverColor.MouseButton1Click:Connect(function()
		if hoverColor.Text == "SCANNING..." then return end
		
		local originalText = hoverColor.Text
		local enteredKey = SubmitCorner.Text
		hoverColor.Text = "SCANNING..."
		hoverColor.TextColor3 = Color3.fromRGB(255, 255, 255)

		local scanOverlay = Instance.new("Frame")
		scanOverlay.Name = "ScanOverlay"
		scanOverlay.Size = UDim2.new(1, 0, 1, 0)
		scanOverlay.BackgroundTransparency = 1
		scanOverlay.ClipsDescendants = true
		scanOverlay.ZIndex = 100
		scanOverlay.Parent = mother
		Instance.new("UICorner", scanOverlay).CornerRadius = UDim.new(0, 9)

		local laser = Instance.new("Frame")
		laser.Name = "Laser"
		laser.Size = UDim2.new(1, 0, 0, 3)
		laser.Position = UDim2.new(0, 0, -0.1, 0)
		laser.BackgroundColor3 = Color3.fromRGB(255, 50, 100)
		laser.BorderSizePixel = 0
		laser.ZIndex = 102
		laser.Parent = scanOverlay

		local flare = Instance.new("Frame")
		flare.Size = UDim2.new(1, 0, 0, 60)
		flare.BackgroundColor3 = Color3.fromRGB(255, 50, 120)
		flare.BackgroundTransparency = 0.93
		flare.BorderSizePixel = 0
		flare.ZIndex = 101
		flare.Parent = scanOverlay
		local fg = Instance.new("UIGradient", flare)
		fg.Rotation = 90
		fg.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(1, 1)
		})

		-- Faster, sharper scan animations
		local scanTime = 0.55
		local tweenInfo = TweenInfo.new(scanTime, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 1, true)
		local tween = TweenService:Create(laser, tweenInfo, {Position = UDim2.new(0, 0, 1.1, 0)})
		tween:Play()

		local connection = RunService.RenderStepped:Connect(function()
			flare.Position = laser.Position - UDim2.new(0, 0, 0, 60)
		end)

		local data = runkey(enteredKey)

		task.wait(scanTime * 2)
		connection:Disconnect()

		if data.success then
			run = data.code
			
			if writefile then
				pcall(writefile, fileName, enteredKey)
			end
			
			laser.BackgroundColor3 = Theme.Success
			flare.BackgroundColor3 = Theme.Success
			
			hoverColor.Text = "Access Granted!"
			hoverColor.TextColor3 = Color3.fromRGB(100, 255, 100)
			TweenService:Create(hoverStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Theme.Success}):Play()
			
			notify("Access Granted", "Welcome back!", 2)
			task.wait(0.3)

			TweenService:Create(scanOverlay, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
			TweenService:Create(flare, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
			TweenService:Create(laser, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
			
			-- Crazy Back-Bounce Collapse Exit
			TweenService:Create(mother, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
			task.wait(0.5)
			no:Destroy()
			verifyEvent:Fire()
		else
			scanOverlay:Destroy()
			hoverColor.Text = "Incorrect Key!"
			hoverColor.TextColor3 = Color3.fromRGB(255, 100, 100)
			TweenService:Create(hoverStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Theme.Failure}):Play()
			
			local originalPos = mother.Position

			-- Crazy High-Velocity Positional Elastic Shake Sequence
			task.spawn(function()
				-- Override to pure error red flash on split sequence
				local originalSequence = splitGradient.Color
				splitGradient.Color = ColorSequence.new(Color3.fromRGB(70, 0, 10))
				
				local shakeIntensity = {16, -14, 11, -9, 6, -3, 0}
				for _, offset in ipairs(shakeIntensity) do
					TweenService:Create(mother, TweenInfo.new(0.03, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						Position = originalPos + UDim2.new(0, offset, 0, math.random(-3, 3))
					}):Play()
					task.wait(0.03)
				end
				
				-- Return background to correct dark red / purple split design
				splitGradient.Color = originalSequence
				TweenService:Create(mother, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = originalPos}):Play()
			end)

			notify("Denied", "Incorrect Key! Try again.", 3)
			task.wait(1.5)
			
			hoverColor.Text = "submit key"
			hoverColor.TextColor3 = Color3.fromRGB(255, 255, 255)
			TweenService:Create(hoverStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Theme.Accent}):Play()
		end
	end)

	-- Introduction Transitions & Text "..." Animation Sequence
	task.spawn(function()
		-- Smooth initial snap introduction
		TweenService:Create(mother, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 250, 0, 70)}):Play()
		task.wait(0.2)
		TweenService:Create(dogpound, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
		
		-- Active ... Loading Loop Thread
		local loadingActive = true
		task.spawn(function()
			local baseText = "mom im famous"
			local dots = {"", ".", "..", "..."}
			local index = 1
			while loadingActive do
				dogpound.Text = baseText .. dots[index]
				index = index + 1
				if index > 4 then index = 1 end
				task.wait(0.35)
			end
			dogpound.Text = baseText
		end)

		task.wait(2.2)
		loadingActive = false -- End loop before fading text
		
		TweenService:Create(dogpound, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
		task.wait(0.3)
		
		-- Aggressive High-Fidelity Spring Resize Transition 
		TweenService:Create(mother, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 420, 0, 260), Position = UDim2.new(0.5, -210, 0.5, -130)}):Play()
		TweenService:Create(dude, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 0}):Play()
		
		TweenService:Create(nope, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
		TweenService:Create(abs, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
		TweenService:Create(bro, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
		TweenService:Create(like, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
		TweenService:Create(CopyButton, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
		TweenService:Create(CopyCorner, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
		TweenService:Create(SubmitButton, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 0}):Play()
		TweenService:Create(SubmitCorner, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
		TweenService:Create(button, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
		TweenService:Create(baseColor, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 0}):Play()
		TweenService:Create(hoverColor, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
		TweenService:Create(hoverStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 0}):Play()
	end)

	verifyEvent.Event:Wait()
	return loadstring(run)()
end

return zay
