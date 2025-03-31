#Requires AutoHotkey v2.0

IsTinyTaskPlaying() {
    ProcessId := WinGetPID("ahk_exe TinyTask.exe")
    if (!ProcessId)
        return false
        
    hProc := DllCall("OpenProcess", "UInt", 0x438, "Int", false, "UInt", ProcessId, "Ptr")
    if (!hProc)
        return false
    
    ; Check the first address (0x0406A09)
    playbackFlagAddress1 := 0x0406A09
    playbackState1 := 0
    DllCall("ReadProcessMemory", "Ptr", hProc, "Ptr", playbackFlagAddress1, 
            "UCharP", &playbackState1, "UPtr", 1, "UPtr*", 0)
    
    ; Check the second address (0x0406A08)
    playbackFlagAddress2 := 0x0406A08
    playbackState2 := 0
    DllCall("ReadProcessMemory", "Ptr", hProc, "Ptr", playbackFlagAddress2, 
            "UCharP", &playbackState2, "UPtr", 1, "UPtr*", 0)
    
    DllCall("CloseHandle", "Ptr", hProc)
    
    ; Return true if either address shows playback is active
    ; (when values change from 0 to something else)
    return (playbackState1 != 0 || playbackState2 != 0)
}


; CheckTinyTaskStatus() {
;     if (IsTinyTaskPlaying())
;         MsgBox("TinyTask is currently playing")
;     else
;         MsgBox("TinyTask is not playing")
; }


IsTinyTaskPlaying()