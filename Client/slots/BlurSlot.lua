local BlurSlot = RegisterChildSlot("BlurSlot")

-- Constructor
function BlurSlot.Constructor( Parent )
    Parent.Slot = {}
end

-- Sets the horizontal alignment of the slot
---@param Alignment WGui.HorizontalAlignment
function BlurSlot.Methods.SetHorizontalAlignment( self, Alignment )
    self:CallBlueprintEvent("BB_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function BlurSlot.Methods.GetHorizontalAlignment( self )
    return self.Slot.HorizontalAlignment or WGui.HorizontalAlignment.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment WGui.VerticalAlignment
function BlurSlot.Methods.SetVerticalAlignment( self, Alignment )
    self:CallBlueprintEvent("BB_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function BlurSlot.Methods.GetVerticalAlignment( self )
    return self.Slot.VerticalAlignment or WGui.VerticalAlignment.Fill
end