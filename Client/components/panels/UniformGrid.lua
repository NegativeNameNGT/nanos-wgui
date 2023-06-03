UMG.NUniformGrid = UMG.Inherit(UMG.PanelWidget, "NUniformGrid", {
    ChildSlot = "UniformGridSlot"
})

function UMG.NUniformGrid:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_UniformGrid" )
    return self
end

local NativeAdd = UMG.NGrid.Add
function UMG.NUniformGrid:Add( eWidget, iInRow, iInColumn )
    NativeAdd(self, eWidget, {iInRow, iInColumn})
    return self
end

-- Sets the minimum desired height of the slots
---@param InMinDesiredSlotHeight number
function UMG.NUniformGrid:SetMinDesiredSlotHeight( InMinDesiredSlotHeight )
    self:CallBlueprintEvent( "SetMinDesiredSlotHeight", InMinDesiredSlotHeight )
    return self
end

-- Sets the minimum desired width of the slots
---@param InMinDesiredSlotWidth number
function UMG.NUniformGrid:SetMinDesiredSlotWidth( InMinDesiredSlotWidth )
    self:CallBlueprintEvent( "SetMinDesiredSlotWidth", InMinDesiredSlotWidth )
    return self
end