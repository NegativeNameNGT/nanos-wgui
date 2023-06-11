WGui.NSizeBox = WGui.Inherit(WGui.PanelWidget, "NSizeBox", {
    ChildSlot = "SizeBoxSlot",
    ChildrenLimit = 1
})

function WGui.NSizeBox:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_SizeBox" )
    return self
end

function WGui.NSizeBox:SetWidthOverride( fValue )
    self:CallBlueprintEvent( "SetWidthOverride", fValue )
    return self
end

function WGui.NSizeBox:SetHeightOverride( fValue )
    self:CallBlueprintEvent( "SetHeightOverride", fValue )
    return self
end

function WGui.NSizeBox:SetMinDesiredWidth( fValue )
    self:CallBlueprintEvent( "SetMinDesiredWidth", fValue )
    return self
end

function WGui.NSizeBox:SetMinDesiredHeight( fValue )
    self:CallBlueprintEvent( "SetMinDesiredHeight", fValue )
    return self
end

function WGui.NSizeBox:SetMaxDesiredWidth( fValue )
    self:CallBlueprintEvent( "SetMaxDesiredWidth", fValue )
    return self
end

function WGui.NSizeBox:SetMaxDesiredHeight( fValue )
    self:CallBlueprintEvent( "SetMaxDesiredHeight", fValue )
    return self
end

function WGui.NSizeBox:SetMinAspectRatio( fValue )
    self:CallBlueprintEvent( "SetMinAspectRatio", fValue )
    return self
end

function WGui.NSizeBox:SetMaxAspectRatio( fValue )
    self:CallBlueprintEvent( "SetMaxAspectRatio", fValue )
    return self
end