WGui.NEditableTextMulti = WGui.Inherit(WGui.BaseWidget, "NEditableTextMulti" )

function WGui.NEditableTextMulti:Constructor()
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

function WGui.NEditableTextMulti:SetText( sText )
    self:CallBlueprintEvent("SetText", sText)
    self.Text = sText
    return self
end

function WGui.NEditableTextMulti:GetText()
    return self.Text or ""
end

function WGui.NEditableTextMulti:SetHintText( sHintText )
    self:CallBlueprintEvent("SetHintText", sHintText)
    self.HintText = sHintText
    return self
end

function WGui.NEditableTextMulti:GetHintText()
    return self.HintText or ""
end

function WGui.NEditableTextMulti:SetIsReadOnly( bIsReadOnly )
    self:CallBlueprintEvent("SetIsReadOnly", bIsReadOnly)
    self.IsReadOnly = bIsReadOnly
    return self
end

function WGui.NEditableTextMulti:GetIsReadOnly()
    return self.IsReadOnly or false
end

function WGui.NEditableTextMulti:SetJustification( eJustification )
    self:CallBlueprintEvent("SetJustification", eJustification)
    return self
end

function WGui.NEditableTextMulti:SetFont( sFont, sTypeFace )
    if not WGui.IsAssetRegistryLoaded() then
        WGui.QueueAsset(WGui.NEditableTextMulti.SetFont, self:GetID(), {sFont, sTypeFace})
        return self
    end

    local sAssetPath = WGui.GetAssetPath("[assets.others]", sFont)
    if string.find(sFont, "package://") then
        self:CallBlueprintEvent("SetFont", sFont, sTypeFace or "")
        return self
    end

    self:CallBlueprintEvent("SetFont", nil, sTypeFace or "", sAssetPath)
    return self
end

function WGui.NEditableTextMulti:SetFontSize( iFontSize )
    self:CallBlueprintEvent("SetFontSize", iFontSize)
    return self
end

function WGui.NEditableTextMulti:SetLetterSpacing( iLetterSpacing )
    self:CallBlueprintEvent("SetLetterSpacing", iLetterSpacing)
    return self
end

function WGui.NEditableTextMulti:SetSkew( fSkewAmount )
    self:CallBlueprintEvent("SetSkew", fSkewAmount)
    return self
end

function WGui.NEditableTextMulti:SetOutlineSettings( tOutlineSettings )
    self:CallBlueprintEvent("SetOutlineSettings", tOutlineSettings)
    return self
end

function WGui.NEditableTextMulti:SetFontMaterial( sFontMaterial )
    self:CallBlueprintEvent("SetFontMaterial", sFontMaterial)
    return self
end