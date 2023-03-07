local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window

if game.PlaceId == 155615604 then
    currentgame = "Prison Life"
    Window = OrionLib:MakeWindow({
        Name = "GamerHub Private: Prison Life",
        HidePremium = true,
    })
    local LocalPlayer = Window:MakeTab({
        Name = "LocalPlayer",
        PremiumOnly = false,
    })
    local lpsec = LocalPlayer:AddSection({
        Name = "LocalPlayer",
    })
    local Guns = Window:MakeTab({
        Name = "Guns",
        PremiumOnly = false,
    })
    local gunsec = Guns:AddSection({
        Name = "Guns",
    })
    local Teleports = Window:MakeTab({
        Name = "Teleports",
        PremiumOnly = false,
    })
    local tsec = Teleports:AddSection({
        Name = "Teleports",
    })
    lpsec:AddSlider({
        Name = "Walkspeed",
        Min = 16,
        Max = 250,
        Default = 16,
        Increment = 1,
        Callback = function(v)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
        end
    })
    lpsec:AddSlider({
        Name = "Jump Power",
        Min = 50,
        Max = 450,
        Default = 50,
        Increment = 1,
        Callback = function(v)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
        end
    })
    lpsec:AddButton({
        Name = "Fly",
        Callback = function()
            loadstring(game:HttpGet(('https://pastebin.com/raw/WxmvCLLH'),true))()
        end
    })
    lpsec:AddButton({
        Name = "Infinite Stamina (one life)",
        Callback = function()
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
        end
    })
    gunsec:AddDropdown({
        Name = "Gun Modifier",
        Options = {"M9", "Remington 870", "AK-47"},
        Callback = function(v)
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
                OrionLib:MakeNotification({
                    Name = "Gun not found",
                    Content = "Gun not found, are you sure you have the gun? ",
                    Time = 5,
                })
            end
        end
    })
    tsec:AddDropdown({
        Name = "Map Teleports",
        Options = {"Crim Base", "Armory", "Prison", "Cellblock", "Cafeteria", "Yard Tower"},
        Callback = function(v)
            if v == "Crim Base" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-918.544556, 94.1287613, 2063.15845)
            elseif v == "Armory" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(835.044556, 99.9899826, 2287.9502)
            elseif v == "Prison" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(908.282776, 99.9899826, 2385.41724)
            elseif v == "Cellblock" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.884949, 99.9899673, 2483.86914)
            elseif v == "Cafeteria" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918.164062, 99.9899368, 2331.34424)
            elseif v  == "Yard Tower" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(824.433472, 130.039902, 2586.67554)
            end
        end
    })
    OrionLib:Init()
