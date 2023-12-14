local M = {}

function M.partial(func, ...)
  local args = { ... }
  return function(...)
    local allArgs = {}
    local n = 1
    for i = 1, #args do
      if args[i] == nil then
        allArgs[i] = select(n, ...)
        n = n + 1
      else
        allArgs[i] = args[i]
      end
    end
    for i = n, select("#", ...) do
      table.insert(allArgs, select(i, ...))
    end
    return func(unpack(allArgs))
  end
end

function M.lazy_require(moduleName)
  return setmetatable({}, {
    __index = function(self, key)
      return function(...)
        local module = require(moduleName)
        return module[key](...)
      end
    end,
  })
end

function M.partial_require(mod, name, ...)
  return M.partial(M.lazy_require(mod)[name], ...)
end

return M
