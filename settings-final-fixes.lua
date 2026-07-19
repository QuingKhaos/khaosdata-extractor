local serializer = require("__khaosdata-extractor__.common.serializer")

data.extend({
  {
    type = "string-setting",
    name = "khaosdata-extractor-extracted-settings",
    setting_type = "startup",
    default_value = serializer.serialize(data.raw) .. "\n",
    hidden = true,
  }
})