elseif game.PlaceId == 3956818381 then
    OrionLib:Init()
    Window = OrionLib:MakeWindow({
        Name = "GamerHub Private: Ninja Legends",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "gamerhubninjalegends",
    })
    local LocalPlayer = Window:MakeTab({
        Name = "LocalPlayer",
        PremiumOnly = false,
    })
    local lpsec = LocalPlayer:AddSection({
        Name = "LocalPlayer",
    })
    local Autofarm = Window:MakeTab({
        Name = "Autofarm",
        PremiumOnly = false,
    })
    local afsec = Autofarm:AddSection({
        Name = "Autofarm",
    })
    local Islands = Window:MakeTab({
        Name = "Islands",
        PremiumOnly = false,
    })
    local isec = Islands:AddSection({
        Name = "Islands",
    })
    lpsec:AddSlider({
        Name = "Walkspeed",
        Min = 16,
        Max = 250,
        Default = 16,
        Increment = 1,
        Callback = function(v)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
        end
    })
    lpsec:AddSlider({
        Name = "Jump Power",
        Min = 50,
        Max = 450,
        Default = 50,
        Increment = 1,
        Callback = function(v)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
        end
    })
    afsec:AddToggle({
        Name = "Auto Swing",
        Default = false,
        Save = true,
        Callback = function(v)
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
        end
    })
    afsec:AddToggle({
        Name = "Auto Sell",
        Default = false,
        Save = true,
        Callback = function(v)
            getgenv().autosell = v
            while true do
                if not getgenv().autosell then return end
                workspace.sellAreaCircles.sellAreaCircle16.circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                task.wait()
                workspace.sellAreaCircles.sellAreaCircle16.circleInner.CFrame = CFrame.new(0, 0, 0)
                task.wait()
            end
        end
    })
    afsec:AddToggle({
        Name = "Auto Buy Swords",
        Default = false,
        Save = true,
        Callback = function(v)
            getgenv().autobuyswords = v
            while true do
                if not getgenv().autobuyswords then return end
                task.wait()
                game.Players.LocalPlayer.ninjaEvent:FireServer("buyAllSwords", "Inner Peace Island")
            end
        end
    })
    afsec:AddToggle({
        Name = "Auto Buy Belts",
        Default = false,
        Save = true,
        Callback = function(v)
            getgenv().autobuybelts = v
            while true do
                if not getgenv().autobuybelts then return end
                task.wait()
                game.Players.LocalPlayer.ninjaEvent:FireServer("buyAllBelts", "Inner Peace Island")
            end
        end
    })
    afsec:AddToggle({
        Name = "Auto Buy Ranks",
        Default = false,
        Save = true,
        Callback = function(v)
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
        end
    })
    isec:AddButton({
        Name = "Unlock all islands",
        Callback = function()
            local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            for _,v in pairs(workspace.islandUnlockParts:GetChildren()) do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                task.wait()
            end
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
        end
    })
