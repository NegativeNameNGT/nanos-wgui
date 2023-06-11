WGui.NUniformGrid = WGui.Inherit(WGui.PanelWidget, "NUniformGrid", {
    ChildSlot = "UniformGridSlot"
})

function WGui.NUniformGrid:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_UniformGrid" )
    return self
end

local NativeAdd = WGui.NGrid.Add
function WGui.NUniformGrid:Add( eWidget, iInRow, iInColumn )
    self.Slot.Column = iInColumn
    self.Slot.Row = iInRow
    NativeAdd(self, eWidget, iInRow, iInColumn)
    return self
end

-- Sets the minimum desired height of the slots
---@param InMinDesiredSlotHeight number
function WGui.NUniformGrid:SetMinDesiredSlotHeight( InMinDesiredSlotHeight )
    self:CallBlueprintEvent( "SetMinDesiredSlotHeight", InMinDesiredSlotHeight )
    return self
end

-- Sets the minimum desired width of the slots
---@param InMinDesiredSlotWidth number
function WGui.NUniformGrid:SetMinDesiredSlotWidth( InMinDesiredSlotWidth )
    self:CallBlueprintEvent( "SetMinDesiredSlotWidth", InMinDesiredSlotWidth )
    return self
end