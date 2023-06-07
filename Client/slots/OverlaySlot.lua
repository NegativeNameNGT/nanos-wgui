local OverlaySlot = RegisterChildSlot("OverlaySlot")

-- Constructor
function OverlaySlot.Constructor( Parent )
    Parent.Slot = {}
end

-- Sets the horizontal alignment of the slot
---@param Alignment WGui.HorizontalAlignment
function OverlaySlot.Methods.SetHorizontalAlignment( self, Alignment )
    self:CallBlueprintEvent("O_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function OverlaySlot.Methods.GetHorizontalAlignment( self )
    return self.Slot.HorizontalAlignment or WGui.HorizontalAlignment.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment WGui.VerticalAlignment
function OverlaySlot.Methods.SetVerticalAlignment( self, Alignment )
    self:CallBlueprintEvent("O_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function OverlaySlot.Methods.GetVerticalAlignment( self )
    return self.Slot.VerticalAlignment or WGui.VerticalAlignment.Fill
end