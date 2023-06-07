WGui.NImage = WGui.Inherit(WGui.BaseWidget, "NImage")

function WGui.NImage:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Image" )
    return self
end

function WGui.NImage:SetBrush( tBrush )
    if not self.Brush then self.Brush = {} end

    self:CallBlueprintEvent("SetBrush", tBrush)
    self.Brush = tBrush
    return self
end

function WGui.NImage:GetBrush()
    return self.Brush or {}
end