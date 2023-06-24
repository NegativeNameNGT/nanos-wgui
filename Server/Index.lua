local tAssetPacksData = {}

local function parseTomlString(toml_string)
    local tData = {}
    local sCurrent_Section = ""

    for line in toml_string:gmatch("[^\n]*\n?") do
        line = line:match("^%s*(.-)%s*$") -- Remove leading and trailing whitespace
        line = (line:match("(.-)#") or line):match("^%s*(.-)%s*$") -- Remove comments

        local section_header = line:match("(%[%a+[.%a+]*%])")
        if section_header then
            sCurrent_Section = section_header
            if sCurrent_Section == "[assets.materials]" or sCurrent_Section == "[assets.others]" then
                tData[sCurrent_Section] = {}
            end
        elseif line ~= "" and (sCurrent_Section == "[assets.materials]" or sCurrent_Section == "[assets.others]") then
            local key, value = line:match("([^=]+) = (.+)")
            if key and value then
                if value:match("{.*}") then
                    local path = value:match('path = "(.-)"')
                    if path then
                        tData[sCurrent_Section][key] = path
                    end
                else
                    value = value:match('"(.-)"') or value
                    tData[sCurrent_Section][key] = value
                end
            end
        end
    end

    local has_materials = next(tData["[assets.materials]"]) ~= nil
    local has_others = next(tData["[assets.others]"]) ~= nil

    if not has_materials and not has_others then
        return {}
    end

    if not has_materials then
        tData["[assets.materials]"] = nil
    end

    if not has_others then
        tData["[assets.others]"] = nil
    end

    return tData
end


local tLoadedAssetPacks = Assets.GetAssetPacks()

for _, tData in pairs(tLoadedAssetPacks) do
    local sPath = tData["Path"]
    if sPath == "nanos-world" then goto continue end
    local sTomlString = File("Assets/" .. sPath .. "/Assets.toml"):Read()
    local tParsedData = parseTomlString(sTomlString)

    if next(tParsedData) == nil then goto continue end

    tParsedData["path"] = tData.UnrealFolder
    tAssetPacksData[sPath] = tParsedData
    ::continue::
end
Server.SetValue("wgui::asset_packs_data", JSON.stringify(tAssetPacksData), true)