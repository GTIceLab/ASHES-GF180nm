input_file_path = "./chip.lef"
output_file_path = "./chip_fixed.lef"

def convert_blockages(content):
    # Split the content by lines
    lines = content.splitlines()

    # To store the converted content
    converted_lines = []

    for line in lines:
        stripped_line = line.strip()

        if stripped_line.startswith("RESISTANCE"):
           converted_lines.append("#"+line)

        else:
            converted_lines.append(line)

    # Join the converted lines back into a single string
    return "\n".join(converted_lines)

# Convert the content again with the updated function
with open(input_file_path, 'r') as file:
    before_content = file.read()

converted_content = convert_blockages(before_content)

# Save the corrected converted content to the new output file
with open(output_file_path, 'w') as file:
    file.write(converted_content)

output_file_path

print("Converted LEF")
