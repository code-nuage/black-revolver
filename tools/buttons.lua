local buttons = {}
buttons.__index = buttons

--+ CONSTRUCTOR +--
function buttons:new(x, y, w, h, image, text)
    local i = setmetatable({}, buttons)

    if x and y then
        i:set_position(x, y)
    end
    if w and h then
        i:set_dimensions(w, h)
    end
    if image then
        i:set_image(image)
    end
    if text then
        i:set_text(text)
    end

    return i
end

--+ SETTERS +--
function buttons:set_position(x, y)
    self.x, self.y = x, y
    return self
end

function buttons:set_dimensions(w, h)
    self.w, self.h = w, h
    return self
end

function buttons:set_image(image)
    self.image = image
    return self
end

function buttons:set_text(text)
    self.text = text
    return self
end

--+ GETTERS +--
function buttons:get_position()
    return self.x, self.y
end

function buttons:get_dimensions()
    return self.w, self.h
end

function buttons:is_hovered()
    local mx, my = love.mouse.getPosition()
    if self.x < mx
    and self.x + self.w > mx then
        if self.y < my
        and self.y + self.h > my then
            return true
        end
    end
end

function buttons:is_clicked(click)
    if self:is_hovered()
    and love.mouse.isDown(click) then
        return true
    end
end

--+ LOVE ASSOCIATED METHODS +--
function buttons:draw()
    if self.image then
        local iw, ih = self.image:getDimensions()                                   -- Image dimensions
        local sw, sh = self.w / iw, self.h / ih                                     -- Image scaling factors to fit them in their container
        love.graphics.draw(self.image,
        self.x, self.y,
        self.w, self.h, 0,
        sw, sh)
    end
    if self.text then
        local tw, th = love.graphics.getFont():getWidth(self.text),
        love.graphics.getFont():getHeight()                                         -- Text width
        local tx, ty = self.x + (self.w / 2) - tw / 2,
        self.y + (self.h / 2) - th / 2                                              -- Bottom left text corner position
        love.graphics.print(self.text, tx, ty)
    end
end

return buttons