local HorizontalBoxSlot = RegisterChildSlot("HorizontalBoxSlot")

-- Constructor
function HorizontalBoxSlot.Constructor( Parent )
    Parent.Slot = {}
end

-- Sets the size of the slot
---@param Value number
---@param SizeRule UMG.SizeRule
function HorizontalBoxSlot.Methods.SetSize( self, Value, SizeRule )
    self:CallBlueprintEvent("HB_SetSize", Value, SizeRule)
    self.Slot.Size = {Value = Value, SizeRule = SizeRule}
    return self
end

-- Gets the size of the slot
---@return table
function HorizontalBoxSlot.Methods.GetSize( self )
    return self.Slot.Size or { Value = 0, SizeRule = UMG.SizeRule.Automatic }
end

-- Sets the horizontal alignment of the slot
---@param Alignment UMG.HorizontalAlignment
function HorizontalBoxSlot.Methods.SetHorizontalAlignment( self, Alignment )
    self:CallBlueprintEvent("HB_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function HorizontalBoxSlot.Methods.GetHorizontalAlignment( self )
    return self.Slot.HorizontalAlignment or UMG.HorizontalAlignment.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment UMG.VerticalAlignment
function HorizontalBoxSlot.Methods.SetVerticalAlignment( self, Alignment )
    self:CallBlueprintEvent("HB_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function HorizontalBoxSlot.Methods.GetVerticalAlignment( self )
    return self.Slot.VerticalAlignment or UMG.VerticalAlignment.Fill
end