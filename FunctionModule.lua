--This is my (https_KingPie's) function module for testing stuff, making edits, and executing useful stuff.
--Add this line at the top of every script using these functions: local FunctionModule = require(game.ServerScriptService:WaitForChild("FunctionModule"))
local module = {}

--***********
--Error detection
--***********

--Ex: FunctionModule.ServerError(script,"Error condition") if doing manually
function module.ServerError(ScriptName,Error)
	print("Error in " ..ScriptName ..": " ..Error)
end

--Ex: FunctionModule.ClientError(Player/LocalPlayer,script,"Error condition") if doing manually.  Use Player if already defined, use LocalPlayer if in a LocalScript.
function module.ClientError(Player,ScriptName,Error)
	print(Player.Name .. "caused an error in " ..ScriptName ..": " ..Error)
end

--***********
--Development
--***********

--Ex: FunctionModule.LeaderstatsCreate()
--[[I would call this with game.Players.PlayerAdded:Connect(function(Player)
		FunctionModule.LeaderstatsCreate(Player)
		optionally add this below
		FunctionModule.LeaderstatsCategory(Player,"Kills","IntValue")
	end)]]
function module.LeaderstatsCreate(Player)
	local leaderstats = Instance.new("Folder",Player)
	leaderstats.Name = "leaderstats"
	return leaderstats
end

--Ex: Above
function module.LeaderstatsCategory(Player,Name,Type,GroupId)
	--Player: Defines/Reference to the Player
	--Name: Leaderstat category name (ex: Rank, Kills, Deaths)
	--Type: "IntValue", "NumberValue", "StringValue"
	--GroupId: GroupId if you want to create a Rank leaderstat
	if Type ~= "IntValue" and Type ~= "NumberValue" and Type ~= "StringValue" then
	print("Non-functional type entered into LeaderstatsCategory") return end
	--Override if GroupId is entered in case Type is incorrect
	if GroupId then
		print("GroupId detected, assuming error and changing to a rank category")
		Type = "StringValue"
		Name = "Rank"
	end
	local Category = Instance.new(Type,Player.leaderstats)
	Category.Name = Name
	if GroupId then
		Category.Value = Player:GetRoleInGroup(GroupId)
	end
	return Category
end

--Ex: FunctionModule.NewInstance("StringValue","CollectiveStrings",game.Workspace)
function module.NewInstance(InstanceType,Name,Parent)
	local New = Instance.new(InstanceType)
	New.Name = Name
	New.Parent = Parent
	return New
end

--*This must be done in a LocalScript otherwise you're creating a blur that everyone will see*
--Ex: FunctionModule.LocalBlur(43)
function module.LocalBlur(Size)
	local New = Instance.new("BlurEffect")
	New.Parent = game.Lighting
	New.Name = "LocalBlur"
	if Size == nil then
		New.Size = 0
	elseif type(Size) ~= "number" then
		print("Error, input a valid number")
	else
		New.Size = Size
		return New
	end
end

--Ex: FunctionModule.NewAnimationSetup("NewIdle",game.Workspace,123456789)
function module.NewAnimationSetup(Name,Parent,AnimationId)
	local NewAnimation = Instance.new("Animation")
	NewAnimation.Name = Name
	NewAnimation.Parent = Parent
	NewAnimation.AnimationId = AnimationId
	return NewAnimation
end

--Ex: FunctionModule.WeldConstraint(script.Parent.Part1,game.Workspace.Part2)
function module.WeldConstraint(PartOne,PartTwo)
	local Weld = Instance.new("WeldConstraint")
	Weld.Part0 = PartOne
	Weld.Part1 = PartTwo
	Weld.Parent = PartOne
	return Weld
end

--If you want to print the results do print(unpack(FunctionModule.InPairsSearch("Children",game.Workspace))
--Ex: FunctionModule.InPairsSearch("Children",game.Workspace)
function module.InPairsSearch(Type,Location)
	--Type: Children or Descendants
	--Location: Where the search is taking place
	if Type ~= "Children" and Type ~= "Descendants" then
		print("Invalid Type of Search") return
	end
	local Array = {}
	if Type == "Descendants" then
		for _, Target in pairs(Location:GetDescendants()) do
			table.insert(Array,Target) 
		end
		return Array	
	end
	if Type == "Children" then
		for _,Target in pairs(Location:GetChildren()) do
			table.insert(Array,Target)
		end
		return Array 
	end
end

--FunctionModule.Clone(game.Workspace.https_KingPie,game.Workspace)
function module.Clone(Target,Parent)
	local Cloned = Target:Clone()
	Cloned.Parent = Parent
end

return module
