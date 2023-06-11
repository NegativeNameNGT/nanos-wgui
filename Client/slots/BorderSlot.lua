local BorderSlot = RegisterChildSlot("BorderSlot")

-- Sets the horizontal alignment of the slot
---@param Alignment WGui.HAlign
function BorderSlot.Methods.HAlign( self, Alignment )
    self:CallBlueprintEvent("B_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function BorderSlot.Methods.GetHAlign( self )
    return self.Slot.HorizontalAlignment or WGui.HAlign.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment WGui.VAlign
function BorderSlot.Methods.VAlign( self, Alignment )
    self:CallBlueprintEvent("B_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function BorderSlot.Methods.GetVAlign( self )
    return self.Slot.VerticalAlignment or WGui.VAlign.Fill
end