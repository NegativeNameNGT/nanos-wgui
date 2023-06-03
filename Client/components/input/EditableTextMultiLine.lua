UMG.NEditableTextMulti = UMG.Inherit(UMG.BaseWidget, "NEditableTextMulti" )

function UMG.NEditableTextMulti:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_EditableTextMultiLine" )

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

function UMG.NEditableTextMulti:SetText( sText )
    self:CallBlueprintEvent("SetText", sText)
    self.Text = sText
    return self
end

function UMG.NEditableTextMulti:GetText()
    return self.Text or ""
end

function UMG.NEditableTextMulti:SetHintText( sHintText )
    self:CallBlueprintEvent("SetHintText", sHintText)
    self.HintText = sHintText
    return self
end

function UMG.NEditableTextMulti:GetHintText()
    return self.HintText or ""
end

function UMG.NEditableTextMulti:SetIsReadOnly( bIsReadOnly )
    self:CallBlueprintEvent("SetIsReadOnly", bIsReadOnly)
    self.IsReadOnly = bIsReadOnly
    return self
end

function UMG.NEditableTextMulti:GetIsReadOnly()
    return self.IsReadOnly or false
end

function UMG.NEditableTextMulti:SetJustification( eJustification )
    self:CallBlueprintEvent("SetJustification", eJustification)
    return self
end

function UMG.NEditableTextMulti:SetFont( sFont, sTypeFace )
    self:CallBlueprintEvent("SetFont", sFont, sTypeFace or "")
    return self
end

function UMG.NEditableTextMulti:SetFontSize( iFontSize )
    self:CallBlueprintEvent("SetFontSize", iFontSize)
    return self
end

function UMG.NEditableTextMulti:SetLetterSpacing( iLetterSpacing )
    self:CallBlueprintEvent("SetLetterSpacing", iLetterSpacing)
    return self
end

function UMG.NEditableTextMulti:SetSkew( fSkewAmount )
    self:CallBlueprintEvent("SetSkew", fSkewAmount)
    return self
end

function UMG.NEditableTextMulti:SetOutlineSettings( tOutlineSettings )
    self:CallBlueprintEvent("SetOutlineSettings", tOutlineSettings)
    return self
end

function UMG.NEditableTextMulti:SetFontMaterial( sFontMaterial )
    self:CallBlueprintEvent("SetFontMaterial", sFontMaterial)
    return self
end