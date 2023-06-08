local ScaleBoxSlot = RegisterChildSlot("ScaleBoxSlot")

-- Constructor
function ScaleBoxSlot.Constructor( Parent )
    Parent.Slot = {}
end

-- Sets the horizontal alignment of the slot
---@param Alignment WGui.HAlign
function ScaleBoxSlot.Methods.HAlign( self, Alignment )
    self:CallBlueprintEvent("SCB_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function ScaleBoxSlot.Methods.GetHAlign( self )
    return self.Slot.HorizontalAlignment or WGui.HAlign.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment WGui.VAlign
function ScaleBoxSlot.Methods.VAlign( self, Alignment )
    self:CallBlueprintEvent("SCB_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function ScaleBoxSlot.Methods.GetVAlign( self )
    return self.Slot.VerticalAlignment or WGui.VAlign.Fill
end