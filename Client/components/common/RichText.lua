WGui.NRichText = WGui.Inherit(WGui.BaseWidget, "NRichText")

function WGui.NRichText:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_RichText" )

    self:SetVisibility(WGui.Visibility.NotHitTestableAll)

    -- Sets the justification as center if the parent is not a canvas
    self.OnAdded = function ( oParent )
        if not (oParent:IsA(WGui.NCanvas)) then
            self:SetJustification(WGui.TextJustify.Center)
        else
            self:SetJustification(WGui.TextJustify.Left)
        end
    end
    return self
end

-- Sets the text style
---@param TextStyle string
function WGui.NRichText:SetTextStyle(TextStyle)
    local sAssetPath = WGui.GetAssetPath("[assets.others]", TextStyle, WGui.NRichText.SetTextStyle, self:GetID(), {TextStyle})
    if not sAssetPath then return self end

    self:CallBlueprintEvent("SetTextStyleSet", sAssetPath)
    return self
end

-- Sets the text of the widget
---@param Text string
function WGui.NRichText:SetText(Text)
    self:CallBlueprintEvent("SetText", Text)
    self.Text = Text
    return self
end

-- Gets the text of the widget
---@return string
function WGui.NRichText:GetText()
    return self.Text or ""
end


--- Sets the auto wrap for this text block
---@param InAutoWrapText boolean
function WGui.NRichText:SetAutoWrapText( InAutoWrapText )
    self:CallBlueprintEvent( "SetAutoWrapText", InAutoWrapText )
    return self
end

-- Sets the text transformation policy for this text
---@param TextTransform TextTransformPolicy
function WGui.NRichText:SetTransformPolicy(TextTransform)
    self:CallBlueprintEvent("SetTextTransformPolicy", TextTransform)
    return self
end

-- Set the text overflow policy for this text block.
---@param InOverflowPolicy TextOverflowPolicy
function WGui.NRichText:SetOverflowPolicy( InOverflowPolicy )
    self:CallBlueprintEvent( "SetTextOverflowPolicy", InOverflowPolicy )
    return self
end

-- Sets the justification for this text block
---@param InJustification WGui.TextJustify
function WGui.NRichText:SetJustification( InJustification )
    self:CallBlueprintEvent( "SetJustification", InJustification )
    return self
end

-- Replaces the existing decorators with the list provided
---@param InDecorators table
function WGui.NRichText:SetDecorators( InDecorators )
    self:CallBlueprintEvent( "SetDecorators", InDecorators )
    return self
end