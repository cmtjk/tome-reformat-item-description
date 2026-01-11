local _M = loadPrevious(...)

local ResetTooltip = require("data-reformat-item-description.class.ResetTooltip")

local base_init = _M.init
function _M:init(...)
    base_init(self, ...)
    self.key.any_key = function(sym) return ResetTooltip(self, sym) end
end

local TextzoneList = require "engine.ui.TextzoneList"
local base_select = _M.select
function _M:select(item, force)
    local current_tooltip_max = game.tooltip.max

    game.tooltip.max = 450
    game.tooltip.default_ui = { TextzoneList.new { weakstore = true, width = game.tooltip.max, height = 500, variable_height = true, font = game.tooltip.font, ui = game.tooltip.ui } }

    base_select(self, item, force)

    game.tooltip.max = current_tooltip_max
    game.tooltip.default_ui = { TextzoneList.new { weakstore = true, width = game.tooltip.max, height = 500, variable_height = true, font = game.tooltip.font, ui = game.tooltip.ui } }
end
