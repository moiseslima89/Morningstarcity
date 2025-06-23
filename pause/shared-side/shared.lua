-----------------------------------------------------------------------------------------------------------------------------------------
-- BOXES
-----------------------------------------------------------------------------------------------------------------------------------------
Boxes = {
	{
		["Id"] = 1,
		["Name"] = "Caixa Karambit",
		["Index"] = "karambit_case",
		["Price"] = 50,
		["Discount"] = 50
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTENTBOXES
-----------------------------------------------------------------------------------------------------------------------------------------
ContentBoxes = {
	[1] = {
		{ ['Id'] = 1, ['Amount'] = 1, ['Index'] = itemIndex('WEAPON_DAGGER'), ['Item'] = 'WEAPON_DAGGER', ['Name'] = itemName('WEAPON_DAGGER')},
		{ ['Id'] = 2, ['Amount'] = 1, ['Index'] = itemIndex('WEAPON_KNIFE'), ['Item'] = 'WEAPON_KNIFE', ['Name'] = itemName('WEAPON_KNIFE')},	
		{ ['Id'] = 3, ['Amount'] = 1, ['Index'] = itemIndex('WEAPON_SWITCHBLADE'), ['Item'] = 'WEAPON_SWITCHBLADE', ['Name'] = itemName('WEAPON_SWITCHBLADE')},	
		{ ['Id'] = 4, ['Amount'] = 1, ['Index'] = itemIndex('WEAPON_MACHETE'), ['Item'] = 'WEAPON_MACHETE', ['Name'] = itemName('WEAPON_MACHETE')},	
		{ ['Id'] = 5, ['Amount'] = 1, ['Index'] = itemIndex('WEAPON_BOTTLE'), ['Item'] = 'WEAPON_BOTTLE', ['Name'] = itemName('WEAPON_BOTTLE')},	
		{ ['Id'] = 6, ['Amount'] = 1, ['Index'] = itemIndex('WEAPON_KARAMBIT'), ['Item'] = 'WEAPON_KARAMBIT', ['Name'] = itemName('WEAPON_KARAMBIT')}
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- WORKS
-----------------------------------------------------------------------------------------------------------------------------------------
Works = {
	["Delivery"] = "Entregador",
	["Transporter"] = "Transportador",
	["Lumberman"] = "Lenhador",
	["Milkman"] = "Leiteiro",
	["Trucker"] = "Caminhoneiro",
	["Fisherman"] = "Pescador",
	["Bus"] = "Motorista",
	["Tractor"] = "Tratorista",
	["Tows"] = "Guincho",
	["Postal"] = "Carteiro",
	["Hunting"] = "Caçador",
	["Minerman"] = "Minerador",
	["Taxi"] = "Taxista",
	["Garbageman"] = "Lixeiro"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPITENS
-----------------------------------------------------------------------------------------------------------------------------------------
ShopItens = {
	["chip"] = { ["Price"] = 238, ["Discount"] = 15.95 },
	["platepremium"] = { ["Price"] = 150, ["Discount"] = 0 },
	["newchars"] = { ["Price"] = 5400, ["Discount"] = 16.65 },
	["namechange"] = { ["Price"] = 2120, ["Discount"] = 5.65 },
	["backpackp"] = {["Price"] = 50, ["Discount"] = 0},
	["backpackm"] = {["Price"] = 75, ["Discount"] = 0},
	["backpackg"] = {["Price"] = 100, ["Discount"] = 0},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROLEITENS
-----------------------------------------------------------------------------------------------------------------------------------------
RoleItens = {
	["Free"] = {
		{ ["Item"] = "ciggypack", ["Amount"] = 1 },
		{ ["Item"] = "wallet", ["Amount"] = 1 },
		{ ["Item"] = "vape", ["Amount"] = 1 },
		{ ["Item"] = "repairkit01", ["Amount"] = 1 },
		{ ["Item"] = "cellphone", ["Amount"] = 1 },
		{ ["Item"] = "boombox", ["Amount"] = 1 },
		{ ["Item"] = "skateboard", ["Amount"] = 1 },
	},
	["Premium"] = {
		{ ["Item"] = "radio", ["Amount"] = 1 },
		{ ["Item"] = "hood", ["Amount"] = 1 },
		{ ["Item"] = "toolbox", ["Amount"] = 1 },
		{ ["Item"] = "nitro", ["Amount"] = 1 },
		{ ["Item"] = "lockpick", ["Amount"] = 1 },
		{ ["Item"] = "dollars", ["Amount"] = 20000 },
		{ ["Item"] = "jackham", ["Amount"] = 1 },
	}
}