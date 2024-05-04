local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "SuperHub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--[[
Name = SuperHub - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = Super - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

local Tab = Window:MakeTab({
	Name = "All you need",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = sw23235e - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

local Section = Tab:AddSection({
	Name = "SuperHub"
})

--[[
Name = 23234w - The name of the section.
]]

Tab:AddButton({
	Name = "Aimbot",
	Callback = function()
        local teamCheck = true
        local fov = 150
        local smoothing = 1

        local RunService = game:GetService("RunService")

        local FOVring = Drawing.new("Circle")
        FOVring.Visible = true
        FOVring.Thickness = 1.5
        FOVring.Radius = fov
        FOVring.Transparency = 1
        FOVring.Color = Color3.fromRGB(255, 128, 128)
        FOVring.Position = workspace.CurrentCamera.ViewportSize/2

        local function getClosest(cframe)
           local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
   
           local target = nil
           local mag = math.huge
   
           for i,v in pairs(game.Players:GetPlayers()) do
             if v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v ~= game.Players.LocalPlayer and (v.Team ~= game.Players.LocalPlayer.Team or (not teamCheck)) then
                   local magBuf = (v.Character.Head.Position - ray:ClosestPoint(v.Character.Head.Position)).Magnitude
           
                   if magBuf < mag then
                       mag = magBuf
                       target = v
                   end
               end
           end
   
           return target
        end

        loop = RunService.RenderStepped:Connect(function()
           local UserInputService = game:GetService("UserInputService")
           local pressed = --[[UserInputService:IsKeyDown(Enum.KeyCode.E)]] UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) --Enum.UserInputType.MouseButton2
           local localPlay = game.Players.localPlayer.Character
           local cam = workspace.CurrentCamera
           local zz = workspace.CurrentCamera.ViewportSize/2
   
           if pressed then
               local Line = Drawing.new("Line")
               local curTar = getClosest(cam.CFrame)
               local ssHeadPoint = cam:WorldToScreenPoint(curTar.Character.Head.Position)
               ssHeadPoint = Vector2.new(ssHeadPoint.X, ssHeadPoint.Y)
               if (ssHeadPoint - zz).Magnitude < fov then
                   workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(cam.CFrame.Position, curTar.Character.Head.Position), smoothing)
               end
           end
   
           if UserInputService:IsKeyDown(Enum.KeyCode.Delete) then
               loop:Disconnect()
               FOVring:Remove()
           end
        end)
      		print("button pressed")
  	end    
})

--[[
Name = 23554453wdwas - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "ESP",
	Callback = function()
          loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
      		print("button pressed")
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

local Section = Tab:AddSection({
	Name = "Comming Soon!"
})

--[[
Name = <string> - The name of the section.
]]
OrionLib:Init()
