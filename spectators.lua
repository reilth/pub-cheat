        local SpectatorsList = Instance.new("ScreenGui")
		local Spectators = Instance.new("Frame")
		local Container = Instance.new("Frame")
		local UIPadding = Instance.new("UIPadding")
		local Text = Instance.new("TextLabel")
		local Players = Instance.new("TextLabel")
		local Background = Instance.new("Frame")
		local UIGradient = Instance.new("UIGradient")
		local Color = Instance.new("Frame")
		local UIGradient_2 = Instance.new("UIGradient")

		SpectatorsList.Parent = game.CoreGui
		SpectatorsList.Name = "SpectatorsList"
		SpectatorsList.Enabled = true

		Spectators.Name = "Spectators"
		Spectators.Parent = SpectatorsList
		Spectators.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Spectators.BackgroundTransparency = 1.000
		Spectators.BorderColor3 = Color3.fromRGB(30, 115, 255)
		Spectators.Position = UDim2.new(0, 1, 0.400000006, 49)
		Spectators.Size = UDim2.new(0, 200, 0, 20)

		Container.Name = "Container"
		Container.Parent = Spectators
		Container.BackgroundTransparency = 1.000
		Container.BorderSizePixel = 0
		Container.Position = UDim2.new(0, 0, 0, 4)
		Container.Size = UDim2.new(0, 200, 0, 20)
		Container.ZIndex = 3

		UIPadding.Parent = Container
		UIPadding.PaddingLeft = UDim.new(0, 4)

		Text.Name = "Text"
		Text.Parent = Container
		Text.BackgroundTransparency = 1.000
		Text.Position = UDim2.new(0, 0, 0, -3)
		Text.Size = UDim2.new(0, 200, 0, 20)
		Text.ZIndex = 4
		Text.Font = Enum.Font.Code
		Text.Text = "spectators"
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.TextSize = 14
		Text.TextStrokeTransparency = 0.000

		Players.Name = "Players"
		Players.Parent = Container
		Players.BackgroundTransparency = 1.000
		Players.Position = UDim2.new(0.0196080022, 0, 1.44285719, 0)
		Players.Size = UDim2.new(0, 200, 0, 20)
		Players.ZIndex = 4
		Players.Font = Enum.Font.Code
		Players.Text = "ur mom's name"
		Players.TextColor3 = Color3.fromRGB(255, 255, 255)
		Players.TextSize = 14.000
		Players.TextStrokeTransparency = 0.000
		Players.TextYAlignment = Enum.TextYAlignment.Top

		Background.Name = "Background"
		Background.Parent = Spectators
		Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0, 0)
		Background.BorderColor3 = Color3.fromRGB(40, 40, 40)
		Background.BorderSizePixel = 1
		Background.Size = UDim2.new(0, 200, 0, 20)


		function GetSpectators()
			local CurrentSpectators = ""
			for i,v in pairs(game.Players:GetChildren()) do 
				pcall(function()
					if v ~= game.Players.LocalPlayer then
						if not v.Character then 
							if (v.CameraCF.Value.p - game.Workspace.CurrentCamera.CFrame.p).Magnitude < 10 then 
								if CurrentSpectators == "" then
									CurrentSpectators = v.Name
								else
									CurrentSpectators = CurrentSpectators.. "\n" ..v.Name
								end
							end
						end
					end
				end)
			end
			return CurrentSpectators
		end

		spawn(function()
			while wait(0.2) do
				if SpectatorsList.Enabled then
					Players.Text = GetSpectators()
				end
			end
		end)

		local function SCUAM_fake_script()
			local script = Instance.new('LocalScript', Spectators)
			local gui = script.Parent
			gui.Draggable = false
			gui.Active = true
		end
		coroutine.wrap(SCUAM_fake_script)()
