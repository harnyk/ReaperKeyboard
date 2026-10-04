-- MIDI editor: move the edit cursor to the start of the item being edited
local editor = reaper.MIDIEditor_GetActive()
local take = editor and reaper.MIDIEditor_GetTake(editor)
if not take then return end
local item = reaper.GetMediaItemTake_Item(take)
reaper.SetEditCurPos(reaper.GetMediaItemInfo_Value(item, "D_POSITION"), true, false)
