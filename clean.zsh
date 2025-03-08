#!/bin/zsh
# Repository Cleanup Script for Mac (Z-Shell)
# This script cleans up repository files and then deletes itself

# Function to print colored text
print_cyan() { echo -e "\033[0;36m$1\033[0m"; }
print_yellow() { echo -e "\033[0;33m$1\033[0m"; }
print_green() { echo -e "\033[0;32m$1\033[0m"; }
print_blue() { echo -e "\033[0;34m$1\033[0m"; }
print_magenta() { echo -e "\033[0;35m$1\033[0m"; }

print_cyan "🧹 Starting repository cleanup..."

# Check if .git directory exists and remove it
if [[ -d ".git" ]]; then
    print_yellow "Removing .git directory..."
    rm -rf .git
    print_green "✅ .git directory removed successfully"
else
    print_blue "ℹ️ .git directory not found, skipping..."
fi

# Check if README.md exists and remove it
if [[ -f "README.md" ]]; then
    print_yellow "Removing README.md file..."
    rm -f README.md
    print_green "✅ README.md removed successfully"
else
    print_blue "ℹ️ README.md not found, skipping..."
fi

print_green "🎉 Repository cleanup completed!"
print_magenta "🚮 Cleaning up all cleanup scripts..."

# Create a small command that will delete all cleanup scripts after it completes
(
    sleep 1
    for script in clean.ps1 clean.sh clean.zsh; do
        [[ -f "$script" ]] && rm -f "$script"
    done
) &

print_cyan "✨ All done! Ready to start building your MCP server!"