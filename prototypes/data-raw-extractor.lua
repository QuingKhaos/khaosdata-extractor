local serializer = require("__khaosdata-extractor__.common.serializer")

--- Sorts the types in the list alphabetically.
--- @generic T
--- @param list table<string, T>
--- @return string[] # A sorted list of types.
local function sort_list(list)
  local sorted_list = {}
  for key, _ in pairs(list) do
    table.insert(sorted_list, key)
  end

  table.sort(sorted_list)

  return sorted_list
end

--- Splits `data.raw` into separate files for each type and name and generates init files.
--- @param data_raw data.raw The `data.raw` table to process.
return function(data_raw)
  local sorted_types = sort_list(data_raw)
  local type_init_content = "--- @type data.raw\nreturn {\n"

  for _, type in ipairs(sorted_types) do
    local sorted_names = sort_list(data_raw[type])
    local name_init_content = "return {\n"

    for _, name in ipairs(sorted_names) do
      local prototype = data_raw[type][name]
      helpers.write_file("khaosdata-extractor/prototypes/data-raw/" .. type .. "/" .. name .. ".lua", serializer.serialize(prototype --[[@as table<string, any>]]) .. "\n")
      name_init_content = name_init_content .. '  ["' .. name .. '"] = require("___KHAOSDATA___.prototypes.data-raw.' .. type .. "." .. name .. '"),\n'
    end

    name_init_content = name_init_content .. "}\n"
    helpers.write_file("khaosdata-extractor/prototypes/data-raw/" .. type .. "/init.lua", name_init_content)

    type_init_content = type_init_content .. '  ["' .. type .. '"] = require("___KHAOSDATA___.prototypes.data-raw.' .. type .. '"),\n'
  end

  type_init_content = type_init_content .. "}\n"
  helpers.write_file("khaosdata-extractor/prototypes/data-raw/init.lua", type_init_content)
end
