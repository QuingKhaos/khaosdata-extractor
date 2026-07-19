local serializer = require("__khaosdata-extractor__.common.serializer")

--- Writes `settings` to file
--- @param settings data.Settings Struct for startup settings
--- @return nil
return function(settings)
  helpers.write_file("khaosdata-extractor/prototypes/settings.lua", "--- @type data.Settings\n" .. serializer.serialize(settings) .. "\n")
end
