# NotesHierarchyExtractor

**NotesHierarchyExtractor** is a project designed to extract and organize folder structures from the Apple Notes app into hierarchical formats. This repository includes tools for exporting folder data and converting it into readable and structured formats for further processing or visualization.

## Features

- **AppleScript: FindRootFolders.applescript**
  - Displays only the root folders from the Apple Notes app.

- **AppleScript: ExtractFolders.applescript**
  - Extracts all folders and their hierarchical relationships from the Notes app into a plain text file.

- **Python Script: hierarchy_script.py**
  - Converts the exported plain text data into:
    - A **human-readable hierarchical structure** in TXT format.
    - A **structured JSON representation** for further use in applications.

## Getting Started

### Prerequisites

- macOS with Apple Notes app.
- Python 3.x installed.

### Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/Clustmart/NotesHierarchyExtractor.git
   cd NotesHierarchyExtractor
   ```
2. Run the ExtractFolders.applescript to extract folder data:
   - Open `ExtractFolders.applescript` in the Script Editor and run it.
   - The output is saved on Desktop as `NotesHierarchy.txt`.
3. Run the Python script to process the extracted data:
   ```bash
   python hierarchy_script.py
   ```

## Outputs
**AppleScript: ExtractFolders.applescript**
- `NotesHierarchy.txt`: A text file describing each folder (as root folder or inside another)
- `FormattedNotesHierarchy.txt`: A human-readable hierarchical structure.
- `FormattedNotesHierarchy.json`: A JSON representation of the folder hierarchy.

## File Descriptions

1. **FindRootFolders.applescript**
   - Displays only the root-level folders from the Notes app.

2. **ExtractFolders.applescript**
   - Extracts the full folder structure from the Notes app.

3. **hierarchy_script.py**
   - Processes the extracted data and generates TXT and JSON outputs.

## Example Output

### Formatted TXT
```
- Folder 1
  - Subfolder 1.1
  - Subfolder 1.2
- Folder 2
  - Subfolder 2.1
    - Subfolder 2.1.1
```

### JSON
```json
{
  "Folder 1": {
    "subfolders": {
      "Subfolder 1.1": {"subfolders": {}},
      "Subfolder 1.2": {"subfolders": {}}
    }
  },
  "Folder 2": {
    "subfolders": {
      "Subfolder 2.1": {
        "subfolders": {
          "Subfolder 2.1.1": {"subfolders": {}}
        }
      }
    }
  }
}
```

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue for improvements.

## License

This project is licensed under the MIT License.
