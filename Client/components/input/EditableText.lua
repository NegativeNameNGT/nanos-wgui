UMG.NEditableText = UMG.Inherit(UMG.BaseWidget, "NEditableText" )

function UMG.NEditableText:Constructor()
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

function UMG.NEditableText:SetText( sText )
    self:CallBlueprintEvent("SetText", sText)
    self.Text = sText
    return self
end

function UMG.NEditableText:GetText()
    return self.Text or ""
end

function UMG.NEditableText:SetHintText( sHintText )
    self:CallBlueprintEvent("SetHintText", sHintText)
    self.HintText = sHintText
    return self
end

function UMG.NEditableText:GetHintText()
    return self.HintText or ""
end

function UMG.NEditableText:SetIsPassword( bIsPassword )
    self:CallBlueprintEvent("SetIsPassword", bIsPassword)
    self.IsPassword = bIsPassword
    return self
end

function UMG.NEditableText:GetIsPassword()
    return self.IsPassword or false
end

function UMG.NEditableText:SetIsReadOnly( bIsReadOnly )
    self:CallBlueprintEvent("SetIsReadOnly", bIsReadOnly)
    self.IsReadOnly = bIsReadOnly
    return self
end

function UMG.NEditableText:GetIsReadOnly()
    return self.IsReadOnly or false
end

function UMG.NEditableText:SetJustification( eJustification )
    self:CallBlueprintEvent("SetJustification", eJustification)
    return self
end

function UMG.NEditableText:SetMinimumDesiredWidth( fMinimumDesiredWidth )
    self:CallBlueprintEvent("SetMinimumDesiredWidth", fMinimumDesiredWidth)
    return self
end

function UMG.NEditableText:SetFontSize( iFontSize )
    self:CallBlueprintEvent("SetFontSize", iFontSize)
    return self
end

function UMG.NEditableText:SetFont( sFont, sTypeFace )
    self:CallBlueprintEvent("SetFont", sFont, sTypeFace or "")
    return self
end

function UMG.NEditableText:SetLetterSpacing( iLetterSpacing )
    self:CallBlueprintEvent("SetLetterSpacing", iLetterSpacing)
    return self
end

function UMG.NEditableText:SetSkew( fSkewAmount )
    self:CallBlueprintEvent("SetSkew", fSkewAmount)
    return self
end

function UMG.NEditableText:SetOutlineSettings( tOutlineSettings )
    self:CallBlueprintEvent("SetOutlineSettings", tOutlineSettings)
    return self
end

function UMG.NEditableText:SetFontMaterial( sFontMaterial )
    self:CallBlueprintEvent("SetFontMaterial", sFontMaterial)
    return self
end