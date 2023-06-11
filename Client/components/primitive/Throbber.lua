WGui.NThrobber = WGui.Inherit(WGui.BaseWidget, "NThrobber")

function WGui.NThrobber:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Throbber" )
    return self
end

function WGui.NThrobber:SetBrush( tBrush )
    self:CallBlueprintEvent("SetBrush", tBrush)
    return self
end

function WGui.NThrobber:SetNumberOfPieces( iNumberOfPieces )
    self:CallBlueprintEvent("SetNumberOfPieces", iNumberOfPieces)
    return self
end

function WGui.NThrobber:SetAnimateHorizontally( bAnimateHorizontally )
    self:CallBlueprintEvent("SetAnimateHorizontally", bAnimateHorizontally)
    return self
end

function WGui.NThrobber:SetAnimateVertically( bAnimateVertically )
    self:CallBlueprintEvent("SetAnimateVertically", bAnimateVertically)
    return self
end

function WGui.NThrobber:SetAnimateOpacity( bAnimateOpacity )
    self:CallBlueprintEvent("SetAnimateOpacity", bAnimateOpacity)
    return self
end