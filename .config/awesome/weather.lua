-------------------------------------------------
-- Weather Widget based on the OpenWeatherMap
-- https://openweathermap.org/
--
-- @author Pavel Makhov
-- @link https://github.com/streetturtle/awesome-wm-widgets/blob/master/weather-widget/weather.lua
-- @copyright 2018 Pavel Makhov
-------------------------------------------------

local http = require("socket.http")
local json = require("json")
local naughty = require("naughty")
local wibox = require("wibox")

local city = os.getenv("AWW_WEATHER_CITY") or "Kolarovo,sk"
local open_map_key = os.getenv("AWW_WEATHER_API_KEY") or 'a5cda3526fa9bca508901770446fbe4e'

local temp_widget = wibox.widget{
    font = "Play 9",
    widget = wibox.widget.textbox,
}

local weather_widget = wibox.widget {
    temp_widget,
    layout = wibox.layout.fixed.horizontal,
}

-- handy function to convert temperature from Kelvin to Celcius
function to_celcius(kelvin)
    return math.floor(tonumber(kelvin) - 273.15)
end

-- Return wind direction as a string.
function to_direction(degrees)
    -- Ref: https://www.campbellsci.eu/blog/convert-wind-directions
    if degrees == nil then
        return "Unknown direction"
    end
    local directions = {
        "N",
        "NNE",
        "NE",
        "ENE",
        "E",
        "ESE",
        "SE",
        "SSE",
        "S",
        "SSW",
        "SW",
        "WSW",
        "W",
        "WNW",
        "NW",
        "NNW",
        "N",
    }
    return directions[math.floor((degrees % 360) / 22.5) + 1]
end

local weather_timer = timer({ timeout = 60 })
local resp

weather_timer:connect_signal("timeout", function ()
    local resp_json = http.request("https://api.openweathermap.org/data/2.5/weather?q=" .. city .."&appid=" .. open_map_key)
    if (resp_json ~= nil) then
        resp = json.decode(resp_json)
        temp_widget:set_text(" " .. to_celcius(resp.main.temp) .. "°C ")
    end
end)
weather_timer:start()
weather_timer:emit_signal("timeout")

-- Notification with weather information
local notification
weather_widget:connect_signal("mouse::enter", function()
    notification = naughty.notify{
        text =
            '<big>' .. resp.weather[1].main .. ' (' .. resp.weather[1].description .. ')</big><br>' ..
            '<b>Humidity:</b> ' .. resp.main.humidity .. '%<br>' ..
            '<b>Temperature: </b>' .. to_celcius(resp.main.temp) .. '<br>' ..
            '<b>Pressure: </b>' .. resp.main.pressure .. 'hPa<br>' ..
            '<b>Clouds: </b>' .. resp.clouds.all .. '%<br>' ..
            '<b>Wind: </b>' .. resp.wind.speed .. 'm/s (' .. to_direction(resp.wind.deg) .. ')',
        timeout = 5, hover_timeout = 30,
        width = 220
    }
end)
weather_widget:connect_signal("mouse::leave", function()
    naughty.destroy(notification)
end)

return weather_widget
