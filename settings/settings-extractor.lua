local serializer = require("__khaosdata-extractor__.common.serializer")

--- Writes `settings` to file
--- @param settings table<string, any> Struct for settings
--- @return nil
return function(settings)
  helpers.write_file("khaosdata-extractor/settings/settings.lua", serializer.serialize(settings) .. "\n")
end
