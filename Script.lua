--[[
    Script: FREE SCRIPTS
    Creador: JoseAngel_Blox
    Juego: Lucky Block (o cualquier juego de Roblox)
    Versión: 1.0
--]]

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "FreeScriptsGUI"
gui.Parent = player:WaitForChild("PlayerGui")

local bubble = Instance.new("ImageLabel")
bubble.Size = UDim2.new(0, 50, 0, 50)
bubble.Position = UDim2.new(0, 20, 0, 100)
bubble.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
bubble.BackgroundTransparency = 0.2
bubble.Image = "rbxassetid://3926305904"
bubble.Draggable = true
bubble.Parent = gui

local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(1, 0, 1, 0)
openButton.BackgroundTransparency = 1
openButton.Text = "⚙️"
openButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openButton.TextSize = 30
openButton.Parent = bubble

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 500)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
title.Text = "FREE SCRIPTS - JoseAngel_Blox"
title.TextColor3 = Color3.fromRGB(255, 200, 100)
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, 0, 0, 40)
tabBar.Position = UDim2.new(0, 0, 0, 40)
tabBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
tabBar.Parent = mainFrame

local mainTabBtn = Instance.new("TextButton")
mainTabBtn.Size = UDim2.new(0.33, 0, 1, 0)
mainTabBtn.Position = UDim2.new(0, 0, 0, 0)
mainTabBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
mainTabBtn.Text = "Main"
mainTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
mainTabBtn.Parent = tabBar

local playerTabBtn = Instance.new("TextButton")
playerTabBtn.Size = UDim2.new(0.33, 0, 1, 0)
playerTabBtn.Position = UDim2.new(0.33, 0, 0, 0)
playerTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
playerTabBtn.Text = "Player"
playerTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
playerTabBtn.Parent = tabBar

local settingsTabBtn = Instance.new("TextButton")
settingsTabBtn.Size = UDim2.new(0.34, 0, 1, 0)
settingsTabBtn.Position = UDim2.new(0.66, 0, 0, 0)
settingsTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
settingsTabBtn.Text = "Config"
settingsTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsTabBtn.Parent = tabBar

local container = Instance.new("ScrollingFrame")
container.Size = UDim2.new(1, 0, 1, -80)
container.Position = UDim2.new(0, 0, 0, 80)
container.BackgroundTransparency = 1
container.CanvasSize = UDim2.new(0, 0, 0, 300)
container.ScrollBarThickness = 6
container.Parent = mainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = container

-- ========================== MAIN TAB ==========================
local mainContainer = Instance.new("Frame")
mainContainer.Size = UDim2.new(1, 0, 0, 300)
mainContainer.BackgroundTransparency = 1
mainContainer.Visible = true
mainContainer.Parent = container

local UIListLayoutMain = Instance.new("UIListLayout")
UIListLayoutMain.Padding = UDim.new(0, 10)
UIListLayoutMain.Parent = mainContainer

local autoKickEnabled = false
local autoKickBtn = crearBoton(mainContainer, "🔴 Auto Kick: OFF", function()
    autoKickEnabled = not autoKickEnabled
    autoKickBtn.Text = autoKickEnabled and "🟢 Auto Kick: ON" or "🔴 Auto Kick: OFF"
    if autoKickEnabled then
        autoKickLoop()
    end
end)

local kickForce = 50
local kickForceLabel, kickForceSlider = crearSlider(mainContainer, "Fuerza de patada: " .. kickForce, 10, 200, kickForce, function(v)
    kickForce = math.floor(v)
    kickForceLabel.Text = "Fuerza de patada: " .. kickForce
end)

local autoCollectEnabled = false
local autoCollectBtn = crearBoton(mainContainer, "🔴 Auto Collect Money: OFF", function()
    autoCollectEnabled = not autoCollectEnabled
    autoCollectBtn.Text = autoCollectEnabled and "🟢 Auto Collect Money: ON" or "🔴 Auto Collect Money: OFF"
    if autoCollectEnabled then
        autoCollectLoop()
    end
end)

local autoClickEnabled = false
local autoClickBtn = crearBoton(mainContainer, "🔴 Auto Click x2: OFF", function()
    autoClickEnabled = not autoClickEnabled
    autoClickBtn.Text = autoClickEnabled and "🟢 Auto Click x2: ON" or "🔴 Auto Click x2: OFF"
    if autoClickEnabled then
        autoClickLoop()
    end
end)

