-- Dump all REAPER actions (id<TAB>name) per section to actions.tsv next to this script
local dir = debug.getinfo(1, "S").source:match("^@(.*)/") or "."
local out = assert(io.open(dir .. "/actions.tsv", "w"))
out:write("section\tid\tname\n")
for _, sec in ipairs({{0, "main"}, {32060, "midi_editor"}}) do
  local s = reaper.SectionFromUniqueID(sec[1])
  local i = 0
  while true do
    local cmd, name = reaper.kbd_enumerateActions(s, i)
    if cmd == 0 then break end
    local named = reaper.ReverseNamedCommandLookup(cmd)
    out:write(sec[2], "\t", named and ("_" .. named) or cmd, "\t", name, "\n")
    i = i + 1
  end
end
out:close()
