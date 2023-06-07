local UniformGridSlot = RegisterChildSlot("UniformGridSlot")

-- Constructor
function UniformGridSlot.Constructor( Parent )
    Parent.Slot = {}
end

-- Sets the column of the slot
---@param Column number
function UniformGridSlot.Methods.SetColumn( self, Column )
    self:CallBlueprintEvent("UG_SetColumn", Column)
    self.Slot.Column = Column
    return self
end

-- Gets the column of the slot
---@return number
function UniformGridSlot.Methods.GetColumn( self )
    return self.Slot.Column or 0
end

-- Sets the row of the slot
---@param Row number
function UniformGridSlot.Methods.SetRow( self, Row )
    self:CallBlueprintEvent("UG_SetRow", Row)
    self.Slot.Row = Row
    return self
end

-- Gets the row of the slot
---@return number
function UniformGridSlot.Methods.GetRow( self )
    return self.Slot.Row or 0
end

-- Sets the horizontal alignment of the slot
---@param Alignment WGui.HorizontalAlignment
function UniformGridSlot.Methods.SetHorizontalAlignment( self, Alignment )
    self:CallBlueprintEvent("UG_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function UniformGridSlot.Methods.GetHorizontalAlignment( self )
    return self.Slot.HorizontalAlignment or WGui.HorizontalAlignment.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment WGui.VerticalAlignment
function UniformGridSlot.Methods.SetVerticalAlignment( self, Alignment )
    self:CallBlueprintEvent("UG_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function UniformGridSlot.Methods.GetVerticalAlignment( self )
    return self.Slot.VerticalAlignment or WGui.VerticalAlignment.Fill
end