Here's a list of all functions in the FunctionModule with an example of how each might be used.

**_Error Detection_**

**Server Error**

 Use this as:
 ```lua
 FunctionModule.ServerError(script.Name,"Error condition")
 ```

ServerError is used when bug testing a script.  Put this as a condition and can you check the output.  This can give you more detailed output, especially if you have several of these in various scripts.  

An example of this in use is:

```lua
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
```lua
FunctionModule.ClientError(Player/LocalPlayer,script.name,"Error condition")
```

Use Player/plr/Plr or whatever variant you like if this is being used in a script where Player is already defined as that variable.  Use LocalPlayer if this is being used in a LocalScript.

ClientError is used similarly to ServerError, but you would use this whenever the client messes something up.

An example of this in use is:
```lua
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
```lua
FunctionModule.LeaderstatsCreate(Player)
```

Use Player/plr/Plr or whatever variant you like if this is being used in a script where Player is already defined as that variable.

This creates leaderstats, simple enough.

An example of this in use is:

```lua
game.Players.PlayerAdded:Connect(function(Player)
	FunctionModule.LeaderstatsCreate(Player)
end)
```

**Create Leaderstats Category**

Use this as:
```lua
	FunctionModule.LeaderstatsCategory(Player,Name,Type,GroupId)
```

Just like in LeaderstatsCreate, Player is filled by whatever you've already defined as that variable.  Name is a string value of whatever you want the leaderstats category to be named like "KOs", "WOs", etc.  Type is a string value of either "IntValue", "NumberValue", or "StringValue" - this is what kind of value you want stored in the leaderstats category.  GroupId is used in case you are making a Leaderstat Category to display a Group's Rank.  Quick Note: If there is a GroupId inputted, the function will create a category for Rank i.e. Name = "Rank" and Type = "StringValue" because it will assume you meant to create a Group Rank Leaderstat Category.

An example of this in use is:

```lua
game.Players.PlayerAdded:Connect(function(Player)
	FunctionModule.LeaderstatsCreate(Player)
	FunctionModule.LeaderstatsCategory(Player,"KOs","NumberValue")
	FunctionModule.LeaderstatsCategory(Player,"WOs","NumberValue")
	FunctionModule.LeaderstatsCategory(Player,"Rank","StringValue",3514227)
end)
```

This would create leaderstats and create the categories: "KOs", "WOs", and "Rank" and would get a person's rank in the DevForum group

**Create Instance**

Use this as:
```lua
FunctonModule.NewInstance(InstanceType,Name,Parent)
```
InstanceType is the type of Instance you would like to create, ex: "Part", "Fire", "ScreenGui", etc.  Name is the name of the new instance.  Parent is whatever you want the new instance to be parented to.

Use this when you want a speedy way to quickly create a new instance, name it, and assign it a location all at once.

An example of this in use is:

```lua
FunctionModule.NewInstance("StringValue","PlayerName",game.Workspace)
```

This would create a new StringValue named "PlayerName" that is a child of game.Workspace.

**Create a Blur Effect**

Use this as:
```lua
FunctionModule.LocalBlur(Size)
```

Note: To create a blur that only one person can see, use this in a LocalScript.

Size is the Size property aka Intensity of the blur.

An example of this in use is:

```lua
FunctionModule.LocalBlur(43)
```

**Creating an Animation**

Use this as:
```lua
FunctionModule.NewAnimationSetup(Name,Parent,AnimationId)
```

Name is the name of the new animation instance.  Parent is whatever you want the new animation parented to.  AnimationId is whatever the AnimationId is (obvious I know haha).

An example of this in use is:
```lua
FunctionModule.NewAnimationSetup("NewIdle",game.Workspace,123456789)
```

This would create a new Animation in game.Workspace named "NewIdle" with the AnimationId 123456789

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