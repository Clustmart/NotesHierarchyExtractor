tell application "Notes"
	-- Get all top-level folders
	set topLevelFolders to every folder
	
	-- Recursively build a hierarchy string
	set folderHierarchy to my listFolders(topLevelFolders, 0)
	
	-- Choose a file path on the Desktop (change if you want a different location)
	set exportFilePath to (path to desktop as text) & "NotesFolderHierarchy.txt"
	
	-- Write the hierarchy to the text file
	my writeToFile(folderHierarchy, exportFilePath, false)
	display dialog "Folder structure was exported"
	
end tell


-- Recursively walk through each folder and its children
on listFolders(folders, indentLevel)
	set hierarchyText to ""
	set rootFolders to folders
	repeat with f in rootFolders
		set folderName to name of f
		set indent to my repeatChar(" ", indentLevel)
		set noteID to id of f
		-- set hierarchyText to hierarchyText & indent & folderName & " applenotes://note/" & noteID & return
		set hierarchyText to hierarchyText & indent & folderName & return
		
		-- display dialog "New folder: " & folderName
		-- Check if nested folders are supported
		
		set subFolders to folder of f
		set xcount to count subFolders
		if xcount > 0 then
			set hierarchyText to hierarchyText & my listFolders(subFolders, indentLevel + 2)
		end if
		
	end repeat
	return hierarchyText
end listFolders


-- Helper to write text content to a file
on writeToFile(theText, filePath, appendData)
	set theFile to POSIX file filePath
	set theOpenedFile to open for access filePath with write permission
	if appendData is false then set eof of theOpenedFile to 0
	write theText to theOpenedFile starting at eof
	close access theOpenedFile
end writeToFile


-- Helper to repeat a character for indentation
on repeatChar(theChar, xcount)
	set theString to ""
	repeat xcount times
		set theString to theString & theChar
	end repeat
	return theString
end repeatChar