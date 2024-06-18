#!/bin/python3

from os import system
from sys import argv

if "--run" in argv:
    confirmation = input("\nAre you sure? This will delete all git commit history in the current directory.\n(Yes/No)\n")
    if confirmation == "Yes":
        system("git checkout --orphan latest_branch")
        system("git add -A")
        system("git commit -am \"First commit\"")
        system("git branch -D main")
        system("git branch -m main")
        system("git push -f origin main")
        print("\nDone\n")
        exit(0)
    else:
        print("Returning")
        exit(0)


system("clear")

print("""

Run by adding the --run flag

# Create new branch with the name latest_branch
git checkout --orphan latest_branch

# Add all files
git add -A

# Commit
git commit -am "First commit"

# Delete old main branch
git branch -D main

# Rename current branch to main
git branch -m main

# Push changes
git push -f origin main

""")
exit(0)
