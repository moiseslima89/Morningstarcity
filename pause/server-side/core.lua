-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("pause", Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOME
-----------------------------------------------------------------------------------------------------------------------------------------
local Shopping = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOME
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Home()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local Passport = vRP.Passport(source)
        local Identity = vRP.Identity(Passport)
        local Account = vRP.Account(Identity.license)

        local Carousel = {}
        for Key,Value in pairs(ShopItens) do
            if Value.Discount > 0 then 
                table.insert(Carousel, { Price = Value.Price, id = #Carousel, Name = itemName(Key), Index = itemIndex(Key), Discount = Value.Discount })
            end
        end

        if #Carousel > 0 then
            table.sort(Carousel, function(a, b)
                return a.Discount > b.Discount
            end)
        end
        
        local Experiences = {}
        for Key,Value in pairs(Works) do
            table.insert(Experiences,{ Value, vRP.GetExperience(Passport,Key) })
        end
        local Shopping = vRP.Query("entitydata/GetData",{ dkey = "Shopping" })
        return {
            Information = {
                Passport = Passport,
                Name = Identity.name.." "..Identity.name2,
                Bank = Identity.bank,
                Phone = Identity.phone,
                Diamonds = Account.gems,
                Blood =  Sanguine(Identity.blood),
                Sex = Identity.sex
            },
            Medic = math.floor((Identity.medicplan - os.time()) / 86400),
            Premium = { Price = 0, Active = 0, Value = 0},
            Box = Boxes[math.random(#Boxes)],
            Shopping = Shopping[1] and json.decode(Shopping[1]["dvalue"]) or {},
            Carousel = Carousel,
            Experience = Experiences,
        } 
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.DiamondsList()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local DiamondsList = {}
        for Key,Value in pairs(ShopItens) do
            table.insert(DiamondsList,{
                Price = Value.Price,
                Amount = Value.Amount,
                Discount = Value.Discount,
                Description = itemDescription(Key),
                Index = itemIndex(Key),
                Name = itemName(Key)
            })
        end
        return DiamondsList
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.DiamondsBuy(Item,Amount)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local Identity = vRP.Identity(Passport)
        local Price = ShopItens[Item].Price
        local Discount = ShopItens[Item].Discount 
        local Value = (Price - (Price * Discount / 100))
        if (vRP.InventoryWeight(Passport) + itemWeight(Item) * Amount) <= vRP.GetWeight(Passport) then
            if vRP.PaymentGems(Passport,Value * Amount) then
                vRP.GenerateItem(Passport,Item,Amount,false)
                TriggerClientEvent("sounds:Private",source,"cash",0.1)
                local Result = vRP.Query("entitydata/GetData",{ dkey = "Shopping" })
                local Shopping = Result[1] and json.decode(Result[1]["dvalue"]) or {}
                table.insert(Shopping,{ Price = Value * Amount, Name = Identity.name.." "..Identity.name2.." Comprou "..itemName(Item), Index = itemIndex(Item), Amount = Amount, Discount = Discount })
                vRP.Query("entitydata/SetData",{ dkey = "Shopping", dvalue = json.encode(Shopping) })
                TriggerEvent("Discord","ShopPause","**Passaporte:** "..Passport.."\n**Item:** "..Amount.."x "..itemName(Item).."\n**Gemas:** "..parseInt(Value * Amount),3553599)
                return true
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
--Passse a cada minutos 
------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        Wait(60 * 1000) -- 1 minuto

        print("[PASS]: Verificando jogadores online...")

        for _, source in pairs(GetPlayers()) do
            local Passport = vRP.Passport(source)
            if Passport then
                TriggerEvent("pause:AddPoints", Passport, 1)
                print("[PASS]: +1 ponto para passaporte " .. Passport)
            else
                print("[PASS]: Não encontrou passaporte para source " .. source)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
local Rolepass = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function GetRolepass(Passport)
    if not Rolepass[Passport] then
        Rolepass[Passport] = vRP.UserData(Passport,"Rolepass")
    end
    return Rolepass[Passport]
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAUSE:ADDPOINTS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("pause:AddPoints")
AddEventHandler("pause:AddPoints",function(Passport,Amount)
    local Rolepass = GetRolepass(Passport)
    if not Rolepass["Points"] then
        Rolepass["Points"] = 0
    end
    Rolepass["Points"] = Rolepass["Points"] + math.min(Amount, (15000 - Rolepass["Points"]))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Rolepass[Passport] then
		vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Rolepass", dvalue = json.encode(Rolepass[Passport]) })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Rolepass()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local Premium = {}
        for Index,Value in pairs(RoleItens["Premium"]) do
            table.insert(Premium, { id = Index, Name = itemName(Value.Item), Index = itemIndex(Value.Item), Amount = Value.Amount, Description = itemDescription(Value.Item) })
        end
        local Free = {}
        for Index,Value in pairs(RoleItens["Free"]) do
            table.insert(Free, { id = Index, Name = itemName(Value.Item), Index = itemIndex(Value.Item), Amount = Value.Amount, Description = itemDescription(Value.Item) })
        end
        local now = os.time()
        local date = os.date("*t", now)
        local next_month_start = os.time({year = date.year, month = date.month + 1, day = 1, hour = 0, min = 0, sec = 0})
        local Finish = os.difftime(next_month_start, now)
        local Rolepass = GetRolepass(Passport)

        if not Rolepass["Finish"] or parseInt(Rolepass["Finish"]) <= now then
            Rolepass["Free"] = 0
            Rolepass["Premium"] = 0
            Rolepass["Points"] = 0
            Rolepass["Finish"] = now + Finish
            Rolepass["RolepassBuy"] = false
        end

        return {
            Active = Rolepass["RolepassBuy"],
            Total = parseInt(math.ceil(parseInt(Rolepass["Points"]) / 500) * 500),
            Points = parseInt(Rolepass["Points"]),
            AtualFree = parseInt(Rolepass["Free"]),
            AtualPremium = parseInt(Rolepass["Premium"]),
            Finish = parseInt(Finish),
            Premium = Premium,
            Free = Free,
        }
        
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.RolepassRescue(Type,Index)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local Item = RoleItens[Type][parseInt(Index)]["Item"]
        local Amount = RoleItens[Type][parseInt(Index)]["Amount"]
        if (vRP.InventoryWeight(Passport) + itemWeight(Item) * Amount) <= vRP.GetWeight(Passport) then
            TriggerClientEvent("sounds:Private",source,"finish",0.1)
            Rolepass[Passport][Type] = parseInt(Index)
            Rolepass[Passport]["Points"] = not Rolepass[Passport]["Points"] and 0 or Rolepass[Passport]["Points"] - 250            
            vRP.GenerateItem(Passport,Item,Amount,false) 
            TriggerEvent("Discord","RedeemPass","**Passaporte:** "..Passport.."\n**Item:** "..Amount.."x "..itemName(Item),3553599)
            return true
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.RolepassBuy()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        if vRP.PaymentGems(Passport,800) then
            local now = os.time()
            local date = os.date("*t", now)
            local Rolepass = GetRolepass(Passport)
            Rolepass["RolepassBuy"] = true
            vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Rolepass", dvalue = json.encode(Rolepass) })
            TriggerEvent("Discord","BuyPass","**Passaporte:** "..Passport,3553599)
            return true
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.OpenBoxes(Box)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local Price = Boxes[Box].Price
        local Discount = Boxes[Box].Discount 
        if vRP.PaymentGems(Passport,(Price - (Price * Discount / 100))) then
            return math.random(#ContentBoxes[Box])
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.PaymentBoxes(Box,Loot)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local Item = ContentBoxes[Box][Loot].Item
        local Amount = ContentBoxes[Box][Loot].Amount
        if (vRP.InventoryWeight(Passport) + itemWeight(Item) * Amount) <= vRP.GetWeight(Passport) then
            TriggerClientEvent("sounds:Private",source,"finish",0.1)
            vRP.GenerateItem(Passport,Item,Amount,false) 
            TriggerEvent("Discord","OpenBox","**Passaporte:** "..Passport.."\n**Item:** "..Amount.."x "..itemName(Item).."\n**Caixa:** "..Boxes[Box].Name,3553599)
            return true
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.PremiumRenew()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        return true
    end
end

