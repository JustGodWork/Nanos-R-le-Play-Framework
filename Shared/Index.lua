--[[
--Created Date: Monday September 19th 2022
--Author: JustGod
--Made with ❤
-------
--Last Modified: Monday September 19th 2022 7:10:53 pm
-------
--Copyright (c) 2022 JustGodWork, All Rights Reserved.
--This file is part of JustGodWork project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
-------
--]]

---@class _Shared
local _Shared = {}
Package.Require("./Config.lua")
Package.Require("./modules/Utils/Lang.lua")
Package.Require("./modules/Utils/Map.lua")

---@return _Shared
function _Shared:new()
    local class = {}
    setmetatable(class, {__index = _Shared})

    self.utils = {}
    self.utils.map = Map
    --self.langs = Lang:new()
    Package.Log("Shared loaded.")

    return class
end

---@return boolean
function _Shared:isDebugMode()
    return Config.debug
end

---@param bool boolean
function _Shared:setDebugMode(bool)
    Config.debug = bool
end

---@param pattern  string
---@return string
function _Shared:uuid(pattern)
    local random = math.random
    local template = pattern and type(pattern) == "string" and pattern or 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function (c)
        local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
        return string.format('%x', v)
    end)
end

jShared = _Shared:new()
--jShared.langs:loadLocales()