elseif game.PlaceId == 2214661900 then
    OrionLib:Init()
    Library = OrionLib:MakeWindow({
        Name = "GamerHub Private: Survive in Area 51",
        HidePremium = false,
        SaveConfig = false,
    })
    local LocalPlayer = Library:MakeTab({
        Name = "LocalPlayer",
        PremiumOnly = false,
    })
    local Guns = Library:MakeTab({
        Name = "Guns",
        PremiumOnly = false,
    })
    local Teleports = Library:MakeTab({
        Name = "Teleports",
        PremiumOnly = false,
    })
    local lpsec = LocalPlayer:AddSection({
        Name = "LocalPlayer"
    })
    local gunsec = Guns:AddSection({
        Name = "Guns",
    })
    local tsec = Teleports:AddSection({
        Name = "Teleports",
    })
    lpsec:AddButton({
        Name = "Fullbright",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU", true))()
        end
    })
    lpsec:AddButton({
        Name = "Armor (+77 health)",
        Callback = function()
            local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Misc["Blizzard Armor"].Head.CFrame
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos
        end
    })
    gunsec:AddDropdown({
        Name = "Gun Modifier",
        Options = {"Beretta 87", "Desert Eagle", "Golden Eagle", "UZI", "SPAS-12", "M16A4", "LX1", "AK47", "LX2", "LX3", "Gun_Gun"},
        Callback = function(v)
            if game.Players.LocalPlayer.Backpack:FindFirstChild(v) then
                local setting = game.Players.LocalPlayer.Backpack[v].Setting
                local v1 = require(setting)
                
                v1.Auto = true
                v1.BaseDamage = math.huge
                v1.FireRate = 0.00001
                v1.ReloadTime = 0.00001
                v1.AmmoPerClip = math.huge
                v1.Spread = 0
                v1.CameraShakingEnabled = false
                v1.ExplosiveEnabled = true
                v1.MinigunEnabled = false
            elseif game.Players.LocalPlayer.Character:FindFirstChild(v) then
                local setting = game.Players.LocalPlayer.Character[v].Setting
                local v1 = require(setting)
                
                v1.Auto = true
                v1.BaseDamage = math.huge
                v1.FireRate = 0.00001
                v1.ReloadTime = 0.00001
                v1.AmmoPerClip = math.huge
                v1.Spread = 0
                v1.CameraShakingEnabled = false
                v1.ExplosiveEnabled = true
                v1.MinigunEnabled = false
            else
                OrionLib:MakeNotification({
                    Name = "Gun not found",
                    Content = "Gun not found, are you sure you have the gun? ",
                    Time = 5,
                })
            end
        end
    })
    gunsec:AddDropdown({
        Name = "Grab Gun",
        Options = {"Desert Eagle", "Golden Eagle", "UZI", "SPAS-12", "M16A4", "LX1", "AK47", "LX2", "LX3", "Gun_Gun"},
        Callback = function(v)
            local folder = workspace:FindFirstChild("Misc")
            if folder then
                if v == "Desert Eagle" then
                    local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    local tpto = folder:FindFirstChild("Desert Eagle - FREE").Head.CFrame
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tpto
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                    task.wait()
                elseif v == "Golden Eagle" then
                    local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    local tpto = folder:FindFirstChild("Golden Eagle - 100 Cell").Head.CFrame
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tpto
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                    task.wait()
                elseif v == "UZI" then
                    local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    local tpto = folder:FindFirstChild("UZI - 200 Cell").Head.CFrame
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tpto
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                    task.wait()
                elseif v == "SPAS-12" then
                    local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    local tpto = folder:FindFirstChild("SPAS-12 - 600 Cell").Head.CFrame
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tpto
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                    task.wait()
                elseif v == "M16A4" then
                    local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    local tpto = folder:FindFirstChild("M16A4 - 1000 Cell").Head.CFrame
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tpto
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                    task.wait()
                elseif v == "LX1" then
                    local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    local tpto = folder:FindFirstChild("LX1 - 1200 Cell").Head.CFrame
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tpto
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                    task.wait()
                elseif v == "AK47" then
                    local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    local tpto = folder:FindFirstChild("AK47 - 2000 Cell").Head.CFrame
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tpto
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                    task.wait()
                elseif v == "LX2" then
                    local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    local tpto = folder:FindFirstChild("LX2 - 3000 Cell").Head.CFrame
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tpto
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                    task.wait()
                elseif v == "LX3" then
                    local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    local tpto = folder:FindFirstChild("LX3 - 5000 Cell").Head.CFrame
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tpto
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                    task.wait()
                elseif v == "Gun_Gun" then
                    local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    local tpto = folder:FindFirstChild("Gun_Gun - 55555 Cell").Head.CFrame
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tpto
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                    task.wait()
                end
            end
        end
    })
    tsec:AddDropdown({
        Name = "Map Teleports",
        Options = {"Portal Room", "Gun Shop", "Mineshaft", "Sewer", "Incinerator"},
        Callback = function(v)
            if v == "Portal Room" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-113.348618, 981.999817, 849.437195)
            elseif v == "Gun Shop" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(592.836731, 1150.99963, 667.761841)
            elseif v == "Mineshaft" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-473.271606, 922.000916, 762.276611)
            elseif v == "Sewer" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-405.092316, 916.099915, -56.6980629)
            elseif v == "Incinerator" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-319.12326, 1061.99719, 1160.09143)
            end
        end
    })
