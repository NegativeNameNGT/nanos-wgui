local ScrollerSlot = RegisterChildSlot("ScrollerSlot")

-- Constructor
function ScrollerSlot.Constructor( Parent )
    Parent.Slot = {}
end

-- Sets the horizontal alignment of the slot
---@param Alignment WGui.HorizontalAlignment
function ScrollerSlot.Methods.SetHorizontalAlignment( self, Alignment )
    self:CallBlueprintEvent("SIB_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function ScrollerSlot.Methods.GetHorizontalAlignment( self )
    return self.Slot.HorizontalAlignment or WGui.HorizontalAlignment.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment WGui.VerticalAlignment
function ScrollerSlot.Methods.SetVerticalAlignment( self, Alignment )
    self:CallBlueprintEvent("SIB_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function ScrollerSlot.Methods.GetVerticalAlignment( self )
    return self.Slot.VerticalAlignment or WGui.VerticalAlignment.Fill
end
