local servers = {
  "pyright",
  "cmake",
  "bashls",
  -- "asm_lsp",
  "svelte",
  "ts_ls",
  "html",
  "cmake",
  "rust_analyzer",
  "arduino_language_server",
  "clangd",
  -- "eslint",
  -- "java_language_server",
  -- "kotlin_language_server",
}

local ignore_install = {
  "clangd",
  "rust_analyzer",
  "arduino_language_server",
}

local function subtract_tables(a, b)
  local b_set = {}
  for _, v in ipairs(b) do
    b_set[v] = true
  end

  local result = {}
  for _, v in ipairs(a) do
    if not b_set[v] then
      table.insert(result, v)
    end
  end
  return result
end

return {
  servers = servers,
  ignore_install = ignore_install,
  ensure_install = subtract_tables(servers, ignore_install),
}
