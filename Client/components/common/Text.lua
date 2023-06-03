UMG.NText = UMG.Inherit(UMG.BaseWidget, "NText")

function UMG.NText:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Text" )

    self.NativeWidget = Widget(NativeWidget.Text)

    self:CallBlueprintEvent("Initialize", self.NativeWidget)
    return self
end

-- Sets the text of the widget
---@param Text string
function UMG.NText:SetText(Text)
    self.NativeWidget:CallBlueprintEvent("SetText", Text)
    self.Text = Text
    return self
end

-- Gets the text of the widget
---@return string
function UMG.NText:GetText()
    return self.Text or ""
end

-- Sets the text transformation policy for this text
---@param TextTransform TextTransformPolicy
function UMG.NText:SetTransformPolicy(TextTransform)
    self.NativeWidget:CallBlueprintEvent("SetTextTransformPolicy", TextTransform)
    return self
end

-- Set the text overflow policy for this text block.
---@param InOverflowPolicy TextOverflowPolicy
function UMG.NText:SetOverflowPolicy( InOverflowPolicy )
    self.NativeWidget:CallBlueprintEvent( "SetTextOverflowPolicy", InOverflowPolicy )
    return self
end

-- Dynamically set the strike brush for this text block
---@param InStrikeBrush table
function UMG.NText:SetStrikeBrush( InStrikeBrush )
    self:CallBlueprintEvent( "SetStrikeBrush", InStrikeBrush )
    return self
end

-- Sets the offset that the text drag drop shadow should be drawn at
---@param InShadowOffset Vector2D
function UMG.NText:SetTextShadowOffset( InShadowOffset )
    self.NativeWidget:CallBlueprintEvent( "SetShadowOffset", InShadowOffset )
    return self
end

--- Sets the color and opacity of the text drop shadow
---@param InShadowColorAndOpacity Color
function UMG.NText:SetShadowColorAndOpacity( InShadowColorAndOpacity )
    self.NativeWidget:CallBlueprintEvent( "SetShadowColorAndOpacity", InShadowColorAndOpacity )
    return self
end

--- Set the minimum desired width for this text block
---@param InMinDesiredWidth number
function UMG.NText:SetMinDesiredWidth( InMinDesiredWidth )
    self.NativeWidget:CallBlueprintEvent( "SetMinDesiredWidth", InMinDesiredWidth )
    return self
end

---@param Font string
---@param Typeface string
function UMG.NText:SetFont(Font, Typeface)
    self:CallBlueprintEvent("SetFont", Font, Typeface or "")
    return self
end

---@param InMaterial Material
function UMG.NText:SetFontOutlineMaterial( InMaterial )
    self.NativeWidget:CallBlueprintEvent( "SetFontOutlineMaterial", InMaterial )
    return self
end

---@param InMaterial Material
function UMG.NText:SetFontMaterial( InMaterial )
    self.NativeWidget:CallBlueprintEvent( "SetFontMaterial", InMaterial )
    return self
end

--- Sets the size of the font
---@param InSize number
function UMG.NText:SetFontSize( InSize )
    self:CallBlueprintEvent( "SetFontSize", InSize )
    return self
end

--- Sets the letter spacing of the font
---@param InLetterSpacing number
function UMG.NText:SetLetterSpacing( InLetterSpacing )
    self:CallBlueprintEvent( "SetLetterSpacing", InLetterSpacing )
    return self
end

--- Sets the skew of the font
---@param InSkew number
function UMG.NText:SetSkew( InSkew )
    self:CallBlueprintEvent( "SetSkew", InSkew )
    return self
end

--- Sets the outline settings of the font
---@param InOutlineSettings OutlineSettings
function UMG.NText:SetOutlineSettings( InOutlineSettings )
    self:CallBlueprintEvent( "SetOutlineSettings", InOutlineSettings )
    return self
end

--- Sets the auto wrap for this text block
---@param InAutoWrapText boolean
function UMG.NText:SetAutoWrapText( InAutoWrapText )
    self.NativeWidget:CallBlueprintEvent( "SetAutoWrapText", InAutoWrapText )
    return self
end

-- Sets the justification for this text block
---@param InJustification UMG.TextJustify
function UMG.NText:SetJustification( InJustification )
    self.NativeWidget:CallBlueprintEvent( "SetJustification", InJustification )
    return self
end