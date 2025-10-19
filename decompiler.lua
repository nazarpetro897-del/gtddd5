local obfuscatedCode = game:HttpGet("https://raw.githubusercontent.com/nazarpetro897-del/gtddd5/refs/heads/main/gtdfixx33s.lua")

print("Downloaded script, loading...")

local success, func = pcall(loadstring, obfuscatedCode)

if success and func then
    print("✓ Script loaded successfully!")
    
    -- Create a LocalScript instance to hold the function
    local tempScript = Instance.new("LocalScript")
    tempScript.Name = "TempDecompilerScript"
    
    -- Some executors need the script to be parented
    tempScript.Parent = game:GetService("CoreGui")
    
    if decompile then
        print("Attempting to decompile...")
        
        -- Try different decompile methods
        local decompiled
        local decompileSuccess = false
        
        -- Method 1: Direct decompile
        decompileSuccess, decompiled = pcall(function()
            return decompile(tempScript)
        end)
        
        if not decompileSuccess then
            -- Method 2: Try with the function directly
            decompileSuccess, decompiled = pcall(function()
                return debug.getinfo(func).source
            end)
        end
        
        if decompileSuccess and decompiled then
            print("✓ Decompiled successfully!\n")
            print("=== DECOMPILED CODE ===\n")
            print(decompiled)
            
            if setclipboard then
                setclipboard(decompiled)
                print("\n✓ Copied to clipboard!")
            end
        else
            warn("✗ Decompile failed. Trying alternative method...")
            
            -- Method 3: Just run it and see what it creates
            print("Executing script to see what it does...")
            local execSuccess, execResult = pcall(func)
            
            if execSuccess then
                print("✓ Script executed successfully")
                print("Check what was created in the game!")
            else
                warn("✗ Execution failed:", execResult)
            end
        end
        
        tempScript:Destroy()
    else
        warn("✗ decompile() function not available in your executor")
        tempScript:Destroy()
    end
else
    warn("✗ Failed to load script:", func)
end
