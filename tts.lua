local function a(b)
if b then
b=string.gsub(b,"\n","\r\n")
b=string.gsub(b,"([^%w ])",function(c)return string.format("%%%02X",string.byte(c))end)
b=string.gsub(b," ","+")
end
return b
end
local function d(e)
sound.PlayURL("https://tts.voicetech.yandex.net/tts?format=mp3&quality=hi&platform=web&application=translate&lang=ru_RU&speaker=zahar&emotion=neutral&text="..a(e),"mono",function()end)
end
local f=chat.AddText
chat.AddText=function(...)
local g=0
local a={}
for c,b in pairs({...})do
if isstring(b)then
a[c]=b
if b==": "then
g=c
end
if not b==":"and b:find(":")then
d(string.Explode(":",b)[2])
end
end
end
if g>0 then
d(a[g+1]or"")
end
return f(...)
end
