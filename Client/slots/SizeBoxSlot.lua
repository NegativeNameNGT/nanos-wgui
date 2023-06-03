local SizeBoxSlot = RegisterChildSlot("SizeBoxSlot")

-- Constructor
function SizeBoxSlot.Constructor( Parent )
    Parent.Slot = {}
end

-- Sets the horizontal alignment of the slot
---@param Alignment UMG.HorizontalAlignment
function SizeBoxSlot.Methods.SetHorizontalAlignment( self, Alignment )
    self:CallBlueprintEvent("SB_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function SizeBoxSlot.Methods.GetHorizontalAlignment( self )
    return self.Slot.HorizontalAlignment or UMG.HorizontalAlignment.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment UMG.VerticalAlignment
function SizeBoxSlot.Methods.SetVerticalAlignment( self, Alignment )
    self:CallBlueprintEvent("SB_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function SizeBoxSlot.Methods.GetVerticalAlignment( self )
    return self.Slot.VerticalAlignment or UMG.VerticalAlignment.Fill
end
