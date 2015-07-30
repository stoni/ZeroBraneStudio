local interpreter = {
  name = "Algo",
  description = "Supports the development of algorithmic trading strategies",
  api = {"baselib"},
  frun = function(self,wfilename,rundebug)
    if not rundebug then
      DisplayOutputLn("In order to run the strategy '"..wfilename:GetFullPath().."' you need to run it in a container")
	else
	  DebuggerAttachDefault({runstart = ide.config.debugger.runonstart == true})
	  DisplayOutputLn("Now start the strategy in a container, in order to start debugging")
	end
  end,
  hasdebugger = true,
  fattachdebug = function(self) DebuggerAttachDefault() end,
}

return {
  name = "Algo Plugin",
  description = "Plugin to support the development of algorithmic trading strategies",
  author = "INAOS GmbH",
  version = 0.1,

  onRegister = function(self)
    ide:AddInterpreter("algo", interpreter)
  end,

  onUnRegister = function(self)
    ide:RemoveInterpreter("algo")
  end,
}
