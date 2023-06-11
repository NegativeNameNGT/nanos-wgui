local ScrollerSlot = RegisterChildSlot("ScrollerSlot")

-- Constructor
function ScrollerSlot.Constructor( Parent )
    Parent.Slot = {}
end

-- Sets the horizontal alignment of the slot
---@param Alignment WGui.HAlign
function ScrollerSlot.Methods.HAlign( self, Alignment )
    self:CallBlueprintEvent("SIB_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function ScrollerSlot.Methods.GetHAlign( self )
    return self.Slot.HorizontalAlignment or WGui.HAlign.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment WGui.VAlign
function ScrollerSlot.Methods.VAlign( self, Alignment )
    self:CallBlueprintEvent("SIB_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function ScrollerSlot.Methods.GetVAlign( self )
    return self.Slot.VerticalAlignment or WGui.VAlign.Fill
end
