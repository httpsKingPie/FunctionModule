Here's a list of all functions in the FunctionModule with an example of how each might be used.

**_Error Detection_**

**Server Error**

 Use this as:
 ```
 FunctionModule.ServerError(script.Name,"Error condition")
 ```

ServerError is used when bug testing a script.  Put this as a condition and can you check the output.  This can give you more detailed output, especially if you have several of these in various scripts.  

An example of this in use is:

```
--This script's name is KingPieCheck
if game.Workspace.https_KingPie then
	print("All good!")
else
	Function Module.ServerError(script.Name,"https_KingPie is not loaded")
end
```
 
The expected output, if my player is not present, would be "Error in KingPieCheck: https_KingPie is not loaded"
 
**Client Error**

Use this as:
```
FunctionModule.ClientError(Player/LocalPlayer,script.name,"Error condition")
```

Use Player/plr/Plr or whatever variant you like if this is being used in a script where Player is already defined as that variable.  Use LocalPlayer if this is being used in a LocalScript.

ClientError is used similarly to ServerError, but you would use this whenever the client messes something up.

An example of this in use is:
```
--The script is a LocalScript and the script's name is DonateMoney and is parented to DonateValue, a NumberValue
local DonateValue = script.Parent
if DonateValue.Value <= 0 then
	print("All good")
elseif DonateValue.Value >0 or DonateValue.Value == nil then
	FunctionModule.ClientError(LocalPlayer,script.Name,"Tried to donate a negative or nil amount"
end
```
 
The expected output, if my player donated a negative or nil amount, would be "https_KingPie caused an error in DonateMoney: Tried to donate a negative or nil amount"

**_Development_**

**Create Leaderstats**

Use this as:
```
FunctionModule.LeaderstatsCreate()
```

This creates leaderstats, simple enough.

An example of this in use is:

```
game.Players.PlayerAdded:Connect(function(Player)
	FunctionModule.LeaderstatsCreate(Player)
end)
```

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
