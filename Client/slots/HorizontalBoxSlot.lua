local HorizontalBoxSlot = RegisterChildSlot("HorizontalBoxSlot")

-- Constructor
function HorizontalBoxSlot.Constructor( Parent )
    Parent.Slot = {}
end

-- Sets the size of the slot
---@param Value number
---@param SizeRule WGui.SizeRule
function HorizontalBoxSlot.Methods.SetSize( self, Value, SizeRule )
    self:CallBlueprintEvent("HB_SetSize", Value, SizeRule)
    self.Slot.Size = {Value = Value, SizeRule = SizeRule}
    return self
end

-- Gets the size of the slot
---@return table
function HorizontalBoxSlot.Methods.GetSize( self )
    return self.Slot.Size or { Value = 0, SizeRule = WGui.SizeRule.Automatic }
end

-- Sets the horizontal alignment of the slot
---@param Alignment WGui.HAlign
function HorizontalBoxSlot.Methods.HAlign( self, Alignment )
    self:CallBlueprintEvent("HB_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function HorizontalBoxSlot.Methods.GetHAlign( self )
    return self.Slot.HorizontalAlignment or WGui.HAlign.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment WGui.VAlign
function HorizontalBoxSlot.Methods.VAlign( self, Alignment )
    self:CallBlueprintEvent("HB_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function HorizontalBoxSlot.Methods.GetVAlign( self )
    return self.Slot.VerticalAlignment or WGui.VAlign.Fill
end