local a = LocalPlayer()
local b = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
    "q",
    "w",
    "e",
    "r",
    "t",
    "y",
    "u",
    "i",
    "o",
    "p",
    "a",
    "s",
    "d",
    "f",
    "g",
    "h",
    "j",
    "k",
    "l",
    "z",
    "x",
    "c",
    "v",
    "b",
    "n",
    "m"
}
local function c()
    http.Fetch(
        "https://randomuser.me/api/",
        function(d)
            local d = assert(util.JSONToTable(d))
            local e = d["results"][1].name.first .. d["results"][1].name.last
            for f in string.gmatch(e, ".") do
                if not table.HasValue(b, string.lower(f)) then
                    c()
                    return
                end
            end
            if _G.rp then
                rp.RunCommand("rpname", e)
            else
                a:ConCommand("say /rpname " .. e)
            end
        end
    )
end
concommand.Add("randomname", c)
