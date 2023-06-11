local BlurSlot = RegisterChildSlot("BlurSlot")

-- Sets the horizontal alignment of the slot
---@param Alignment WGui.HAlign
function BlurSlot.Methods.HAlign( self, Alignment )
    self:CallBlueprintEvent("BB_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function BlurSlot.Methods.GetHAlign( self )
    return self.Slot.HorizontalAlignment or WGui.HAlign.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment WGui.VAlign
function BlurSlot.Methods.VAlign( self, Alignment )
    self:CallBlueprintEvent("BB_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function BlurSlot.Methods.GetVAlign( self )
    return self.Slot.VerticalAlignment or WGui.VAlign.Fill
end