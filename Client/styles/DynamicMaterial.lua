local DynamicMaterial = {}
DynamicMaterial.__index = DynamicMaterial
local idCounter = 0

-- DynamicMaterial constructor
---@param xMaterial string | Material
---@return table
function WGui.DynamicMaterial( xMaterial )
    if not xMaterial then
        assert(false, "DynamicMaterial: Material cannot be nil!")
    end
    idCounter = idCounter + 1

    local oMaterial = {}
    oMaterial.ID = idCounter
    setmetatable(oMaterial, DynamicMaterial)

    if type(xMaterial) == "string" then
        local sAssetPath = WGui.GetAssetPath("[assets.materials]", xMaterial)
        if not sAssetPath then assert(false, "DynamicMaterial: Material Path not found.") return oMaterial end
    
        local bSuccess = WGui.Utility:CallBlueprintEvent( "CreateDynamicMaterial", oMaterial.ID, sAssetPath )
        if not bSuccess then assert(false, "DynamicMaterial: Failed to create material.") return oMaterial end
    end
    return oMaterial
end

-- Sets a vector parameter to the material
---@param sParameterName string
---@param cValue Color
function DynamicMaterial:SetVectorParameterValue( sParameterName, cValue )
    WGui.Utility:CallBlueprintEvent( "SetVectorParameterValue", self.ID, sParameterName, cValue )
    return self
end

-- Sets a scalar parameter to the material
---@param sParameterName string
---@param fValue number
function DynamicMaterial:SetScalarParameterValue( sParameterName, fValue )
    WGui.Utility:CallBlueprintEvent( "SetScalarParameterValue", self.ID, sParameterName, fValue )
    return self
end

-- Sets a vector4 parameter to the material
---@param sParameterName string
---@param tValue table
function DynamicMaterial:SetVector4ParameterValue( sParameterName, tValue )
    WGui.Utility:CallBlueprintEvent( "SetVector4ParameterValue", self.ID, sParameterName, tValue )
    return self
end

-- Sets a texture parameter to the material
---@param sParameterName string
---@param xTexture string
function DynamicMaterial:SetTextureParameterValue( sParameterName, xTexture )
    if string.sub(xTexture, 1, 7) == "http://" or string.sub(xTexture, 1, 8) == "https://" or string.sub(xTexture, 1, 6) == "ftp://" then
        WGui.Utility:CallBlueprintEvent("SetTextureParameterValue", self.ID, sParameterName, xTexture)
        return self
    end

    if string.find(xTexture, "package://") then
        WGui.Utility:CallBlueprintEvent("SetTextureParameterValue", self.ID, sParameterName, "", "", xTexture)
        return self
    end

    WGui.Utility:CallBlueprintEvent("SetTextureParameterValue", self.ID, sParameterName, "", xTexture)
    return self
end

-- Destroys the material
function DynamicMaterial:Destroy()
    WGui.Utility:CallBlueprintEvent( "DestroyDynamicMaterial", self.ID )
    setmetatable(self, nil)
    return
end