_G.st8 = require("libs.st8.st8")

_G.buttons = require("tools.buttons")

local states = require("srcs.states")

function love.load()
    st8.push(states.MAIN)
end

function love.update(dt)
    st8.update(dt)
end

function love.draw()
    st8.draw()
end