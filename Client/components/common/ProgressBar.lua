WGui.NProgressBar = WGui.Inherit(WGui.BaseWidget, "NProgressBar")

function WGui.NProgressBar:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_ProgressBar" )
    return self
end

function WGui.NProgressBar:SetBrush( tBrushNormal, tBrushFill, tBrushMarquee, bEnableFillAnimation )
    if not self.Brush then self.Brush = {} end

    local tBrush = self:GetBrush()

    self:CallBlueprintEvent("SetBrush", tBrushNormal or {}, tBrushFill or {}, tBrushMarquee or {}, bEnableFillAnimation or false)
    self.Brush = {
        Normal = tBrushNormal or tBrush.Normal,
        Fill = tBrushFill or tBrush.Fill,
        Marquee = tBrushMarquee or tBrush.Marquee,
        EnableFillAnimation = bEnableFillAnimation or tBrush.EnableFillAnimation,
    }
    return self
end

function WGui.NProgressBar:GetBrush()
    return self.Brush or {}
end

function WGui.NProgressBar:SetFillColor( tFillColor )
    self:CallBlueprintEvent("SetFillColor", tFillColor)
    return self
end

function WGui.NProgressBar:SetPercent( fPercent )
    self.Percent = fPercent
    self:CallBlueprintEvent("SetPercent", fPercent)
    return self
end

function WGui.NProgressBar:GetPercent()
    return self.Percent or 0.68
end

function WGui.NProgressBar:SetIsMarquee( bIsMarquee )
    self:CallBlueprintEvent("SetIsMarquee", bIsMarquee)
    return self
end

function WGui.NProgressBar:SetBarFillStyle( iProgressBarFillStyle )
    self:CallBlueprintEvent("SetBarFillStyle", iProgressBarFillStyle)
    return self
end

function WGui.NProgressBar:SetBarFillType( iProgressBarFillType )
    self:CallBlueprintEvent("SetBarFillType", iProgressBarFillType)
    return self
end

function WGui.NProgressBar:SetBorderPadding( tBorderPadding )
    self:CallBlueprintEvent("SetBorderPadding", tBorderPadding)
    return self
end