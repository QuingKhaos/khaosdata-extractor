local serializer = require("__khaosdata-extractor__.common.serializer")

local extracted_settings = serializer.serialize(data.raw) .. "\n"

data.extend({
  {
    type = "string-setting",
    name = "khaosdata-extractor-extracted-settings",
    setting_type = "startup",
    default_value = extracted_settings,
    allowed_values = {extracted_settings},
    hidden = true,
  }
})
