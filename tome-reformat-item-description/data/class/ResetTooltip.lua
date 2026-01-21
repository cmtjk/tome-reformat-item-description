return function(self, sym)
    if sym == self.key._LCTRL or sym == self.key._RCTRL or sym == self.key._LALT or sym == self.key._RALT then
        local ctrl = core.key.modState("ctrl")
        local alt = core.key.modState("alt")
        local mod_state = (ctrl and 1 or 0) + (alt and 2 or 0)
        if self.prev_ctrl ~= mod_state then self:select(self.cur_item, true) end
        self.prev_ctrl = mod_state
    end
end
