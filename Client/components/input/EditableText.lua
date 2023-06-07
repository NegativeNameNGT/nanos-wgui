WGui.NEditableText = WGui.Inherit(WGui.BaseWidget, "NEditableText" )

function WGui.NEditableText:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_EditableText" )

    self:BindBlueprintEventDispatcher("OnTextChanged", function( _, sText)
        self.Text = sText
        if self.OnTextChanged then
            self.OnTextChanged(sText)
        end
    end)

    self:BindBlueprintEventDispatcher("OnTextCommitted", function( _, sText, eReason)
        if self.OnTextCommitted then
            self.OnTextCommitted(sText, eReason)
        end
    end)

    return self
end

function WGui.NEditableText:SetText( sText )
    self:CallBlueprintEvent("SetText", sText)
    self.Text = sText
    return self
end

function WGui.NEditableText:GetText()
    return self.Text or ""
end

function WGui.NEditableText:SetHintText( sHintText )
    self:CallBlueprintEvent("SetHintText", sHintText)
    self.HintText = sHintText
    return self
end

function WGui.NEditableText:GetHintText()
    return self.HintText or ""
end

function WGui.NEditableText:SetIsPassword( bIsPassword )
    self:CallBlueprintEvent("SetIsPassword", bIsPassword)
    self.IsPassword = bIsPassword
    return self
end

function WGui.NEditableText:GetIsPassword()
    return self.IsPassword or false
end

function WGui.NEditableText:SetIsReadOnly( bIsReadOnly )
    self:CallBlueprintEvent("SetIsReadOnly", bIsReadOnly)
    self.IsReadOnly = bIsReadOnly
    return self
end

function WGui.NEditableText:GetIsReadOnly()
    return self.IsReadOnly or false
end

function WGui.NEditableText:SetJustification( eJustification )
    self:CallBlueprintEvent("SetJustification", eJustification)
    return self
end

function WGui.NEditableText:SetMinDesiredWidth( fMinimumDesiredWidth )
    self:CallBlueprintEvent("SetMinimumDesiredWidth", fMinimumDesiredWidth)
    return self
end

function WGui.NEditableText:SetFontSize( iFontSize )
    self:CallBlueprintEvent("SetFontSize", iFontSize)
    return self
end

function WGui.NEditableText:SetFont( sFont, sTypeFace )
    self:CallBlueprintEvent("SetFont", sFont, sTypeFace or "")
    return self
end

function WGui.NEditableText:SetLetterSpacing( iLetterSpacing )
    self:CallBlueprintEvent("SetLetterSpacing", iLetterSpacing)
    return self
end

function WGui.NEditableText:SetSkew( fSkewAmount )
    self:CallBlueprintEvent("SetSkew", fSkewAmount)
    return self
end

function WGui.NEditableText:SetOutlineSettings( tOutlineSettings )
    self:CallBlueprintEvent("SetOutlineSettings", tOutlineSettings)
    return self
end

function WGui.NEditableText:SetFontMaterial( sFontMaterial )
    self:CallBlueprintEvent("SetFontMaterial", sFontMaterial)
    return self
end