# FunctionModule

Hi there,

This is a custom ModuleScript designed to make scripting in RLUA a little bit easier.  I wanted to do this both to challenge my own skills and abilities as an entry Lua programmer and to also make my development experience more streamlined, cleaner, and efficient.  

If anyone decides to use this, I hope you find it useful.  Feel free to contact me on Discord to suggest new additions to this Module.  While it has already been useful for me, I would be glad for it to be useful for others as well.

To get started, copy and paste the contents of the FunctionModule.lua into a ModuleScript in ServerScriptStorage and name the ModuleScript "FunctionModule" (don't put the quotes in).

After that, whenever you want to use a function in the ModuleScript in another script, put this at the start of the script: local FunctionModule = require(game.ServerScriptService:WaitForChild("FunctionModule"))

After that you should be able to use it without issue!  Just follow the examples in the script or check out FunctionList.txt
