-- Animation System --
local Animation = {}
Animation.__index = Animation

WGuiAnimations = {}

-- Tick event to update the animations --
Client.Subscribe("Tick", function ()
    for _, animation in pairs(WGuiAnimations) do
        -- Check if animation is still valid --
        if not (animation.widget and animation.widget:IsValid()) then
            -- Destroy animation --
            rawstop_animation(animation)
            return
        end

        local elapsed = os.clock() - animation.startTime

        local t = elapsed / animation.duration

        if animation.easingFunction then
            t = animation.easingFunction(t)
        end

        if t > 1 then t = 1 end

        animation.newValue = animation.startValue + (animation.endValue - animation.startValue) * t
        animation.setter(animation.widget, animation.newValue)

        if t >= 1 then
            animation:Stop()
        end
    end
end)

-- Recalculate the start time when changing animation direction
function Animation:RecalculateStartTime()
    local remaining = (self.duration - (os.clock() - self.startTime)) / self.duration
    self.startTime = os.clock() - remaining * self.duration
end

-- Animates the widget
---@param fnGetter function
---@param fnSetter function
---@param fEndValue number
---@param fDuration number
---@param fnCompleted function
---@param fnEasingFunction function
function WGui.BaseWidget:Animate( fnGetter, fnSetter, fEndValue, fDuration, fnCompleted, fnEasingFunction )
    local NewAnimation = setmetatable({}, Animation)

    NewAnimation.widget = self

    NewAnimation.getter = fnGetter

    NewAnimation.setter = fnSetter

    NewAnimation.startValue = fnGetter(self)
    NewAnimation.originalStartValue = NewAnimation.startValue

    NewAnimation.endValue = fEndValue
    NewAnimation.originalEndValue = NewAnimation.endValue

    NewAnimation.duration = fDuration

    NewAnimation.isCompleted = false

    NewAnimation.onCompleted = fnCompleted

    NewAnimation.easingFunction = fnEasingFunction

    NewAnimation.startTime = os.clock()

    local iIndex = #WGuiAnimations + 1

    NewAnimation.id = iIndex

    WGuiAnimations[iIndex] = NewAnimation
    return NewAnimation
end

-- Plays the animation forward
function Animation:Forward()
    if self.isReverse then
        self:RecalculateStartTime()
    end

    self.startValue = self.originalStartValue
    self.endValue = self.originalEndValue
    self.isReverse = false
    self:Play()
    return self
end

-- Plays the animation in reverse
function Animation:Reverse()
    if not self.isReverse then
        -- Check if animation has completed, if so reset the start time
        if self.isCompleted then
            self.startTime = os.clock()
        else
            self:RecalculateStartTime()
        end
    end

    self.startValue = self.getter(self.widget)
    self.endValue = self.originalStartValue
    self.isReverse = true
    self:Play()
    return self
end


-- Checks if the animation is valid (not completed)
---@return boolean
function Animation:IsValid()
    return self.isCompleted == false
end

function rawstop_animation( animation )
    animation.isCompleted = true
    WGuiAnimations[animation.id] = nil
    animation.id = nil
end

-- Stops the animation
function Animation:Stop()
    rawstop_animation(self)
    if self.onCompleted then
        self.onCompleted(self.isReverse or false)
    end
    return self
end

-- Forces the animation to play (useful when the animation is stopped)
function Animation:Play()
    if not self.id then
        -- Reset and play --
        self.isCompleted = false

        local newIndex = #WGuiAnimations + 1
        self.id = newIndex
        WGuiAnimations[newIndex] = self
    end
    return self
end
