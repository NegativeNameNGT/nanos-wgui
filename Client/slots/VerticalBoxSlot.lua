local VerticalBoxSlot = RegisterChildSlot("VerticalBoxSlot")

-- Constructor
function VerticalBoxSlot.Constructor( Parent )
    Parent.Slot = {}
end

-- Sets the size of the slot
---@param Value number
---@param SizeRule UMG.SizeRule
function VerticalBoxSlot.Methods.SetSize( self, Value, SizeRule )
    self:CallBlueprintEvent("VB_SetSize", Value, SizeRule)
    self.Slot.Size = {Value = Value, SizeRule = SizeRule}
    return self
end

-- Gets the size of the slot
---@return table
function VerticalBoxSlot.Methods.GetSize( self )
    return self.Slot.Size or { Value = 0, SizeRule = UMG.SizeRule.Automatic }
end

-- Sets the horizontal alignment of the slot
---@param Alignment UMG.HorizontalAlignment
function VerticalBoxSlot.Methods.SetHorizontalAlignment( self, Alignment )
    self:CallBlueprintEvent("VB_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function VerticalBoxSlot.Methods.GetHorizontalAlignment( self )
    return self.Slot.HorizontalAlignment or UMG.HorizontalAlignment.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment UMG.VerticalAlignment
function VerticalBoxSlot.Methods.SetVerticalAlignment( self, Alignment )
    self:CallBlueprintEvent("VB_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function VerticalBoxSlot.Methods.GetVerticalAlignment( self )
    return self.Slot.VerticalAlignment or UMG.VerticalAlignment.Fill
end