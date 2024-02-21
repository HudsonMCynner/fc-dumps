-------------------------------------------------------------------------------
-- FM2M ToolBox - Telemetry script
-- version: 0.8
-- release date: 2023-02
-- author: Robert Janiszewski JimB40
-- http://fm2m.jimb40.com
-------------------------------------------------------------------------------
local SP = '/FM2M/TOOLBOX/'
local fm2mTB = loadScript(SP..'loader','bx')('TLM',SP,'bx')
return {run=fm2mTB.run,background=fm2mTB.background}
