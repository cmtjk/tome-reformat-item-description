return function(self, sym)
    if sym == self.key._LCTRL or sym == self.key._RCTRL or sym == self.key._LALT or sym == self.key._RALT then
        local ctrl = core.key.modState("ctrl") or core.key.modState("alt")
        if self.prev_ctrl ~= ctrl then self:select(self.cur_item, true) end
        self.prev_ctrl = ctrl
    end
end
