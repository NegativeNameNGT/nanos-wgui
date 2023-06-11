local SizeBoxSlot = RegisterChildSlot("SizeBoxSlot")

-- Sets the horizontal alignment of the slot
---@param Alignment WGui.HAlign
function SizeBoxSlot.Methods.HAlign( self, Alignment )
    self:CallBlueprintEvent("SB_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function SizeBoxSlot.Methods.GetHAlign( self )
    return self.Slot.HorizontalAlignment or WGui.HAlign.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment WGui.VAlign
function SizeBoxSlot.Methods.VAlign( self, Alignment )
    self:CallBlueprintEvent("SB_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function SizeBoxSlot.Methods.GetVAlign( self )
    return self.Slot.VerticalAlignment or WGui.VAlign.Fill
end
