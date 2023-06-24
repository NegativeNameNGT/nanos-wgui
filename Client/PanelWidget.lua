WGui.PanelWidget = WGui.BaseWidget.Inherit("PanelWidget")

local NativeDestroy = WGui.PanelWidget.Destroy

function WGui.PanelWidget:Destroy()
    local tPanelChildren = self:GetAllChildren()
    for _,v in pairs(tPanelChildren) do
        v:Destroy()
    end
    NativeDestroy(self)
end

function WGui.PanelWidget:GetAllChildren()
    return self:GetValue("INTERNAL_Children", {})
end

function wgui_raw_addslot(self, eChild)
    local tChildSlot = GetChildSlot(self.ChildSlot)
    for k,v in pairs(tChildSlot.Methods) do
        eChild[k] = v
    end
    local tSlotData = eChild.Slot
    if tSlotData and tSlotData.Parent == self:GetID() then
        eChild.Slot = tSlotData
    else
        eChild.Slot = { Parent = self:GetID() }
    end
end

function wgui_raw_add(self, eChild)
    local tChildren = self:GetAllChildren()

    local iIndex = #tChildren + 1
    tChildren[ iIndex ] = eChild
    self:SetValue("INTERNAL_Children", tChildren)

    eChild.ChildrenID = iIndex
    eChild.Parent = self
end

function wgui_raw_removeslot(self, eChild)
    if self.ChildSlot then
        local tChildSlot = GetChildSlot(eChild.Parent.ChildSlot)
        for k,_ in pairs(tChildSlot.Methods) do
            eChild[k] = nil
        end

        for k,v in pairs(WGui.BaseWidget.Overridables) do
            if not eChild[k] then
                 eChild[k] = v
            end
        end
    end
end

function wgui_raw_remove(self, eChild)
    local tChildren = self:GetAllChildren()
    tChildren[eChild.ChildrenID] = nil
    self:SetValue("INTERNAL_Children", tChildren)

    eChild.ChildrenID = nil
    eChild.Parent = nil
end

function WGui.PanelWidget:Add(eChild, tParameters)
    -- Checks if the panel reached the children limit
    if self.ChildrenLimit then
        if #self:GetAllChildren() >= self.ChildrenLimit then
            assert(false, "Cannot add more children to this panel widget, limit reached.")
            return
        end
    end

    if tParameters then
        self:CallBlueprintEvent("AddChildOverride", eChild, table.unpack(tParameters))
    else
        self:CallBlueprintEvent("AddChild", eChild)
    end

    -- Remove old slot functions from the child
    if eChild.Parent then wgui_raw_removeslot(self, eChild) end

    -- Add slot functions to the child
    if self.ChildSlot then wgui_raw_addslot(self, eChild) end

    wgui_raw_add(self, eChild)

    if eChild.OnAdded then
        eChild.OnAdded(self)
    end
    return self
end

function WGui.PanelWidget:RemoveChild(eChild)
    wgui_raw_removeslot(self, eChild)
    wgui_raw_remove(self, eChild)

    self:CallBlueprintEvent("RemoveChild", eChild)
    return self
end

function WGui.PanelWidget:RemoveChildAt(iIndex)
    local tChildren = self:GetAllChildren()
    local eChild = tChildren[iIndex]
    if eChild then
        self:RemoveChild(eChild)
    end
    return self
end

function WGui.PanelWidget:GetChildIndex(eChild)
    return eChild.ChildrenID or -1
end

function WGui.PanelWidget:GetChildAt(iIndex)
    local tChildren = self:GetAllChildren()
    return tChildren[iIndex]
end

function WGui.PanelWidget:ClearChildren()
    local tPanelChildren = self:GetAllChildren()
    for _,v in pairs(tPanelChildren) do
        self:RemoveChild(v)
    end
    return self
end