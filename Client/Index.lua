local tInheritedClasses = {}
local tSlots = {}
local tWidgets = {}

WGui = {
    Create = function( sClassName, eParentWidget )
        if tInheritedClasses[sClassName] then
            local eWidget = tInheritedClasses[sClassName]()

            local iIndex = #tWidgets + 1
            tWidgets[#tWidgets+1] = eWidget
            eWidget:SetBlueprintPropertyValue("ID", iIndex)
            eWidget:SetBlueprintPropertyValue("WidgetUtility", WGui.Utility)

            if eParentWidget and eParentWidget:IsValid() then
                eParentWidget:Add(eWidget)
            end

            return eWidget
        end
        assert(false, "WGui.Create: Class '" .. sClassName .. "' does not exist.")
    end,

    Inherit = function( cInheritFrom, sClassName, tCustomParameters )
        tInheritedClasses[sClassName] = cInheritFrom.Inherit(sClassName, tCustomParameters or {})
        return tInheritedClasses[sClassName]
    end,

    Utility = Blueprint(Vector(), Rotator(), "nwgui-assets::BP_WidgetUtility"),

    Anchor = {
        TopRight = { Min = Vector2D(1, 0), Max = Vector2D(1, 0), Alignment = Vector2D(1, 0) },
        TopCenter = { Min = Vector2D(0.5, 0), Max = Vector2D(0.5, 0), Alignment = Vector2D(0.5, 0) },
        TopLeft = { Min = Vector2D(0, 0), Max = Vector2D(0, 0), Alignment = Vector2D() },
        CenterRight = { Min = Vector2D(1, 0.5), Max = Vector2D(1, 0.5), Alignment = Vector2D(1, 0.5) },
        CenterCenter = { Min = Vector2D(0.5, 0.5), Max = Vector2D(0.5, 0.5), Alignment = Vector2D(0.5, 0.5) },
        CenterLeft = { Min = Vector2D(0, 0.5), Max = Vector2D(0, 0.5), Alignment = Vector2D(0, 0.5) },
        BottomRight = { Min = Vector2D(1, 1), Max = Vector2D(1, 1), Alignment = Vector2D(1, 1) },
        BottomCenter = { Min = Vector2D(0.5, 1), Max = Vector2D(0.5, 1), Alignment = Vector2D(0.5, 1) },
        BottomLeft = { Min = Vector2D(0, 1), Max = Vector2D(0, 1), Alignment = Vector2D(0, 1) },
        FilledTop = { Min = Vector2D(0, 0), Max = Vector2D(1, 0), Alignment = Vector2D(), bResetOffsetRight = true },
        FilledHCenter = { Min = Vector2D(0, 0.5), Max = Vector2D(1, 0.5), Alignment = Vector2D(0, 0.5), bResetOffsetRight = true },
        FilledVCenter = { Min = Vector2D(0.5, 0), Max = Vector2D(0.5, 1), Alignment = Vector2D(0.5, 0), bResetOffsetBottom = true },
        FilledBottom = { Min = Vector2D(0, 1), Max = Vector2D(1, 1), Alignment = Vector2D(0, 1), bResetOffsetRight = true },
        FilledRight = { Min = Vector2D(1, 0), Max = Vector2D(1, 1), Alignment = Vector2D(1, 0), bResetOffsetBottom = true },
        FilledLeft = { Min = Vector2D(0, 0), Max = Vector2D(0, 1), Alignment = Vector2D(), bResetOffsetBottom = true },
        Filled = { Min = Vector2D(0, 0), Max = Vector2D(1, 1), Alignment = Vector2D(), bResetOffsetRight = true, bResetOffsetBottom = true },  
    },

    DrawType = {
        None = 0,
        Box = 1,
        Border = 2,
        Image = 3,
        RoundedBox = 4
    },

    MirrorType = {
        NoMirror = 0,
        Horizontal = 1,
        Vertical = 2,
        Both = 3
    },

    TileType = {
        NoTile = 0,
        Horizontal = 1,
        Vertical = 2,
        Both = 3
    },

    RoundingType = {
        FixedRadius = 0,
        HalfHeightRadius = 1
    },

    TextTransformPolicy = {
        None = 0,
        ToLower = 1,
        ToUpper = 2
    },

    TextOverflowPolicy = {
        Clip = 0,
        Ellipsis = 1
    },

    TextJustify = {
        Left = 0,
        Center = 1,
        Right = 2
    },

    SizeRule = {
        Automatic = 0,
        Fill = 1
    },

    HAlign = {
        Fill = 0,
        Left = 1,
        Center = 2,
        Right = 3
    },

    VAlign = {
        Fill = 0,
        Top = 1,
        Center = 2,
        Bottom = 3
    },

    Stretch = {
        None = 0,
        Fill = 1,
        ScaleToFit = 2,
        ScaleToFitX = 3,
        ScaleToFitY = 4,
        ScaleToFill = 5,
        ScaleBySafeZone = 6,
        UserSpecified = 7,
        UserSpecifiedWithClipping = 8
    },

    StretchDirection = {
        Both = 0,
        DownOnly = 1,
        UpOnly = 2
    },

    Clipping = {
        Inherit = 0,
        ClipToBounds = 1,
        ClipToBoundsWithoutIntersecting = 2,
        ClipToBoundsAlways = 3,
        OnDemand = 4
    },

    Orientation = {
        Horizontal = 0,
        Vertical = 1
    },

    ScrollerConsumeMouseWheel = {
        WhenScrollingPossible = 0,
        Always = 1,
        Never = 2
    },

    ProgressBarFillStyle = {
        Mask = 0,
        Scale = 1
    },

    ProgressBarFillType = {
        LeftToRight = 0,
        RightToLeft = 1,
        FillFromCenter = 2,
        FillFromCenterHorizontal = 3,
        FillFromCenterVertical = 4,
        TopToBottom = 5,
        BottomToTop = 6
    },

    TextCommit  = {
        Default = 0,
        OnEnter = 1,
        OnUserMovedFocus = 2,
        OnCleared = 3
    },

    SelectInfo = {
        OnKeyPress = 0,
        OnNavigation = 1,
        OnMouseClick = 2,
        Direct = 3
    },
    
    DragPivot = {
        MouseDown = 0,
        TopLeft = 1,
        TopCenter = 2,
        TopRight = 3,
        CenterLeft = 4,
        CenterCenter = 5,
        CenterRight = 6,
        BottomLeft = 7,
        BottomCenter = 8,
        BottomRight = 9
    },

    Visibility = {
        Visible = 0,
        Collapsed = 1,
        Hidden = 2,
        NotHitTestableAll = 3,
        NotHitTestableSelf = 4
    },

    ScrollWhenFocusChanges = {
        NoScroll = 0,
        InstantScroll = 1,
        AnimatedScroll = 2
    }
}

Package.Export( "WGui", WGui )

Package.Require( "BaseWidget.lua" )

for _,v in pairs( Package.GetDirectories("Client/components/") ) do
    for _,v2 in pairs( Package.GetFiles( v, ".lua" ) ) do
        Package.Require(v2)
    end
end

Package.Require("styles/Brush.lua")

-- Slots
function RegisterChildSlot( sSlotName )
    tSlots[sSlotName] = { Methods = {} }

    return tSlots[sSlotName]
end

function GetChildSlot( sSlotName )
    return tSlots[sSlotName]
end

for _,v in pairs( Package.GetFiles( "Client/slots/", ".lua" ) ) do
    Package.Require(v)
end