-- ========================== PLAYER TAB ==========================
local playerContainer = Instance.new("Frame")
playerContainer.Size = UDim2.new(1, 0, 0, 400)
playerContainer.BackgroundTransparency = 1
playerContainer.Visible = false
playerContainer.Parent = container

local UIListLayoutPlayer = Instance.new("UIListLayout")
UIListLayoutPlayer.Padding = UDim.new(0, 10)
UIListLayoutPlayer.Parent = playerContainer

local flyEnabled = false
local flyBtn = crearBoton(playerContainer, "🔴 Fly: OFF", function()
    flyEnabled = not flyEnabled
    flyBtn.Text = flyEnabled and "🟢 Fly: ON" or "🔴 Fly: OFF"
    if flyEnabled then
        iniciarFly()
    else
        detenerFly()
    end
end)

local walkspeedVal = 16
local walkspeedLabel, walkspeedSlider = crearSlider(playerContainer, "Velocidad: " .. walkspeedVal, 16, 500, walkspeedVal, function(v)
    walkspeedVal = math.floor(v)
    walkspeedLabel.Text = "Velocidad: " .. walkspeedVal
    if enableMoveEnabled then
        player.Character.Humanoid.WalkSpeed = walkspeedVal
    end
end)

local enableMoveEnabled = false
local enableMoveBtn = crearBoton(playerContainer, "🔴 Enable Move: OFF", function()
    enableMoveEnabled = not enableMoveEnabled
    enableMoveBtn.Text = enableMoveEnabled and "🟢 Enable Move: ON" or "🔴 Enable Move: OFF"
    if enableMoveEnabled and player.Character and player.Character.Humanoid then
        player.Character.Humanoid.WalkSpeed = walkspeedVal
    elseif player.Character and player.Character.Humanoid then
        player.Character.Humanoid.WalkSpeed = 16
    end
end)

local invisibleEnabled = false
local invisibleBtn = crearBoton(playerContainer, "🔴 Invisible: OFF", function()
    invisibleEnabled = not invisibleEnabled
    invisibleBtn.Text = invisibleEnabled and "🟢 Invisible: ON" or "🔴 Invisible: OFF"
    if player.Character then
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = invisibleEnabled and 1 or 0
            end
        end
    end
end)

-- ========================== CONFIG TAB ==========================
local configContainer = Instance.new("Frame")
configContainer.Size = UDim2.new(1, 0, 0, 200)
configContainer.BackgroundTransparency = 1
configContainer.Visible = false
configContainer.Parent = container

local UIListLayoutConfig = Instance.new("UIListLayout")
UIListLayoutConfig.Padding = UDim.new(0, 10)
UIListLayoutConfig.Parent = configContainer

local optimizeBtn = crearBoton(configContainer, "🔧 Optimizar Juego", function()
    settings().Rendering.QualityLevel = 1
    game:GetService("Workspace").GlobalRenderingQuality = Enum.RenderingQualityLevel.Automatic
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 0.5
        end
    end
    game:GetService("Lighting").GlobalShadows = false
    game:GetService("Lighting").Technology = Enum.Technology.ShadowMap
    script.Parent:Destroy()
    print("Optimización aplicada correctamente")
end)

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(1, 0, 0, 30)
fpsLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
fpsLabel.Text = "FPS: Calculando..."
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.Parent = configContainer

mostrarFPS(fpsLabel)

-- ========================== FUNCIONES ==========================
function crearBoton(parent, texto, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    btn.Text = texto
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Parent = parent
    btn.MouseButton1Click:Connect(callback)
    return btn
end

function crearSlider(parent, texto, min, max, valor, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 60)
    frame.Position = UDim2.new(0, 10, 0, 0)
    frame.BackgroundTransparency = 1
    frame.Parent = parent

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Text = texto
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.Parent = frame

    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(1, 0, 0, 10)
    slider.Position = UDim2.new(0, 0, 0, 25)
    slider.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
    slider.Parent = frame

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 20, 0, 20)
    button.Position = UDim2.new((valor - min) / (max - min), -10, 0, -5)
    button.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    button.Text = ""
    button.AutoButtonColor = false
    button.Parent = slider

    local function updateSlider(input)
        local pos = math.clamp((input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
        local newVal = min + (max - min) * pos
        button.Position = UDim2.new(pos, -10, 0, -5)
        callback(newVal)
    end

    button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local connection
            connection = game:GetService("UserInputService").InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    updateSlider(input)
                end
            end)
            button.InputEnded:Connect(function()
                connection:Disconnect()
            end)
        end
    end)

    return label, slider
