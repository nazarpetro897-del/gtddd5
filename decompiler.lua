-- This will decompile all scripts currently in the game
print("=== GAME SCRIPT DECOMPILER ===\n")

local output = ""
local count = 0

for _, script in pairs(game:GetDescendants()) do
    if script:IsA("LocalScript") or script:IsA("ModuleScript") then
        count = count + 1
        
        print(string.format("[%d] Decompiling: %s", count, script:GetFullName()))
        
        output = output .. string.format("\n\n=== [%d] %s ===\n", count, script:GetFullName())
        output = output .. "Type: " .. script.ClassName .. "\n"
        output = output .. "Name: " .. script.Name .. "\n\n"
        
        if decompile then
            local success, code = pcall(decompile, script)
            
            if success then
                output = output .. "--- CODE START ---\n"
                output = output .. code
                output = output .. "\n--- CODE END ---\n"
            else
                output = output .. "✗ Failed to decompile: " .. tostring(code) .. "\n"
            end
        else
            output = output .. "✗ decompile() not available\n"
            break
        end
        
        output = output .. string.rep("=", 60) .. "\n"
    end
end

output = string.format("Found %d scripts\n", count) .. output

print("\n✓ Decompiled " .. count .. " scripts!")

if setclipboard then
    setclipboard(output)
    print("✓ Copied all decompiled code to clipboard!")
else
    print(output)
end
