local serializer = require("__khaosdata-extractor__.common.serializer")

--- Writes `feature_flags` to file
--- @param feature_flags data.FeatureFlags Struct for feature flags
return function(feature_flags)
  helpers.write_file("khaosdata-extractor/prototypes/feature-flags.lua", "--- @type data.FeatureFlags\n" .. serializer.serialize(feature_flags) .. "\n")
end
