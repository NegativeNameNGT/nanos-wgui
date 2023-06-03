local ScaleBoxSlot = RegisterChildSlot("ScaleBoxSlot")

-- Constructor
function ScaleBoxSlot.Constructor( Parent )
    Parent.Slot = {}
end

-- Sets the horizontal alignment of the slot
---@param Alignment UMG.HorizontalAlignment
function ScaleBoxSlot.Methods.SetHorizontalAlignment( self, Alignment )
    self:CallBlueprintEvent("SCB_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function ScaleBoxSlot.Methods.GetHorizontalAlignment( self )
    return self.Slot.HorizontalAlignment or UMG.HorizontalAlignment.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment UMG.VerticalAlignment
function ScaleBoxSlot.Methods.SetVerticalAlignment( self, Alignment )
    self:CallBlueprintEvent("SCB_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function ScaleBoxSlot.Methods.GetVerticalAlignment( self )
    return self.Slot.VerticalAlignment or UMG.VerticalAlignment.Fill
end