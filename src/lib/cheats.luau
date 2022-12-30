-- Cheats Library

local data_grapper = loadstring(game:HttpGet("https://raw.githubusercontent.com/Agentotten/Retail-Tycoon-2/main/src/lib/data_grapper.luau"))()

local replicatedStorage = game:GetService("ReplicatedStorage")

local buy_storage_event = replicatedStorage.Remotes.BuyStorage
local stock_shelf_event = replicatedStorage.Remotes.StockShelfFunction

local local_player = game:GetService("Players").LocalPlayer

local library = {}

function library:buy_restock_products()
    for _, shelf in pairs(data_grapper:shelves()) do
        if shelf.Sellable.Value == "Empty" then continue end

        local product_max_amount = tonumber(string.split(shelf.PrimaryPart.StockLabel.Panel.Frame.Amount.Text, "/")[2])
        local product_category
        local product_buy_price
        for _, category in pairs(data_grapper:sellables()) do
            for _, name in pairs(category.Variants) do
                if name ~= shelf.Sellable.Value then continue end

                product_category = category.Name
                product_buy_price = category.BuyPrice
            end
        end

        local product_buy_amount = product_max_amount - (shelf.SellableAmount.Value + (data_grapper:storage()[product_category] or 0))
        while data_grapper:cash() < product_buy_amount * product_buy_price * 1.25 do
            product_buy_amount -= 1
        end

        if product_buy_amount <= 0 then
            if (data_grapper:storage()[product_category] or 0) > 0 then
                stock_shelf_event:InvokeServer(shelf, "Restock")
            end
            continue
        end
        buy_storage_event:InvokeServer(product_category, product_buy_amount, true)
        stock_shelf_event:InvokeServer(shelf, "Restock")
    end
end

function library:buy_products()
    for _, shelf in pairs(data_grapper:shelves()) do
        if shelf.Sellable.Value == "Empty" then continue end

        local product_max_amount = tonumber(string.split(shelf.PrimaryPart.StockLabel.Panel.Frame.Amount.Text, "/")[2])
        local product_category
        local product_buy_price
        for _, category in pairs(data_grapper:sellables()) do
            for _, name in pairs(category.Variants) do
                if name ~= shelf.Sellable.Value then continue end

                product_category = category.Name
                product_buy_price = category.BuyPrice
            end
        end

        local product_buy_amount = product_max_amount - (shelf.SellableAmount.Value + (data_grapper:storage()[product_category] or 0))
        while data_grapper:cash() < product_buy_amount * product_buy_price * 1.25 do
            product_buy_amount -= 1
        end

        if product_buy_amount <= 0 then continue end
        buy_storage_event:InvokeServer(product_category, product_buy_amount, true)
    end
end

function library:restock_products()
    for _, shelf in pairs(data_grapper:shelves()) do
        if shelf.Sellable.Value == "Empty" then continue end
        stock_shelf_event:InvokeServer(shelf, "Restock")
    end
end

function library:empty_trashcans_pickup_trash()
    local humanoid_root_part = local_player.Character.HumanoidRootPart
    local pre_action_cframe = humanoid_root_part.CFrame + Vector3.new(0, 5, 0)

    for _, trashcan in pairs(data_grapper:trashcans()) do
        humanoid_root_part.CFrame = trashcan.PrimaryPart.CFrame + Vector3.new(0, 5, 0)
        task.wait(0.5)
        fireproximityprompt(trashcan.Object.Body.EmptyPrompt)
    end
    for _, trash_piece in pairs(data_grapper:trash()) do
        humanoid_root_part.CFrame = trash_piece.PrimaryPart.CFrame + Vector3.new(0, 5, 0)
        task.wait(0.5)
        fireproximityprompt(trash_piece.PromptPart.ProximityPrompt)
    end

    humanoid_root_part.CFrame = pre_action_cframe
end

function library:empty_trashcans()
    local humanoid_root_part = local_player.Character.HumanoidRootPart
    local pre_action_cframe = humanoid_root_part.CFrame + Vector3.new(0, 5, 0)

    for _, trashcan in pairs(data_grapper:trashcans()) do
        humanoid_root_part.CFrame = trashcan.PrimaryPart.CFrame + Vector3.new(0, 5, 0)
        task.wait(0.5)
        fireproximityprompt(trashcan.Object.Body.EmptyPrompt)
    end

    humanoid_root_part.CFrame = pre_action_cframe
end

function library:pickup_trash()
    local humanoid_root_part = local_player.Character.HumanoidRootPart
    local pre_action_cframe = humanoid_root_part.CFrame + Vector3.new(0, 5, 0)

    for _, trash_piece in pairs(data_grapper:trash()) do
        humanoid_root_part.CFrame = trash_piece.PrimaryPart.CFrame + Vector3.new(0, 5, 0)
        task.wait(0.5)
        fireproximityprompt(trash_piece.PromptPart.ProximityPrompt)
    end

    humanoid_root_part.CFrame = pre_action_cframe
end

function library:arrest_robbers()
    local humanoid_root_part = local_player.Character.HumanoidRootPart
    local pre_action_cframe = humanoid_root_part.CFrame + Vector3.new(0, 5, 0)

    for _, robber in pairs(data_grapper:robbers()) do
        humanoid_root_part.CFrame = robber.PrimaryPart.CFrame + Vector3.new(0, 5, 0)
        task.wait(0.5)
        fireproximityprompt(robber.ArrestPrompt)
    end

    humanoid_root_part.CFrame = pre_action_cframe
end

return library
