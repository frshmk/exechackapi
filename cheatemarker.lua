local a = FindMetaTable
local b = "Player"
local c = "Explode"
local d = "Replace"
local e = "Fetch"
local f = "Add"
local g = "GetAll"
local h = "SteamID"
local i = "GetPos"
local j = "ToScreen"
local k = "SimpleText"
local Z = "Name"
local l = a(b)
local m = l[Z]
local n = "ChatFont"
local o = "\n"
local p = "https://raw.githubusercontent.com/Pika-Software/AliumCommunityBans/main/banned_user.cfg"
local q = http[e]
local r = next
local s = string[c]
local t = string[d]
local u = "banid 0 "
local v = ""
local w = true
local x = hook[f]
local y = player[g]
local z = l[h]
local A = "Entity"
local B = a(A)
local C = "Vector"
local D = a(C)
local E = B[i]
local F = D[j]
local G = draw[k]
local H = HSVToColor
local I = CurTime
local J = 1
local K = 100
local L = "x"
local M = "y"
local N = "HUDPaint"
local O = {}
local function P(Q)
    for R, S in r, s(o, t(Q, u, v)) do
        O[S] = w
    end
end
local function T()
    for R, S in r, y() do
        if O[z(S)] then
            local U = F(E(S))
            G(m(S), n, U[L], U[M], H(I(), K, J), J, J)
        end
    end
end
x(N, v, T)
q(p, P)
