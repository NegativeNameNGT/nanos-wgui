UMG.NImage = UMG.Inherit(UMG.BaseWidget, "NImage")

function UMG.NImage:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Image" )
    return self
end

function UMG.NImage:SetBrush( tBrush )
    if not self.Brush then self.Brush = {} end

    self:CallBlueprintEvent("SetBrush", tBrush)
    self.Brush = tBrush
    return self
end

function UMG.NImage:GetBrush()
    return self.Brush or {}
end