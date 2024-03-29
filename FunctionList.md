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

**Creating a WeldConstraint**

Use this as:
```lua
FunctionModule.WeldConstraint(PartOne,PartTwo)
```

PartOne and PartTwo are the two parts that you want to Weld together.  The WeldConstraint will be parented to PartOne.

An example of this in use is:
```lua
FunctionModule.WeldConstraint(script.Parent.Part1,game.Workspace.Part2)
```

**Using for i,v in pairs do... aka Enhanced For Loop in a Shorthand Way**

Note #1: This is returns an array/table of the *values* not the index.  If you're trying to do something with the specific values, it might be better to do this by hand and enclose whatever you're doing in the actual loop.

Use this as:
```lua
FunctionModule.InPairsSearch(Type,Location)
```

Type is either "Children" or "Descendants".  Location is where you want to execute the loop.  For clarification:
```lua
FunctionModule.InPairsSearch("Children",game.Workspace)
```
is equivalent to:
```lua
for i,v in pairs(game.Workspace:GetChildren()) do
	--etc.
end
```

Note #2: If you want to print the results of the InPairsSearch/Enhanced For Loop use:

```lua
print(unpack(FunctionModule.InPairsSearch(Type,Location))
```

An example of this in use is:
```lua
game.Players.PlayerAdded:Connect(function(Player)
	local ListOfPlayers = FunctionModule.InPairsSearch("Children",game.Players)
	print("The players currently in the server are ".. unpack(ListOfPlayers))
end)
```

This would return the names of the players in the server every time someone joins the game.

**Clone Instance**

Use this as
```lua
FunctionModule.Clone(Target,Parent)
```

Target is the instance you are cloning.  Parent is the parent of the new cloned instance.

Use this when you want a speedy way to quickly clone a new instance and parent it all in one step.

An example of this in use:
```lua
FunctionModule.Clone(game.Workspace.https_KingPie,game.ReplicatedStorage)
```

This would clone my character and store the instance in ReplicatedStorage

**Tween Information**

Use this as
```lua
FunctionModule.TweenInformation(Length,EasingStyle,EasingDirection,TimesToRepeat,Repeat,Delay)
```

Length is the length of time for the Tween.  This is a NumberValue.

EasingStyle is the different EasingStyles.  This is an Enumerated Type.  They can be found by typing Enum.EasingStyle and viewing the suggested options or here: https://developer.roblox.com/en-us/api-reference/enum/EasingStyle

EasingDirection is the different EasingDirections.  This is an Enumerated Type.  They can be found by typing Enum.EasingDirection and viewing the suggested options or here: https://developer.roblox.com/en-us/api-reference/enum/EasingDirection

TimesToRepeat is the amount of times you would like the Tween to repeat.  This is a NumberValue.  Note, this will Tween the target to your specified value, tween it back to the original value, and then repeat after that.  The loop will be built in automatically if it is set to repeat.  If it is not set to repeat, the loop will not be included.

Repeat is a variable that decides whether or not you want the Tween to repeat.  This is a Boolean Value.

Delay sets the delay between repetitions of the Tween.  This is a NumberValue.

Use this to quickly set up TweenInformation and save space within the script.

An example of this in use:

```lua
local TweenService = game:GetService("TweenService")
local TweenInformation = FunctionModule.TweenInformation(2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)

--To play the tween you would do
game.Workspace.Part.Transparency = 0
local Tween = TweenService:Create(game.Workspace.Part,TweenInformation,{Transparency = 1})
Tween:Play()
```

This would create a Tween with the specified variables that would ultimately, when run in the code following the TweenInformation portion, tween the Transparency of game.Workspace.Part from 0 to 1 in two seconds.  The Tween will not repeat.

**Player Check**

Use this as
```lua
FunctionModule.PlayerCheck(Player,Table)
```

Player is the player instance of the person you are checking.  Table is a table that holds either usernames, userids, or a mix in your whitelist.

Use this when you want an expediant way to check if a player is in your whitelist.  The function will return true or false if the player is in the table.  This is compatible with both usernames and UserId's.

An example of this in use:
```lua
local Whitelist = {"Player1"; "Player2"}
game:GetService("Players").PlayerAdded:Connect(function(Player)
	if FunctionModule.PlayerCheck(Player,Whitelist) then
		print("Player is whitelisted")
	else
		print("Player is not whitelisted")
		Player:Kick("Sorry, you are not a whitelisted player!")
	end
end)
```

This would check every player joining the server and kick them if they are not in the whitelist.
