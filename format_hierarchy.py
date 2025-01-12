from collections import defaultdict
import json
import os

# File paths
input_file = os.path.expanduser("~/Desktop/NotesHierarchy.txt")
output_file = os.path.expanduser("~/Desktop/FormattedNotesHierarchy.txt")
output_file_json = os.path.expanduser("~/Desktop/FormattedNotesHierarchy.json")


def build_hierarchy(data):
    hierarchy = defaultdict(lambda: {"subfolders": {}})

    for line in data:
        if "is a root folder in account" in line:
            folder, account = line.split(" is a root folder in account ")
            hierarchy[folder.strip()]["account"] = account.strip()
            hierarchy[folder.strip()]["subfolders"] = {}
        elif "is inside folder" in line:
            folder, parent = line.split(" is inside folder ")
            folder = folder.strip()
            parent = parent.strip()

            parent_dict = hierarchy
            for part in parent.split("/"):
                parent_dict = parent_dict[part]["subfolders"]
            parent_dict[folder] = {"subfolders": {}}

    return hierarchy


def format_hierarchy(hierarchy, indent=0):
    formatted = ""
    for folder, content in hierarchy.items():
        formatted += "  " * indent + f"- {folder}\n"
        if content["subfolders"]:
            formatted += format_hierarchy(content["subfolders"], indent + 1)
    return formatted


# Read input file
with open(input_file, "r") as file:
    lines = [line.strip() for line in file.readlines()]

# Build the hierarchy
hierarchy = build_hierarchy(lines)

# Format the hierarchy
formatted_hierarchy = format_hierarchy(hierarchy)

# Save formatted hierarchy to a text file
with open(output_file, "w") as formatted_file:
    formatted_file.write(formatted_hierarchy)

print(f"Formatted hierarchical file saved to {output_file}")

# Save the hierarchy as JSON
with open(output_file_json, "w") as json_file:
    json.dump(hierarchy, json_file, indent=4)

print(f"Hierarchical JSON file saved to {output_file_json}")
