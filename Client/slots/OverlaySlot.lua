local OverlaySlot = RegisterChildSlot("OverlaySlot")

-- Sets the horizontal alignment of the slot
---@param Alignment WGui.HAlign
function OverlaySlot.Methods.HAlign( self, Alignment )
    self:CallBlueprintEvent("O_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function OverlaySlot.Methods.GetHAlign( self )
    return self.Slot.HorizontalAlignment or WGui.HAlign.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment WGui.VAlign
function OverlaySlot.Methods.VAlign( self, Alignment )
    self:CallBlueprintEvent("O_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function OverlaySlot.Methods.GetVAlign( self )
    return self.Slot.VerticalAlignment or WGui.VAlign.Fill
end