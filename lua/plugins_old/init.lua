-- Main module table to hold plugin configurations
local M = {}

---Process a single module by requiring it and calling its config function
---@param module_path string The require path for the module
---@param module_name string The name of the module (for error reporting)
---@param source_file string The full file path (for error reporting)
local function process_module(module_path, module_name, source_file)
  -- Attempt to require the module
  local ok, module = pcall(require, module_path)
  if not ok then
    error(string.format("Failed to load module '%s' from file '%s': %s", module_path, source_file, module), 2)
  end

  -- Validate module interface
  if type(module) ~= 'table' or type(module.register) ~= 'function' then
    error(
      string.format(
        [[
UNEXPECTED INTERFACE:
All plugin modules should export an object containing at least a `register` function property. 
Signature: fun(modules:table): nil
However, import %s (path: %s) is exporting a %s instance
File: %s
            ]],
        module_name,
        module_path,
        type(module),
        source_file
      ),
      2
    )
  end

  -- Call the module's config function with our module table
  local ok2, err = pcall(module.register, M)
  if not ok2 then
    error(string.format("Error executing config function for module '%s': %s", module_path, err), 2)
  end
end

---Convert a file path to a require path
---@param file_path string The full path to the file
---@return string require_path The path to use with require()
local function file_to_require_path(file_path)
  -- Match everything after 'lua/' and before '.lua'
  local require_path = file_path:match 'lua/(.+)%.lua$'
  -- Convert directory separators to dots
  require_path = require_path:gsub('/', '.')
  return require_path
end

---Recursively scan a directory for Lua files and process them
---@param dir string The directory to scan
local function scan_directory(dir)
  -- Get all Lua files in current directory
  -- false: don't escape wildcards
  -- true: return a table instead of a string
  local files = vim.fn.glob(dir .. '/*.lua', false, true)

  -- Get all directories (including trailing slash)
  local dirs = vim.fn.glob(dir .. '/*/', false, true)

  -- Process all Lua files in current directory
  for _, file in ipairs(files) do
    -- Get just the filename without path
    local filename = vim.fn.fnamemodify(file, ':t')

    -- Skip init.lua files as they're typically used for directory-level modules
    if filename ~= 'init.lua' then
      -- Extract module name (filename without .lua)
      local module_name = filename:match '^(.+)%.lua$'
      -- Convert file path to require path
      local require_path = file_to_require_path(file)
      -- Process this module
      process_module(require_path, module_name, file)
    end
  end

  -- Recursively process all subdirectories
  for _, subdir in ipairs(dirs) do
    -- Remove trailing slash for consistency
    scan_directory(subdir:sub(1, -2))
  end
end

-- Get the directory of the current file (this init.lua)
local current_file = debug.getinfo(1, 'S').source:sub(2)
local current_dir = vim.fn.fnamemodify(current_file, ':h')

-- Start recursive scan from current directory
local ok, err = pcall(scan_directory, current_dir)
if not ok then
  error('Failed to scan plugin directories: ' .. err, 2)
end

return M
