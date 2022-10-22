-- shbobo shnth library
-- by @cfd90
--
-- Supported event types: 
--
--   bar, corp, wind (-1 to 1)
--   major, minor (1 = pressed, 0 = unpressed)
--
-- Usage:
--
--   local shnth = include("shnth/lib/shnth")
--
--   function init()
-- 	   device = hid.connect(1)
-- 	   device.event = shnth.event
--   end
--
--   shnth.bar = function(n, d)
-- 	   print("bar " .. n .. " squished at depth " .. d)
--   end

local shnth = {}

function shnth.event(typ, code, val)
  -- Normalize value from -1 to 1.
  v = val / 127
  
  if code == 0 then
    shnth.bar(1, v)
  elseif code == 1 then
    shnth.bar(2, v)
  elseif code == 2 then
    shnth.bar(3, v)
  elseif code == 3 then
    shnth.bar(4, v)
  elseif code == 4 then
    shnth.corp(1, v)
  elseif code == 5 then
    shnth.corp(2, v)
  elseif code == 6 then
    shnth.wind(v)
  elseif code == 304 then
    shnth.major(1, val)
  elseif code == 305 then
    shnth.minor(1, val)
  elseif code == 306 then
    shnth.major(2, val)
  elseif code == 307 then
    shnth.minor(2, val)
  elseif code == 308 then
    shnth.major(3, val)
  elseif code == 309 then
    shnth.minor(3, val)
  elseif code == 310 then
    shnth.major(4, val)
  elseif code == 311 then
    shnth.minor(4, val)
  end
end

function shnth.bar(n, d)
  orgn.noteOn(61, mu.note_num_to_freq(61), ((d or 127/127)*0.2 + 0.85)
end


-- local m = midi.connect()
-- m.event = function(data)
--     local msg = midi.to_msg(data)

--     if msg.type == "note_on" then
--         --TODO: velocity range params
--         orgn.noteOn(msg.note, mu.note_num_to_freq(msg.note), ((msg.vel or 127)/127)*0.2 + 0.85)
--     elseif msg.type == "note_off" then
--         orgn.noteOff(msg.note)
--     end
-- end

-- return m

function shnth.corp(n, d)
  -- corp input, always firing
  -- n corp index
  -- d corp depth
end

function shnth.major(n, z)
  -- major buttons, fires on touch
  -- n button index
  -- z button state
end

function shnth.minor(n, z)
  -- minor buttons, fires on touch
  -- n button index
  -- z button state
end

function shnth.wind(d)
  -- wind input, always firing
  -- d wind depth
end

return shnth
