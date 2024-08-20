import os
import csv

# Global variables for input and output directories
INPUT_DIRECTORY = './input'
OUTPUT_DIRECTORY = './output'

def parse_csv_files():
    parsed_files = []
    
    # Get all CSV files in the input directory
    for filename in os.listdir(INPUT_DIRECTORY):
        if filename.endswith('.csv'):
            filepath = os.path.join(INPUT_DIRECTORY, filename)
            with open(filepath, 'r') as file:
                reader = csv.DictReader(file)
                parsed_data = [row for row in reader]
                
                # Normalize empty strings to None (optional but cleaner)
                for row in parsed_data:
                    for key, value in row.items():
                        if value == '':
                            row[key] = None
                
                parsed_files.append(parsed_data)
    
    return parsed_files

# Example usage
parsed_csv_files = parse_csv_files()
for index, parsed_file in enumerate(parsed_csv_files):
    print(f"CSV File {index + 1}:")
    for row in parsed_file:
        print(row)

