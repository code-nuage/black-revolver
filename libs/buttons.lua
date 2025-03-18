local buttons = {}
buttons.__index = buttons

--+ CONSTRUCTOR +--
function buttons.new(x, y, w, h, image, text)
    local i = setmetatable(buttons, {})

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

return buttons