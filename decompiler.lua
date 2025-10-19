local obfuscatedCode = game:HttpGet("https://raw.githubusercontent.com/nazarpetro897-del/gtddd5/refs/heads/main/gtdfixx33s.lua")
local func = loadstring(obfuscatedCode)
if func then
    print("✓ Script loaded!")
    if decompile then
        local success, decompiled = pcall(decompile, func)
        if success then
            print("✓ Decompiled!\n")
            print(decompiled)
            if setclipboard then
                setclipboard(decompiled)
                print("\n✓ Copied to clipboard!")
            end
        else
            warn("✗ Failed:", decompiled)
        end
    else
        warn("✗ decompile() not available")
    end
else
    warn("✗ Failed to load")
end