local _ENV = (getgenv or getrenv or getfenv)()
local BETA_VERSION = BETA_VERSION or _ENV.BETA_VERSION

local Scripts = {
	{ GameId = 994732206, UrlPath = if BETA_VERSION then "BLOX-FRUITS-BETA.lua" else "BloxFruits.luau" },
	{ PlacesIds = {10260193230}, UrlPath = "MemeSea.luau" }
}

local fetcher, urls = {}, {}

-- Debounce tránh chạy nhiều lần
do
	local last_exec = _ENV.rz_execute_debounce
	if last_exec and (tick() - last_exec) <= 5 then return nil end
	_ENV.rz_execute_debounce = tick()
end

urls.Owner = "https://raw.githubusercontent.com/tlredz/"
urls.Repository = urls.Owner .. "Scripts/refs/heads/main/"

-- Hàm load/fetcher (Giữ nguyên logic của bạn)
local function formatUrl(Url)
	return Url:gsub("{Repository}", urls.Repository)
end

function fetcher.get(Url)
	local success, response = pcall(game.HttpGet, game, formatUrl(Url))
	return success and response or error("Failed to load: " .. Url)
end

function fetcher.load(Url)
	return loadstring(fetcher.get(Url))()
end

-- Chạy Script dựa trên game
for _, Script in Scripts do
	local isMatch = (Script.PlacesIds and table.find(Script.PlacesIds, game.PlaceId)) or (Script.GameId and Script.GameId == game.GameId)
	
	if isMatch then
		-- Tải Menu trước
		pcall(function() fetcher.load("{Repository}Menu.luau")() end)
		-- Tải Logic Game sau
		return fetcher.load("{Repository}Games/" .. Script.UrlPath)(fetcher)
	end
   end
   
