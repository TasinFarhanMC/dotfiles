require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

local function get_dir()
  local str = debug.getinfo(2, "S").source:sub(2)
  return str:match "(.*/)"
end

local function require_dir(dir)
  local p = io.popen('ls "' .. get_dir() .. dir .. '"')
  for file in p:lines() do
    if file:sub(-4) == ".lua" then
      local moduleName = file:sub(1, -5) -- Remove `.lua` extension
      require(dir:gsub("/", ".") .. "." .. moduleName)
    end
  end
  p:close()
end

require_dir "mappings"

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
