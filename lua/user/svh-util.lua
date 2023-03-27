--[[ local inspect = require 'inspect' ]]

local M = {}

-- see if the file exists
local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

local function linesplit (inputstr, sep)
  sep = sep or ','
  local t={}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
          table.insert(t, str:match( "^%s*(.-)%s*$" ))
  end
  return t
end

local function expand_homedir(path)
  local tilde = '~'
  if path:sub(1, #tilde) == tilde then
    path = os.getenv('HOME') .. path:sub(2, #path)
  end
  return path
end
-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
-- splits at sep (default: comma)
function M.lines_from(file, sep)
  file = expand_homedir(file)
  if not file_exists(file) then return {} end
  local lines = {}
  local token = {}
  for line in io.lines(file) do
    token = linesplit(line, sep)
    table.insert(lines,token)
  end
  return lines
end

-- tests the functions above
--[[ local file = os.getenv('HOME') .. '/snippets_private.txt' ]]
--[[ local lines = M.lines_from(file) ]]
--[[ print(inspect(lines)) ]]
--[[ print(expand_homedir('~/snippets_private.txt')) ]]
--[[ print(expand_homedir('/etc/snippets_private.txt')) ]]

return M
