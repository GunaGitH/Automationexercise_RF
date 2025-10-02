import os
import random

def generate_random_name(used_names):
    """Generate a unique six-digit random file name."""
    while True:
        rand_num = str(random.randint(1, 500))
        if rand_num not in used_names:
            return rand_num

def rename_files_randomly(directory):
    if not os.path.isdir(directory):
        print(f"Directory not found: {directory}")
        return

    used_names = set()
    for filename in os.listdir(directory):
        full_path = os.path.join(directory, filename)
        if not os.path.isfile(full_path):
            continue

        _, ext = os.path.splitext(filename)
        new_base = generate_random_name(used_names)
        new_filename = new_base + ext
        new_full_path = os.path.join(directory, new_filename)

        os.rename(full_path, new_full_path)
        used_names.add(new_base)
        print(f"Renamed: {filename} -> {new_filename}")

if __name__ == "__main__":
    # 👉 Replace this path with the directory you want to process:
    directory = "E:\\GoogleDrive(guna.asokan)\\01\\Today"
    rename_files_randomly(directory)
