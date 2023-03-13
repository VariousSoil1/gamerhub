local DiscordLib = loadstring(game:HttpGet "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord")()
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local win;

if game.PlaceId == 155615604 then
    win = DiscordLib:Window("GamerHub Lite: Prison Life")
    local LocalPlayer = win:Server("LocalPlayer", "")
    local Guns = win:Server("Guns", "")
    local lpsec = LocalPlayer:Channel("LocalPlayer")
    local gsec = Guns:Channel("Guns")
    lpsec:Slider("Walkspeed", 16, 250, 16, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    lpsec:Slider("Jump power", 50, 450, 50, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    lpsec:Toggle("Heatseeker", false, function(v)
        getgenv().heatseeker = v
        while true do
            if not getgenv().heatseeker then return end
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23
            task.wait(0.3)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
            task.wait(0.3)
        end
    end)
    lpsec:Button("Fly", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/WxmvCLLH'),true))()
    end)
    gsec:Dropdown("Gun Modifier", {"M9", "Remington 870", "AK-47"}, function(v)
        if game.Players.LocalPlayer.Backpack:FindFirstChild(v) then
            getgenv().GunToModify = v

            local GunStates = game.Players.LocalPlayer.Backpack[getgenv().GunToModify].GunStates
            local GSMod = require(GunStates)
            
            GSMod.Damage = 10
            GSMod.FireRate = 0.00001
            GSMod.AutoFire = true
            GSMod.Spread = 0.000001
        elseif game.Players.LocalPlayer.Character:FindFirstChild(v) then
            getgenv().GunToModify = v

            local GunStates = game.Players.LocalPlayer.Character[getgenv().GunToModify].GunStates
            local GSMod = require(GunStates)
            
            GSMod.Damage = 10
            GSMod.FireRate = 0.00001
            GSMod.AutoFire = true
            GSMod.Spread = 0.000001
        else
            DiscordLib:Notification("Gun not found", "Are you sure you have the gun?", "Okay!")
        end
    end)
    lpsec:Button("Infinite Jump (one life)", function(v)
        local plr = game:GetService("Players").LocalPlayer
        for i,v in next, getgc() do 
            if type(v) == "function" and getfenv(v).script and getfenv(v).script == plr.Character.ClientInputHandler then 
                for i2,v2 in next, debug.getupvalues(v) do 
                    if type(v2) == "number" then 
                        debug.setupvalue(v, i2, math.huge)
                    end
                end
            end
        end
    end)
elseif game.PlaceId == 3956818381 then
    win = DiscordLib:Window("GamerHub Lite: Ninja Legends")
    local LocalPlayer = win:Server("LocalPlayer", "")
    local Autofarm = win:Server("Autofarm", "")
    local Islands = win:Server("Islands", "")
    local lpsec = LocalPlayer:Channel("LocalPlayer")
    local asec = Autofarm:Channel("Autofarm")
    local isec = Islands:Channel("Islands")

    lpsec:Slider("Walkspeed", 16, 250, 16, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    lpsec:Slider("Jump power", 50, 450, 50, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    lpsec:Toggle("Heatseeker", false, function(v)
        getgenv().heatseeker = v
        while true do
            if not getgenv().heatseeker then return end
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23
            task.wait(0.3)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
            task.wait(0.3)
        end
    end)
    asec:Toggle("Auto Swing", false, function(v)
        getgenv().autoswing = v
        while true do
            if not getgenv().autoswing then return end
            task.wait()
            local sword;
                
            for i,s in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if s:FindFirstChild("ninjitsuGain") then
                    sword = s
                end
            end
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(sword)
            game.Players.LocalPlayer.ninjaEvent:FireServer("swingKatana")
        end
    end)
    asec:Toggle("Auto Sell", false, function(v)
        getgenv().autosell = v
        while true do
            if not getgenv().autosell then return end
            workspace.sellAreaCircles.sellAreaCircle16.circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            task.wait()
            workspace.sellAreaCircles.sellAreaCircle16.circleInner.CFrame = CFrame.new(0, 0, 0)
            task.wait()
        end
    end)
    asec:Toggle("Auto Buy Swords", false, function(v)
        getgenv().autobuyswords = v
        while true do
            if not getgenv().autobuyswords then return end
            task.wait()
            game.Players.LocalPlayer.ninjaEvent:FireServer("buyAllSwords", "Inner Peace Island")
        end
    end)
    asec:Toggle("Auto Buy Belts", false, function(v)
        getgenv().autobuybelts = v
        while true do
            if not getgenv().autobuybelts then return end
            task.wait()
            game.Players.LocalPlayer.ninjaEvent:FireServer("buyAllBelts", "Inner Peace Island")
        end
    end)
    asec:Toggle("Auto Buy Ranks (limited because theres no easy way)", false, function(v)
        getgenv().autobuyranks = v
        local function getRank()
            return game.Players.LocalPlayer.leaderstats.Rank.Value
        end
        local rank = getRank()
        while true do
            if not getgenv().autobuyranks then return end
            task.wait()
            if rank == "Rookie" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Grasshopper"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Grasshopper" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Apprentice"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Apprentice" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Samurai"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Samurai" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Assassin"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Assassin" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Shadow"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Shadow" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Ninja"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Ninja" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Master Ninja"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Master Ninja" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Sensei"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Sensei" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Master Sensei"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Master Sensei" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Ninja Legend"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Ninja Legend" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Master Of Shadows"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Master of Shadows" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Immortal Assassin"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Immortal Assassin" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Eternity Hunter"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Eternity Hunter" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Shadow Legend"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Shadow Legend" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Dragon Warrior"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Dragon Warrior" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Dragon Master"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Dragon Master" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Chaos Sensei"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Chaos Sensei" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Chaos Legend"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Chaos Legend" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Master Of Elements"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Master Of Elements" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Elemental Legend"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Elemental Legend" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Ancient Battle Master"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Ancient Battle Master" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Ancient Battle Legend"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Ancient Battle Legend" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Legendary Shadow Duelist"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Legendary Shadow Duelist" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Master Legend Assassin"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Master Legend Assassin" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Mythic Shadowmaster"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Mythic Shadowmaster" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Legendary Shadowmaster"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Legendary Shadowmaster" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Awakened Scythemaster"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Awakened Scythemaster" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Awakened Scythe Legend"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Awakened Scythe Legend" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Master Legend Zephyr"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Master Legend Zephyr" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Golden Sun Shuriken Master"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Golden Sun Shuriken Master" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Golden Sun Shuriken Legend"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            elseif rank == "Golden Sun Shuriken Legend" then
                local args = {
                    [1] = "buyRank",
                    [2] = "Dark Sun Samurai Legend"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                rank = getRank()
            end
        end
    end)
    isec:Button("Unlock all islands", function()
        local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        for _,v in pairs(workspace.islandUnlockParts:GetChildren()) do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            task.wait()
        end
        task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
    end)
elseif game.PlaceId == 112420803 then
    win = DiscordLib:Window("GamerHub Lite: Kohl's Admin")
    local LocalPlayer = win:Server("LocalPlayer", "")
    local Admin = win:Server("Admin", "")
    local Helpful = win:Server("Helpful", "")
    local lpsec = LocalPlayer:Channel("LocalPlayer")
    local adsec = Admin:Channel("Admin")
    local hsec = Helpful:Channel("Helpful")

    lpsec:Slider("Walkspeed", 16, 250, 16, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    lpsec:Slider("Jump power", 50, 450, 50, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    lpsec:Toggle("Heatseeker", false, function(v)
        getgenv().heatseeker = v
        while true do
            if not getgenv().heatseeker then return end
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23
            task.wait(0.3)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
            task.wait(0.3)
        end
    end)
    adsec:Button("Obtain Admin", function()
        local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local check = {}
        for i,v in pairs(workspace.Terrain._Game.Admin.Pads:GetChildren()) do
            if v.Name == "Touch to get admin" then
                table.insert(check, v)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Head.CFrame
                task.wait(0.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                task.wait()
                break
            end
        end
        if #check == 0 then
            fireclickdetector(workspace.Terrain._Game.Admin.Regen.ClickDetector)
        end
    end)
    adsec:Toggle("Permanent Admin", false, function(v)
        getgenv().permanentadmin = v
        local hasadmin = false
        local check = {}
        while true do
            if not getgenv().permanentadmin then return end
            task.wait()
            local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            for i,v in pairs(workspace.Terrain._Game.Admin.Pads:GetChildren()) do
                if v.Name == game.Players.LocalPlayer.Name.."'s admin" then
                    hasadmin = true
                    break
                else
                    hasadmin = false
                end
            end
            if not hasadmin then
                for i,v in pairs(workspace.Terrain._Game.Admin.Pads:GetChildren()) do
                    if v.Name == "Touch to get admin" then
                        table.insert(check, v)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChild("Head").CFrame
                        task.wait(0.5)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                        task.wait()
                        break
                    end
                end
            elseif not hasadmin and #check == 0 then
                -- all pads taken
                fireclickdetector(workspace.Terrain._Game.Admin.Regen.ClickDetector)
            end
        end
    end)
    adsec:Textbox("Padban", "", true, function(v)
        for i = 1,100 do
            game.Players:Chat("dog "..v)
        end
        wait(3)
        game.Players:Chat("kill "..v)
        task.wait()
        fireclickdetector(workspace.Terrain._Game.Admin.Regen.ClickDetector)
    end)
    hsec:Button("Clear Logs", function()
        for i = 1, 100 do
            game.Players:Chat("ff Clearing logs...")
        end
    end)
    hsec:Toggle("Anti Abuse", false, function(v)
        getgenv().antiabuse = v
        game.RunService.RenderStepped:Connect(function()
            if getgenv().antiabuse then
                for i,v in pairs(game.Players:GetChildren()) do
                    v.Chatted:Connect(function(raw_msg)
                        local msg = raw_msg:lower()
                        local triggerWords = {
                            "punish",
                            "kill",
                            "blind",
                            "freeze",
                            "explode",
                            "jail",
                            "freeze",
                        }
                        local chattedWords = msg:split(" ")
        
                        local function contain(list, x)
                            for i,v in pairs(list) do
                                if v:lower() == x:lower() then
                                    return tostring(v)
                                end
                            end
                            return false
                        end
        
                        for i,v in pairs(chattedWords) do
                            local contains = contain(triggerWords, v)
                            if contains == "punish" or contains == "kill" or contains == "explode" then
                                game.Players:Chat("reset all")
                            elseif contains == "blind" then
                                game.Players:Chat("unblind all")
                            elseif contains == "freeze" then
                                game.Players:Chat("unfreeze all")
                            elseif contains == "jail" then
                                game.Players:Chat("clr")
                            end
                        end
                    end)
                end
            end
        end)
    end)
    hsec:Toggle("Anti Crash", false, function(v)
        getgenv().settings.anticrash = v
        game:GetService("RunService").RenderStepped:Connect(function()
            for _, Player in pairs(game.Players:GetChildren()) do
                if Player.Backpack:FindFirstChild("VampireVanquisher") or Player.Character:FindFirstChild("VampireVanquisher") and getgenv().settings.anticrash then
                    game.Players:Chat("removegear ".. Player.Name)
                    game.Players:Chat("refresh ".. Player.Name)
                end
            end
        end)
    end)
    hsec:Toggle("Anti Gear", false, function(v)
        game.RunService.RenderStepped:Connect(function()
            if getgenv().antiabuse then
                for i,v in pairs(game.Players:GetChildren()) do
                    v.Chatted:Connect(function(raw_msg)
                        local msg = raw_msg:lower()
                        local triggerWords = {
                            "gear",
                        }
                        local chattedWords = msg:split(" ")
        
                        local function contain(list, x)
                            for i,v in pairs(list) do
                                if v:lower() == x:lower() then
                                    return tostring(v)
                                end
                            end
                            return false
                        end
        
                        for i,v in pairs(chattedWords) do
                            local contains = contain(triggerWords, v)
                            if contains == "gear" then
                                game.Players:Chat("reset all")
                            end
                        end
                    end)
                end
            end
        end)
    end)
    lpsec:Toggle("Invincible to Obby", false, function(v)
        getgenv().invincibletoobby = v
        while true do
            if not getgenv().invincibletoobby then
                for i,v in pairs(workspace.Terrain._Game.Workspace.Obby:GetChildren()) do
                    v.CanTouch = true
                end
                return
            end
            task.wait()
            for i,v in pairs(workspace.Terrain._Game.Workspace.Obby:GetChildren()) do
                v.CanTouch = false
            end
        end
    end)
elseif game.PlaceId == 142823291 then
    win = DiscordLib:Window("GamerHub Lite: Murder Mystery 2")
    local LocalPlayer = win:Server("LocalPlayer", "")
    local Teams = win:Server("Teams", "")
    local lpsec = LocalPlayer:Channel("LocalPlayer")
    local tsec = Teams:Channel("Teams")

    lpsec:Slider("Walkspeed", 16, 250, 16, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    lpsec:Slider("Jump power", 50, 450, 50, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    lpsec:Toggle("Heatseeker", false, function(v)
        getgenv().heatseeker = v
        while true do
            if not getgenv().heatseeker then return end
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23
            task.wait(0.3)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
            task.wait(0.3)
        end
    end)
    
    tsec:Toggle("Team Notifier", false, function(v)
        getgenv().teamnotifier = v
        function getTeam(plr)
            local char = plr.Character or plr.CharacterAdded:Wait()
            if plr.Backpack:FindFirstChild("Knife") then
                return "murderer"
            elseif char:FindFirstChild("Knife") then
                return "murderer"
            elseif plr.Backpack:FindFirstChild("Gun") then
                return "sheriff"
            elseif char:FindFirstChild("Gun") then
                return "sheriff"
            end
        end
        local murdererfound = false
        local sherifffound = false
        game.RunService.RenderStepped:Connect(function()
            print(murdererfound)
            for i,v in pairs(game.Players:GetPlayers()) do
                if getTeam(v) == "murderer" and not murdererfound and getgenv().teamnotifier then
                    OrionLib:MakeNotification({
                        Name = "Murderer",
                        Content = v.Name.." is the murderer!",
                        Duration = 5,
                    })
                    murdererfound = true
                elseif getTeam(v) == "sheriff" and getgenv().teamnotifier and not sherifffound then
                    OrionLib:MakeNotification({
                        Name = "Sheriff",
                        Content = v.Name.." is the sheriff!",
                        Duration = 5,
                    })
                    sherifffound = true
                end
            end
        end)
    end)
    tsec:Toggle("ESP", false, function(v)
        getgenv().esp = v
        function getTeam(plr)
            local char = plr.Character or plr.CharacterAdded:Wait()
            if plr.Backpack:FindFirstChild("Knife") then
                return "murderer"
            elseif char:FindFirstChild("Knife") then
                return "murderer"
            elseif plr.Backpack:FindFirstChild("Gun") then
                return "sheriff"
            elseif char:FindFirstChild("Gun") then
                return "sheriff"
            end
        end
        game.RunService.RenderStepped:Connect(function()
            for i,v in pairs(game.Players:GetPlayers()) do
                if getgenv().esp then
                    if getTeam(v) == "murderer" then
                        local esp = Instance.new("Highlight", v.Character)
                        esp.FillColor = Color3.new(255, 0, 0)
                        esp.FillTransparency = 0
                        esp.OutlineColor = Color3.new(0, 0, 0)
                        esp.OutlineTransparency = 0
                    elseif getTeam(v) == "sheriff" then
                        local esp = Instance.new("Highlight", v.Character)
                        esp.FillColor = Color3.new(0, 0, 255)
                        esp.FillTransparency = 0
                        esp.OutlineColor = Color3.new(0, 0, 0)
                        esp.OutlineTransparency = 0
                    elseif workspace:FindFirstChild("GrabGun") then
                        local esp = Instance.new("Highlight", workspace["GrabGun"])
                        esp.FillColor = Color3.new(255, 255, 255)
                        esp.FillTransparency = 0
                        esp.OutlineColor = Color3.new(0, 0, 0)
                        esp.OutlineTransparency = 0
                    else
                        local esp = Instance.new("Highlight", v.Character)
                        esp.FillColor = Color3.new(0, 255, 0)
                        esp.FillTransparency = 0
                        esp.OutlineColor = Color3.new(0, 0, 0)
                        esp.OutlineTransparency = 0
                    end
                end
            end
        end)
    end)
    tsec:Button("Grab Gun", false, function()
        for i,v in pairs(workspace:GetChildren()) do
            if v.Name == "GrabGun" then
                local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                task.wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = v.CFrame
                task.wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                task.wait()
            end
        end
    end)
elseif game.PlaceId == 6839171747 then
    win = DiscordLib:Window("GamerHub Lite: DOORS")
    local LocalPlayer = win:Server("LocalPlayer", "")
    local Utilities = win:Server("Utilities", "")
    local lpsec = LocalPlayer:Channel("LocalPlayer")
    local usec = Utilities:Channel("Utilities")

    lpsec:Slider("Walkspeed", 16, 21, 16, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    lpsec:Toggle("Heatseeker", false, function(v)
        getgenv().heatseeker = v
        getgenv().seekspawned = false
        while true do
            if not getgenv().heatseeker then return end
            task.wait()
            if workspace:FindFirstChild("SeekMoving") then
                getgenv().seekspawned = true
            else
                getgenv().seekspawned = false
            end
            if getgenv().seekspawned then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 21
            else
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 21
                task.wait(0.3)
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                task.wait(0.3)
            end
        end
    end)
    usec:Toggle("Monster Notifier", false, function(v)
        getgenv().monsternotifier = v
        local rushspawned = false
        local ambushspawned = false
        local seekspawned = false
        while true do
            if not getgenv().monsternotifier then return end
            task.wait()
            if workspace:FindFirstChild("RushMoving") and not rushspawned and workspace:FindFirstChild("RushMoving").RushNew.Position.Y > -20 then
                OrionLib:MakeNotification({
                    Name = "Notifier",
                    Content = "Rush has spawned, go hide. ",
                    Duration = 5,
                })
                repeat task.wait()
                    rushspawned = true
                until not workspace:FindFirstChild("RushMoving")
                rushspawned = false
            end
            if workspace:FindFirstChild("AmbushMoving") and not ambushspawned and workspace:FindFirstChild("AmbushMoving").RushNew.Position.Y > -20 then
                OrionLib:MakeNotification({
                    Name = "Notifier",
                    Content = "Ambush has spawned, go hide. ",
                    Duration = 5,
                })
                repeat task.wait()
                    ambushspawned = true
                until not workspace:FindFirstChild("AmbushMoving")
                ambushspawned = false
            end
            if workspace:FindFirstChild("SeekMoving") and not seekspawned then
                OrionLib:MakeNotification({
                    Name = "Notifier",
                    Content = "Seek has spawned, get ready to run. ",
                    Duration = 5,
                })
                repeat task.wait()
                    seekspawned = true
                until not workspace:FindFirstChild("SeekMoving")
                seekspawned = false
            end
        end
    end)
    usec:Toggle("Key ESP", false, function(v)
        getgenv().keyesp = v
        local LatestRoom = game.ReplicatedStorage.GameData:FindFirstChild("LatestRoom")
        while true do
            if not getgenv().keyesp then
                for i,v in pairs(workspace.CurrentRooms[LatestRoom.Value]:GetDescendants()) do
                    if v:IsA("Highlight") then
                        v:Destroy()
                    end
                end
                return
            end
            task.wait()
            for i,v in pairs(workspace.CurrentRooms[LatestRoom.Value]:GetDescendants()) do
                if v.Name == "Key" then
                    local esp = Instance.new("Highlight", v)
                    esp.FillColor = Color3.new(255, 0, 0)
                    esp.FillTransparency = 0
                    esp.OutlineColor = Color3.new(0, 0, 0)
                    esp.OutlineTransparency = 0
                end
            end
        end
    end)
    usec:Toggle("Get Room Number", false, function(v)
        getgenv().getroomnumber = v
        local LatestRoom = game.ReplicatedStorage.GameData:FindFirstChild("LatestRoom")
        LatestRoom.Changed:Connect(function()
            if getgenv().getroomnumber == true then
                OrionLib:MakeNotification({
                    Name = "LatestRoom.Changed",
                    Content = "New room number: "..LatestRoom.Value,
                    Duration = 5,
                })
            end
        end)
    end)
    lpsec:Button("Fullbright", function()
        pcall(function()
            local lighting = game:GetService("Lighting");
            lighting.Ambient = Color3.fromRGB(255, 255, 255);
            lighting.Brightness = 1;
            lighting.FogEnd = 1e10;
            for i, v in pairs(lighting:GetDescendants()) do
                if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then
                    v.Enabled = false;
                end;
            end;
            lighting.Changed:Connect(function()
                lighting.Ambient = Color3.fromRGB(255, 255, 255);
                lighting.Brightness = 1;
                lighting.FogEnd = 1e10;
            end);
            spawn(function()
                local character = game:GetService("Players").LocalPlayer.Character;
                while wait() do
                    repeat wait() until character ~= nil;
                    if not character.HumanoidRootPart:FindFirstChildWhichIsA("PointLight") then
                        local headlight = Instance.new("PointLight", character.HumanoidRootPart);
                        headlight.Brightness = 1;
                        headlight.Range = 60;
                    end;
                end;
            end);
        end)
    end)
    usec:Toggle("Instant Proximity Prompt", false, function(v)
        getgenv().instantpp = v
        game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(p)
            if getgenv().instantpp then
                if (fireproximityprompt) then
                    fireproximityprompt(p)
                else
                    DiscordLib:Notification("your executor", "bro get better executor", "Okay!")
                end
            end
        end)
    end)
    lpsec:Toggle("Noclip (recommended use at door 50 to go past the door)", false, function(v)
        getgenv().noclip = v
        while true do
            if not getgenv().noclip then
                for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
                return
            end
            task.wait()
            for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)
    usec:Toggle("Monster ESP", false, function(v)
        getgenv().monsteresp = v
        while true do
            if not getgenv().monsteresp then return end
            task.wait()
            if workspace:FindFirstChild("RushMoving") then
                local esp = Instance.new("Highlight", workspace["RushMoving"])
                esp.FillColor = Color3.new(0, 0, 0)
                esp.FillTransparency = 0
                esp.OutlineColor = Color3.new(255, 255, 255)
                esp.OutlineTransparency = 0
            elseif workspace:FindFirstChild("AmbushMoving") then
                local esp = Instance.new("Highlight", workspace["AmbushMoving"])
                esp.FillColor = Color3.new(0, 0, 0)
                esp.FillTransparency = 0
                esp.OutlineColor = Color3.new(0, 255, 0)
                esp.OutlineTransparency = 0
            elseif workspace:FindFirstChild("SeekMoving") then
                local esp = Instance.new("Highlight", workspace["SeekMoving"])
                esp.FillColor = Color3.new(0, 0, 0)
                esp.FillTransparency = 0
                esp.OutlineColor = Color3.new(255, 255, 255)
                esp.OutlineTransparency = 0
            end
        end
    end)
elseif game.PlaceId == 1962086868 then
    local reg = getreg()

    for i,v in next,reg do
        if type(v) == "function" then
            local info = getinfo(v)
            if info.name == "kick" then
                hookfunction(info.func, function(...) return nil end)
            end
        end
    end

    OrionLib:MakeNotification({
        Name = "Anticheat Disabler",
        Content = "Go",
        Duration = 5,
    })
    win = DiscordLib:Window("GamerHub Lite: Tower of Hell")
    local LocalPlayer = win:Server("LocalPlayer", "")
    local lpsec = LocalPlayer:Channel("LocalPlayer")

    lpsec:Slider("Walkspeed", 16, 250, 16, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    lpsec:Slider("Jump power", 50, 450, 50, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    lpsec:Toggle("Heatseeker", false, function(v)
        getgenv().heatseeker = v
        while true do
            if not getgenv().heatseeker then return end
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23
            task.wait(0.3)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
            task.wait(0.3)
        end
    end)
    lpsec:Toggle("Fly", false, function(v)
        getgenv().fly = v
        while true do
            if not getgenv().fly then return end
            task.wait()
        end
    end)
else
    OrionLib:MakeNotification({
        Name = "Game",
        Content = "Game not supported, loading standard version..",
        Duration = 5,
    })
    task.wait()
    win = DiscordLib:Window("GamerHub: Standard")
    local LocalPlayer = win:Server("LocalPlayer", "")
    local OtherScripts = win:Server("Other Scripts", "")
    local lpsec = LocalPlayer:Channel("LocalPlayer")
    local ossec = OtherScripts:Channel("Other Scripts")

    lpsec:Slider("Walkspeed", 16, 250, 16, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    lpsec:Slider("Jump power", 50, 450, 50, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    lpsec:Toggle("Heatseeker", false, function(v)
        getgenv().heatseeker = v
        while true do
            if not getgenv().heatseeker then return end
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23
            task.wait(0.3)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
            task.wait(0.3)
        end
    end)
    lpsec:Button("Fly", false, function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/WxmvCLLH'),true))()
    end)
    ossec:Button("Infinite Yield", false, function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
    end)
    ossec:Button("Fates Admin", false, function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua", true))()
    end)
end

OrionLib:MakeNotification({
    Name = "Script",
    Content = "Script loaded successfully. ",
    Duration = 5,
})

OrionLib:Init()