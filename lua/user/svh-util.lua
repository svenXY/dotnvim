--[[ local inspect = require 'inspect' ]]

local M = {}

-- see if the file exists
local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

local function mysplit (inputstr, sep)
  if sep == nil then
          sep = "%s"
  end
  local t={}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
          table.insert(t, str:match( "^%s*(.-)%s*$" ))
  end
  return t
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function M.lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  local token = {}
  for line in io.lines(file) do
    token = mysplit(line, ',')
    table.insert(lines,token)
  end
  return lines
end


-- tests the functions above
--[[ local file = os.getenv('HOME') .. '/snippets_private.txt' ]]
--[[ local lines = M.lines_from(file) ]]
--[[ print(inspect(lines)) ]]

return M
