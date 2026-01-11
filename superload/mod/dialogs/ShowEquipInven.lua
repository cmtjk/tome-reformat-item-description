local _M = loadPrevious(...)

local ResetTooltip = require("data-reformat-item-description.class.ResetTooltip")

local base_init = _M.init

function _M:init(...)
    base_init(self, ...)
    self.key.any_key = function(sym) return ResetTooltip(self, sym) end
end
