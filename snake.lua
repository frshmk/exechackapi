local squarew=15
local snake={headx=350/2,heady=500/2,dirx=0,diry=0,length=0,tail={}}
local egg={x=0,y=0}
local speed=200
local score=0
local function MoveEgg()
egg.x=math.Round(math.random(20,500-20))
egg.y=math.Round(math.random(20,350-350*0.125))
end
MoveEgg()
local function Restart()
speed=200
score=0
snake={headx=350/2,heady=500/2,dirx=0,diry=0,length=0,tail={}}
MoveEgg()
end
local function Eat()
snake.length=snake.length+squarew
MoveEgg()
speed=math.min(speed*1.02,600)
score=score+math.Round(speed/150)
end
snakey=vgui.Create("DFrame")
snakey:SetSize(500,350)
snakey:Center()
snakey:SetTitle("Snake")
snakey:SetDraggable(true)
snakey:MakePopup()
snakey.Paint=function(_,w,h)
	draw.RoundedBox(0,0,0,w,h,Color(50,50,50,255))
local up, down, left, right = input.IsKeyDown(KEY_UP), input.IsKeyDown(KEY_DOWN), input.IsKeyDown(KEY_LEFT), input.IsKeyDown(KEY_RIGHT)
if (up or down) and (snake.diry == 0) then
snake.diry = (up) and -1 or 1
snake.dirx = 0
elseif (left or right) and (snake.dirx == 0) then
snake.dirx = (left) and -1 or 1
snake.diry = 0
end
table.insert(snake.tail, 1, {x = snake.headx, y = snake.heady})
if #snake.tail > snake.length then
table.remove(snake.tail, #snake.tail)
end
local changex = snake.dirx * speed * FrameTime()
local changey = snake.diry * speed * FrameTime()
snake.headx = snake.headx + changex
snake.heady = snake.heady + changey
if (snake.headx <= 0) or (snake.heady <= 0) or (snake.heady + squarew >= 350) or (snake.headx + squarew >= 500) then
Restart()
end
if (egg.x <= snake.headx + squarew) and (snake.headx <= egg.x + squarew) and (egg.y <= snake.heady + squarew) and (snake.heady <= egg.y + squarew) then
Eat()
end
local col = math.abs(math.sin(CurTime() * 2.5))
surface.SetDrawColor(120 + (135 * col), 50, 0, 255)
surface.DrawRect(egg.x, egg.y, squarew, squarew)
surface.SetDrawColor(255,100,150,255)
for i = 1, #snake.tail do
local tile = snake.tail[i]
if not tile then break end
surface.DrawRect(tile.x, tile.y, squarew, squarew)
if (i > squarew*3) and (tile.x >= snake.headx) and (tile.x <= snake.headx + squarew) and (tile.y >= snake.heady) and (tile.y <= snake.heady + squarew) then -- trust me
Restart()
end
end
surface.SetDrawColor(255,200,200,255)
surface.DrawRect(snake.headx, snake.heady, squarew, squarew)
draw.SimpleText("Score: "..score,"DermaLarge",10,30,Color(255,255,255))
end

-- vk.com/urbanichka