end

function autoKickLoop()
    spawn(function()
        while autoKickEnabled do
            local char = player.Character
            if char and char.Humanoid and char.Humanoid.RootPart then
                for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                    if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character.Humanoid and otherPlayer.Character.Humanoid.RootPart then
                        local distance = (char.Humanoid.RootPart.Position - otherPlayer.Character.Humanoid.RootPart.Position).Magnitude
                        if distance < 10 then
                            local force = Instance.new("BodyVelocity")
                            force.Velocity = (otherPlayer.Character.Humanoid.RootPart.Position - char.Humanoid.RootPart.Position).Unit * kickForce
                            force.MaxForce = Vector3.new(kickForce * 10, kickForce * 10, kickForce * 10)
                            force.Parent = otherPlayer.Character.Humanoid.RootPart
                            game:GetService("Debris"):AddItem(force, 0.5)
                        end
                    end
                end
            end
            wait(0.5)
        end
    end)
end

function autoCollectLoop()
    spawn(function()
        while autoCollectEnabled do
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Part") and v.Name:lower():find("money") or v.Name:lower():find("coin") then
                    if player.Character and player.Character.HumanoidRootPart then
                        local distance = (player.Character.HumanoidRootPart.Position - v.Position).Magnitude
                        if distance < 15 then
                            player.Character.HumanoidRootPart.CFrame = v.CFrame
                            wait(0.1)
                        end
                    end
                end
            end
            wait(0.3)
        end
    end)
end

function autoClickLoop()
    spawn(function()
        while autoClickEnabled do
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                local tool = player.Character:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                end
                for i = 1, 2 do
                    local args = { [1] = "Click", [2] = Vector3.new(0, 0, 0) }
                    game:GetService("ReplicatedStorage"):WaitForChild("ToolClick"):FireServer(unpack(args))
                end
            end
            wait(0.05)
        end
    end)
end

function iniciarFly()
    local torso = player.Character and player.Character:FindFirstChild("UpperTorso") or player.Character:FindFirstChild("Torso")
    if not torso then return end
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
    bodyVelocity.Parent = torso
    local flySpeed = 100
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if not flyEnabled then return end
        if input.KeyCode == Enum.KeyCode.Space then
            bodyVelocity.Velocity = Vector3.new(0, flySpeed, 0)
        elseif input.KeyCode == Enum.KeyCode.LeftShift then
            bodyVelocity.Velocity = Vector3.new(0, -flySpeed, 0)
        end
    end)
    player.Character.Humanoid.PlatformStand = true
end

function detenerFly()
    if player.Character then
        local bv = player.Character:FindFirstChildOfClass("BodyVelocity")
        if bv then bv:Destroy() end
        player.Character.Humanoid.PlatformStand = false
    end
end

function mostrarFPS(label)
    local frames = 0
    local lastTime = tick()
    game:GetService("RunService").RenderStepped:Connect(function()
        frames = frames + 1
        local currentTime = tick()
        if currentTime - lastTime >= 1 then
            local fps = frames
            label.Text = "FPS: " .. fps
            frames = 0
            lastTime = currentTime
        end
    end)
end

-- ========================== CAMBIO DE TABS ==========================
mainTabBtn.MouseButton1Click:Connect(function()
    mainContainer.Visible = true
    playerContainer.Visible = false
    configContainer.Visible = false
    mainTabBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    playerTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    settingsTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
end)

playerTabBtn.MouseButton1Click:Connect(function()
    mainContainer.Visible = false
    playerContainer.Visible = true
    configContainer.Visible = false
    mainTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    playerTabBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    settingsTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
end)

settingsTabBtn.MouseButton1Click:Connect(function()
    mainContainer.Visible = false
    playerContainer.Visible = false
    configContainer.Visible = true
    mainTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    playerTabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    settingsTabBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
end)

openButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Ajustes de tamaño del contenedor
container.CanvasSize = UDim2.new(0, 0, 0, 450)
