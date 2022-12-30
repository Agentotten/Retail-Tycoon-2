local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local Cheats = loadstring(game:HttpGet("https://raw.githubusercontent.com/Agentotten/Retail-Tycoon-2/main/src/lib/cheats.luau"))()
local DataGrapper = loadstring(game:HttpGet("https://raw.githubusercontent.com/Agentotten/Retail-Tycoon-2/main/src/lib/data_grapper.luau"))()

local RunService = game:GetService("RunService")

local LocalPlayer = game:GetService("Players").LocalPlayer

local Window = Rayfield:CreateWindow({
    Name = "Retail Tycoon 2",
    LoadingTitle = "Retail Tycoon 2",
    LoadingSubtitle = "By Agentotten#2610"
})

local StoreTab = Window:CreateTab("Store")

StoreTab:CreateSection("Macro Cheats")

StoreTab:CreateButton({
    Name = "Buy & Restock Products",
    Callback = function()
        Cheats:buy_restock_products()
    end
})

StoreTab:CreateButton({
    Name = "Empty Trashcans & Pickup Trash",
    Callback = function()
        Cheats:empty_trashcans_pickup_trash()
    end
})

StoreTab:CreateSection("Cheats")

StoreTab:CreateButton({
    Name = "Buy Products",
    Callback = function()
        Cheats:buy_products()
    end
})

StoreTab:CreateButton({
    Name = "Restock Products",
    Callback = function()
        Cheats:restock_products()
    end
})

StoreTab:CreateButton({
    Name = "Empty Trashcans",
    Callback = function()
        Cheats:empty_trashcans()
    end
})

StoreTab:CreateButton({
    Name = "Pickup Trash",
    Callback = function()
        Cheats:pickup_trash()
    end
})

StoreTab:CreateButton({
    Name = "Arrest Robbers",
    Callback = function()
        Cheats:arrest_robbers()
    end
})

local PlayerTab = Window:CreateTab("Player")

PlayerTab:CreateSection("Player")

PlayerTab:CreateButton({
    Name = "Anti AFK",
    Callback = function()
        Cheats:anti_afk()
        Rayfield:Notify({
            Title = "Anti AFK Enabled",
            Content = "This feature cannot be disabled."
        })
    end
})

PlayerTab:CreateSection("Character")

local noclip_enabled = false
PlayerTab:CreateToggle({
    Name = "Noclip",
    Callback = function(toggle_state)
        noclip_enabled = toggle_state
        if noclip_enabled == true then
            local noclip_loop
            noclip_loop = RunService.Stepped:Connect(function()
                if noclip_enabled == false then noclip_loop:Disconnect() end
                for _, basepart in pairs(LocalPlayer.Character:GetDescendants()) do
                    if basepart:IsA("BasePart") == false then continue end
                    basepart.CanCollide = false
                end
            end)
        end
    end
})

PlayerTab:CreateSection("Teleport")

PlayerTab:CreateButton({
    Name = "Teleport Home",
    Callback = function()
        LocalPlayer.Character.HumanoidRootPart.CFrame = DataGrapper:plot().Base.CFrame + Vector3.new(0, 5, 0)
    end
})

PlayerTab:CreateDropdown({
    Name = "Teleport To Plot",
    Options = {"Plot 1", "Plot 2", "Plot 3", "Plot 4", "Plot 5", "Plot 6"},
    CurrentOption = "",
    Callback = function(dropdown_option)
        local plot_name = string.split(dropdown_option, " ")
        LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.Plots[plot_name[1] .. "_" .. plot_name[2]].Base.CFrame + Vector3.new(0, 5, 0)
    end,
})