elseif game.PlaceId == 112420803 then
    Window = OrionLib:MakeWindow({
        Name = "GamerHub Private: Kohl's Admin",
        HidePremium = true,
        SaveConfig = true,
        ConfigFolder = "gamerhubkohlsadmin",
    })
    local LocalPlayer = Window:MakeTab({
        Name = "LocalPlayer",
        PremiumOnly = false,
    })
    local Admin = Window:MakeTab({
        Name = "Admin",
        PremiumOnly = false,
    })
    local Teleports = Window:MakeTab({
        Name = "Teleports",
        PremiumOnly = false,
    })
    local Helpful = Window:MakeTab({
        Name = "Helpful",
        PremiumOnly = false,
    })
    local lpsec = LocalPlayer:AddSection({
        Name = "LocalPlayer",
    })
    local adsec = Admin:AddSection({
        Name = "Admin",
    })
    local tsec = Teleports:AddSection({
        Name = "Teleports",
    })
    local hfsec = Helpful:AddSection({
        Name = "Helpful",
    })
    lpsec:AddSlider({
        Name = "Walkspeed",
        Min = 16,
        Max = 250,
        Default = 16,
        Increment = 1,
        Callback = function(v)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
        end
    })
    lpsec:AddSlider({
        Name = "Jump Power",
        Min = 50,
        Max = 450,
        Default = 50,
        Increment = 1,
        Callback = function(v)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
        end
    })
    lpsec:AddButton({
        Name = "Fullbright",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU", true))()
        end
    })
    adsec:AddButton({
        Name = "Obtain Admin",
        Callback = function()
            local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            local check = {}
            for i,v in pairs(workspace.Terrain._Game.Admin.Pads:GetChildren()) do
                table.insert(check, v)
                if v.Name == "Touch to get admin" then
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
        end
    })
    adsec:AddToggle({
        Name = "Permanent Admin",
        Default = false,
        Save = true,
        Callback = function(v)
            getgenv().settings.permanentadmin = v
            local hasadmin = false
            local check = {}
            while true do
                if not getgenv().settings.permanentadmin then return end
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
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Head.CFrame
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
        end
    })
    hfsec:AddButton({
        Name = "Anti Abuse",
        Callback = function(v)
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
    })
    hfsec:AddToggle({
        Name = "Anti Crash (gear method)",
        Default = false,
        Save = true,
        Callback = function(v)
            getgenv().settings.anticrash = v
            game:GetService("RunService").RenderStepped:Connect(function()
                for _, Player in pairs(game.Players:GetChildren()) do
                    if Player.Backpack:FindFirstChild("VampireVanquisher") or Player.Character:FindFirstChild("VampireVanquisher") and getgenv().settings.anticrash then
                        game.Players:Chat("removegear ".. Player.Name)
                        game.Players:Chat("refresh ".. Player.Name)
                    end
                end
            end)
        end
    })
    tsec:AddDropdown({
        Name = "Map Teleports",
        Options = {"Spawn", "House", "Btool Testing Area"},
        Callback = function(v)
            if v == "Spawn" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-37.6395874, 3.69999933, -26.0910339)
            elseif v == "House" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30.2189274, 8.22999954, 66.7299881)
            elseif v == "Btool Testing Area" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-74.4467545, 3.69999933, 2.33740544)
            end
        end
    })
    Admin:AddTextbox({
        Name = "Padban",
        Default = "",
        TextDisappear = false,
        Callback = function(v)
            for i = 1,100 do
                game.Players:Chat("dog "..v)
            end
            wait(3)
            game.Players:Chat("kill "..v)
            task.wait()
            fireclickdetector(workspace.Terrain._Game.Admin.Regen.ClickDetector)
        end
    })
    OrionLib:Init()
