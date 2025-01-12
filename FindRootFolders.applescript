tell application "Notes"
    set rootFolders to {}
    set accountList to accounts -- Get all accounts (e.g., iCloud, On My Mac)
    
    repeat with acc in accountList
        set accountFolders to folders of acc -- Top-level folders in the account
        repeat with folderItem in accountFolders
            set end of rootFolders to folderItem
        end repeat
    end repeat
    
    -- Display root folder names
    repeat with rootFolder in rootFolders
        log acc & "Root Folder: " & name of rootFolder
    end repeat
end tell
