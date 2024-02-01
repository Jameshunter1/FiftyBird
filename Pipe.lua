--[[
    Pipe Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The Pipe class represents the pipes that randomly spawn in our game, which act as our primary obstacles.
    The pipes can stick out a random distance from the top or bottom of the screen. When the player collides
    with one of them, it's game over. Rather than our bird actually moving through the screen horizontally,
    the pipes themselves scroll through the game to give the illusion of player movement.
]]

Pipe = Class{}
 

-- since we only want the image loaded once, not per instantation, define it externally
    local PIPE_IMAGE = love.graphics.newImage('pipe.png')
    local PIPE_WIDTH = 40 
    local PIPE_HEIGHT = 50
    
   

function Pipe:init(orientation, y)
    

    local pipeGap = math.random(10, 125)
    local topPipeHeight = math.random(700, 1000)

    self.width = PIPE_WIDTH
    self.height = topPipeHeight
    self.orientation = orientation

    if orientation == 'top' then
        self.y = y - topPipeHeight - pipeGap - PIPE_HEIGHT
    else
        self.y = y + pipeGap
    end

    self.x = VIRTUAL_WIDTH + pipeGap

    self.remove = false
end

function Pipe:update(dt)
    -- Add update logic if needed
end
function Pipe:update(dt)
    
end

function Pipe:render()
    love.graphics.draw(PIPE_IMAGE, self.x, 
        (self.orientation == 'top' and self.y + self.height or self.y), 
        0, 1, self.orientation == 'top' and -1 or 1)
end