elseif game.PlaceId == 142823291 then
    OrionLib:Init()
    Window = OrionLib:MakeWindow({
        Name = "GamerHub Private: Murder Mystery 2",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "gamerhubmm2",
    })
    local LocalPlayer = Window:MakeTab({
        Name = "LocalPlayer",
        PremiumOnly = false,
    })
    local Teams = Window:MakeTab({
        Name = "Teams",
        PremiumOnly = false,
    })
    local lpsec = LocalPlayer:AddSection({
        Name = "LocalPlayer",
    })
    local teamsec = Teams:AddSection({
        Name = "Teams",
    })
    lpsec:AddSlider({
        Name = "Walkspeed",
        Min = 16,
        Max = 250,
        Default = 16,
        Increment = 1,
        Callback = function(v)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
        end
    })
    lpsec:AddSlider({
        Name = "Jump Power",
        Min = 50,
        Max = 450,
        Default = 50,
        Increment = 1,
        Callback = function(v)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
        end
    })
    lpsec:AddToggle({
        Name = "ESP",
        Default = false,
        Save = true,
        Callback = function(v)
            getgenv().settings.esp = v
            savesettings()
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
                            esp.FillColor = Color3.new(0, 255, 0)
                            esp.FillTransparency = 0
                            esp.OutlineColor = Color3.new(0, 0, 0)
                            esp.OutlineTransparency = 0
                        end
                    end
                end
            end)
        end
    })
    teamsec:AddButton({
        Name = "Kill all (murderer)",
        Callback = function()
            local check = false
            -- check if murd or not
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Knife") then
                -- has knife
                check = true
            elseif game.Players.LocalPlayer.Character:FindFirstChild("Knife") then
                check = true
            else
                check = false
                OrionLib:MakeNotification({
                    OrionLib:MakeNotification({
                        Name = "Wrong Team",
                        Content = "You're on the wrong team. ",
                        Time = 5,
                    })
                })
            end
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    repeat
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Knife"))
                    until v.Character.Humanoid.Health == 0 or not v.Character:FindFirstChild("Humanoid")
                end
            end
        end
    })
    lpsec:AddButton({
        Name = "Fly",
        Callback = function()
            loadstring(game:HttpGet(('https://pastebin.com/raw/WxmvCLLH'),true))()
        end
    })
    teamsec:AddToggle({
        Name = "Team Notifier",
        Default = false,
        Save = true,
        Callback = function(v)
            getgenv().settings.teamnotifier = v
            savesettings()
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
                for i,v in pairs(game.Players:GetPlayers()) do
                    if getTeam(v) == "murderer" and not mudererfound and getgenv().settings.teamnotifier then
                        OrionLib:MakeNotification({
                            Name = "Murderer",
                            Content = v.Name.." is the murderer!",
                            Duration = 5,
                        })
                        murdererfound = true
                    elseif getTeam(v) == "sheriff" and getgenv().settings.teamnotifier and not sherifffound then
                        OrionLib:MakeNotification({
                            Name = "Sheriff",
                            Content = v.Name.." is the sheriff!",
                            Duration = 5,
                        })
                        sherifffound = true
                    end
                end
            end)
            local mt = getrawmetatable(game)
            setreadonly(mt, false)
            local namecall = mt.__namecall

            mt.__namecall = newcclosure(function(self, ...)
                local method = getnamecallmethod()
                local args = {...}

                if tostring(method) == "InvokeServer" and tostring(self) == "GetChance" and getgenv().teamnotifier then
                    murdererfound = false
                    sherifffound = false
                end

                return namecall(self, table.unpack(args))
            end)
        end
    })
else
    Window = OrionLib:MakeWindow({
        Name = "GamerHub: Standard",
        HidePremium = true,
    })
    local LocalPlayer = Window:MakeTab({
        Name = "LocalPlayer",
        PremiumOnly = false,
    })
    local Scripts = Window:MakeTab({
        Name = "Scripts",
        PremiumOnly = false,
    })
    local lpsec = LocalPlayer:AddSection({
        Name = "LocalPlayer",
    })
    local ssec = Scripts:AddSection({
        Name = "Scripts",
    })
    lpsec:AddSlider({
        Name = "Walkspeed",
        Min = 16,
        Max = 250,
        Default = 16,
        Increment = 1,
        Callback = function(v)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
        end
    })
    lpsec:AddSlider({
        Name = "Jump power",
        Min = 50,
        Max = 450,
        Default = 50,
        Incrememt = 1,
        Callback = function(v)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
        end
    })
    lpsec:AddToggle({
        Name = "Fly",
        Default = false,
        Callback = function(v)
            getgenv().flying = v
            local flyflag = true
            game.RunService.RenderStepped:Connect(function()
                if getgenv().flying and flyflag then
                    loadstring(game:HttpGet(('https://pastebin.com/raw/WxmvCLLH'),true))()
                    flyflag = false
                elseif not getgenv().flying and not flyflag then
                    local character = game.Players.LocalPlayer.Character
                    local oldpos = character.HumanoidRootPart.CFrame
                    if character:FindFirstChild("Humanoid") then
                        character["Humanoid"]:ChangeState(15)
                    end
                    character:ClearAllChildren()
                    local newcharacter = Instance.new("Model", workspace)
                    game.Players.LocalPlayer.Character = newcharacter
                    wait()
                    game.Players.LocalPlayer.Character = character
                    newcharacter:Destroy()
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                    flyflag = true
                end
            end)
        end
    })
end

OrionLib:MakeNotification({
    Name = "Loaded",
    Content = "Script successfully loaded",
})