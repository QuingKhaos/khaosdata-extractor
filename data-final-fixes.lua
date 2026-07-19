local data_raw_extractor = require("__khaosdata-extractor__.prototypes.data-raw-extractor")
local mods_extractor = require("__khaosdata-extractor__.prototypes.mods-extractor")
local settings_extractor = require("__khaosdata-extractor__.prototypes.settings-extractor")
local feature_flags_extractor = require("__khaosdata-extractor__.prototypes.feature-flags-extractor")

-- fix a few core data issues, which wouldn't pass validation otherwise
require("__khaosdata-extractor__.prototypes.fixes.sticker")
require("__khaosdata-extractor__.prototypes.fixes.turret")
require("__khaosdata-extractor__.prototypes.fixes.unit-spawner")

helpers.remove_path("khaosdata-extractor")
helpers.write_file("khaosdata-extractor/settings/settings.lua", settings.startup["khaosdata-extractor-extracted-settings"].value --[[@as string]])
settings.startup["khaosdata-extractor-extracted-settings"] = nil

data_raw_extractor(data.raw)
mods_extractor(mods)
settings_extractor(settings --[[@as data.Settings]])
feature_flags_extractor(feature_flags)

helpers.write_file("khaosdata-extractor/.emmyrc.json", [[
{
    "$schema": "https://raw.githubusercontent.com/EmmyLuaLs/emmylua-analyzer-rust/refs/heads/main/crates/emmylua_code_analysis/resources/schema.json",
    "workspace": {
        "moduleMap": [
            {
                "pattern": "^(.*)$",
                "replace": "___KHAOSDATA___.$1"
            }
        ]
    }
}
]])
