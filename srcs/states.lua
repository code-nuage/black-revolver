local States = {}

States.MAIN = st8:new("Test")
States.MAIN.buttons = {
    PLAY = buttons:new(love.graphics.getWidth() / 2 - 64, love.graphics.getHeight() / 2, 128, 64, nil, "Play"),
    QUIT = buttons:new(love.graphics.getWidth() / 2 - 64, love.graphics.getHeight() / 2 + 128, 128, 64, nil, "Quit")
}

function States.MAIN:update(dt)
    if States.MAIN.buttons.PLAY:is_clicked(1) then
        print("Play")
    end
    if States.MAIN.buttons.QUIT:is_clicked(1) then
        print("Quit")
    end

    -- print(States.MAIN.buttons.PLAY:is_hovered())
end

function States.MAIN:draw()
    for _, v in pairs(States.MAIN.buttons) do
        v:draw()
    end
end

return States