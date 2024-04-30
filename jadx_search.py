import os
import subprocess
import sys

def decompile_dex(dex_path):
    cmd = ['./decompile_dex.sh', dex_path]
    subprocess.run(cmd, check=True)

def search_keywords(keyword1, keyword2, search_dir):
    cmd = ['./search_keywords.sh', keyword1, keyword2, search_dir]
    subprocess.run(cmd, check=True)

def main():
    if len(sys.argv) != 2:
        print("Usage: python3 jadx_search.py <path-to-dex-file>")
        sys.exit(1)

    dex_file_path = sys.argv[1]
    search_dir = os.path.splitext(dex_file_path)[0]

    decompile_dex(dex_file_path)
    search_keywords("DL", "ML", search_dir)

if __name__ == "__main__":
    main()

