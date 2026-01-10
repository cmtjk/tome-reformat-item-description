local _M = loadPrevious(...)

local base_getTextualDesc = _M.getTextualDesc

function _M:getTextualDesc(compare_with, use_actor)

    local desc = base_getTextualDesc(self, compare_with, use_actor)

	if core.key.modState("alt") then
		return desc
	end

    local default_padding = 1
    local default_padding_max = default_padding + 25

    local lines = desc:extractLines(true)

    local strs = {}
    for i, line in ipairs(lines) do
        strs[i] = line:toString()
    end

    local function calculate_padding_for_section(start_idx)
        local local_max = 0
        for idx = start_idx, #strs do
            local line = strs[idx]
            local colon_idx = line:find(":")
            if colon_idx and colon_idx < #line and line:sub(colon_idx+1):gsub("#.-#", ""):find("%S") then
                local key_raw = line:sub(1, colon_idx-1)
                local key_stripped = key_raw:gsub("#.-#", "")
                if not key_stripped:find("^Type") and (default_padding + #key_stripped) > local_max and (default_padding + #key_stripped) < default_padding_max then
                    local_max = math.min(default_padding + #key_stripped, default_padding_max)
                end
            elseif colon_idx then
                break
            end
        end
        return local_max
    end

    local reformattedDesc = tstring{}
    local max_key_len = calculate_padding_for_section(1)
    for i, s in ipairs(strs) do
        local colon = s:find(":")
        if colon and colon < #s and s:sub(colon+1):gsub("#.-#", ""):find("%S") then
            local key = s:sub(1, colon-1)
            local rest = s:sub(colon):gsub(" / ", "\n" .. string.rep(" ", max_key_len + 2))
            local key_stripped = key:gsub("#.-#", "")
            if not key_stripped:find("^Type") and #key_stripped <= max_key_len then
                local padding = max_key_len - #key_stripped
                s = string.rep(" ", padding) .. key .. rest
            end
        elseif colon and not s:sub(colon+1):gsub("#.-#", ""):find("%S") then
            s = "\n"..s
            max_key_len = calculate_padding_for_section(i+1)
        end
        reformattedDesc:add(s, (i ~= #strs or nil))
    end
    return reformattedDesc
end