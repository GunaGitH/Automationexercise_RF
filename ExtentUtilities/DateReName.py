import os
import random
import time
from datetime import datetime, timedelta

def generate_random_filename(original_ext, used_names):
    while True:
        rand_num = random.randint(1, 500)
        new_name = f"{rand_num}{original_ext}"
        if new_name not in used_names:
            used_names.add(new_name)
            return new_name

def main():
    folder_path = 'E:\\GoogleDrive(guna.asokan)\\01\\Frnd'

    # Get start date input from user
    user_input = input("Enter the starting date (YYYY-MM-DD): ")

    try:
        start_date = datetime.strptime(user_input, '%Y-%m-%d')
    except ValueError:
        print("❌ Invalid date format! Please enter in YYYY-MM-DD format.")
        return

    # Get list of all files (ignore folders)
    files = [f for f in os.listdir(folder_path) if os.path.isfile(os.path.join(folder_path, f))]
    files.sort()
    time.sleep(5)

    if not files:
        print("📁 No files found in the folder.")
        return

    print(f"\n📄 Found {len(files)} files. Step 1: Renaming with random numbers...")

    # Step 1: Rename with random numbers to avoid conflicts
    temp_filenames = []
    used_random_names = set()

    for filename in files:
        name, ext = os.path.splitext(filename)
        random_name = generate_random_filename(ext, used_random_names)

        old_path = os.path.join(folder_path, filename)
        new_path = os.path.join(folder_path, random_name)

        os.rename(old_path, new_path)
        temp_filenames.append((random_name, ext))

        print(f"🔀 Renamed '{filename}' ➜ '{random_name}'")

    print("\n📅 Step 2: Renaming with incremental dates...")

    # Step 2: Rename again with incremental dates
    for index, (temp_filename, ext) in enumerate(temp_filenames):
        new_date = (start_date + timedelta(days=index)).strftime('%Y-%m-%d')
        final_name = f"{new_date}{ext}"

        old_path = os.path.join(folder_path, temp_filename)
        new_path = os.path.join(folder_path, final_name)

        os.rename(old_path, new_path)
        print(f"✅ Renamed '{temp_filename}' ➜ '{final_name}'")

if __name__ == "__main__":
    main()
