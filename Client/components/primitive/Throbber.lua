UMG.NThrobber = UMG.Inherit(UMG.BaseWidget, "NThrobber")

function UMG.NThrobber:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Throbber" )
    return self
end

function UMG.NThrobber:SetBrush( tBrush )
    self:CallBlueprintEvent("SetBrush", tBrush)
    return self
end

function UMG.NThrobber:SetNumberOfPieces( iNumberOfPieces )
    self:CallBlueprintEvent("SetNumberOfPieces", iNumberOfPieces)
    return self
end

function UMG.NThrobber:SetAnimateHorizontally( bAnimateHorizontally )
    self:CallBlueprintEvent("SetAnimateHorizontally", bAnimateHorizontally)
    return self
end

function UMG.NThrobber:SetAnimateVertically( bAnimateVertically )
    self:CallBlueprintEvent("SetAnimateVertically", bAnimateVertically)
    return self
end

function UMG.NThrobber:SetAnimateOpacity( bAnimateOpacity )
    self:CallBlueprintEvent("SetAnimateOpacity", bAnimateOpacity)
    return self
end