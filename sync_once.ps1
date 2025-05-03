# Configuration
$sourceFolder = "C:\Users\andre\OneDrive\Documents\obsidian-notes"  # Replace with your source folder path
$targetFolder = "./content"  # Replace with your target folder path
$publishStrings = @('publish: "true"', 'publish: true')  # Both formats to search for
$unpublishStrings = @('publish: "false"', 'publish: false')  # Formats that indicate file should not be published
$logFile = "./content/sync_log.txt"     # Replace with your desired log file path

# List of folders to ignore (relative to sourceFolder)
$ignoreFolders = @(
    ".git",
    ".obsidian",
    "node_modules",
    "temp",
    "cache",
    ".trash",
    ".obsidian.mobile",
    ".smart-connections",
    ".obsidian-mobile"
)

# List of file extensions to ignore
$ignoreExtensions = @(
    ".bak"
)

# List of files to preserve in destination (relative to targetFolder)
$preserveFiles = @(
    "index.md",
    "main.md",
    "tags.md",
    "search.md",
    "assets/logo.png",
    "assets/favicon.ico",
    "assets/icons/*",
    "assets/profile.png",
    "profile.png"
)

# Create target folder if it doesn't exist
if (-not (Test-Path $targetFolder)) {
    New-Item -ItemType Directory -Path $targetFolder -Force | Out-Null
}

# Function to check if a path should be ignored
function Test-ShouldIgnorePath {
    param (
        [string]$Path
    )
    # Check for ignored folders
    foreach ($ignoreFolder in $ignoreFolders) {
        $ignorePattern = [regex]::Escape($ignoreFolder)
        if ($Path -match "\\$ignorePattern\\" -or $Path -match "\\$ignorePattern$") {
            return $true
        }
    }

    # Check for ignored file extensions
    foreach ($extension in $ignoreExtensions) {
        if ($Path -match [regex]::Escape($extension) + "$") {
            return $true
        }
    }
    return $false
}

# Function to check if file is in assets/published or bookcovers directory
function Test-IsPublishedAsset {
    param (
        [string]$Path
    )
    return ($Path -match "\\assets\\published\\" -or $Path -match "\\assets\\bookcovers\\")
}

# Function to check if file should be preserved
function Test-ShouldPreserve {
    param (
        [string]$Path
    )
    $relativePath = $Path.Substring($targetFolder.Length)
    foreach ($preserveFile in $preserveFiles) {
        if ($preserveFile -like "*") {
            # Handle wildcard patterns
            $pattern = $preserveFile -replace "\*", ".*"
            if ($relativePath -match "^$pattern$") {
                return $true
            }
        } else {
            # Handle exact matches
            if ($preserveFiles -contains $relativePath) {
                return $true
            }
        }
    }
    return $false
}

# Function to check if file contains any of the search strings
function Test-FileContainsString {
    param (
        [string]$FilePath,
        [string[]]$SearchStrings
    )
    try {
        $content = Get-Content -Path $FilePath -Raw -ErrorAction Stop
        foreach ($searchString in $SearchStrings) {
            if ($content -match [regex]::Escape($searchString)) {
                return $true
            }
        }
        return $false
    }
    catch {
        Write-Output "Error reading file $FilePath : $_" | Out-File -FilePath $logFile -Append
        return $false
    }
}

# Function to check if file should be published
function Test-ShouldPublish {
    param (
        [string]$FilePath
    )
    # Always publish profile.png from assets
    if ($FilePath -match "\\assets\\profile\.png$") {
        return $true
    }
    # Always publish files from assets/published
    if (Test-IsPublishedAsset -Path $FilePath) {
        return $true
    }
    # First check if file contains unpublish flag
    if (Test-FileContainsString -FilePath $FilePath -SearchStrings $unpublishStrings) {
        return $false
    }
    # Then check if file contains publish flag
    return (Test-FileContainsString -FilePath $FilePath -SearchStrings $publishStrings)
}

# Function to copy file while maintaining relative path
function Copy-FileWithRelativePath {
    param (
        [string]$SourceFile,
        [string]$SourceRoot,
        [string]$TargetRoot
    )

    # Get relative path
    $relativePath = $SourceFile.Replace($SourceRoot, "").TrimStart('\')

    # Create target path by removing 000_notes folder level
    $targetRelativePath = $relativePath
    if ($targetRelativePath -match "^000_notes\\(.*)") {
        $targetRelativePath = $matches[1]
    }

    $targetPath = Join-Path $TargetRoot $targetRelativePath
    $targetDir = Split-Path $targetPath -Parent

    # Create target directory if it doesn't exist
    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    }

    try {
        # Copy the file
        Copy-Item -Path $SourceFile -Destination $targetPath -Force
        Write-Output "$(Get-Date): Copied $SourceFile to $targetPath" | Out-File -FilePath $logFile -Append
    }
    catch {
        Write-Output "$(Get-Date): Error copying $SourceFile to $targetPath : $_" | Out-File -FilePath $logFile -Append
    }
}

# Function to get all files that should be in the destination
function Get-SourceFiles {
    param (
        [string]$Path
    )
    $files = @()
    Get-ChildItem -Path $Path -Recurse -File | ForEach-Object {
        if (-not (Test-ShouldIgnorePath -Path $_.FullName)) {
            if (Test-ShouldPublish -FilePath $_.FullName) {
                # Keep full relative path for source files
                $relativePath = $_.FullName.Replace($sourceFolder, "").TrimStart('\')
                $files += $relativePath
            }
        }
    }
    return $files
}

# Function to get all files currently in the destination
function Get-DestinationFiles {
    param (
        [string]$Path
    )
    $files = @()
    if (Test-Path $Path) {
        Get-ChildItem -Path $Path -Recurse -File | ForEach-Object {
            # Fix: Use Replace to get relative path correctly
            $relativePath = $_.FullName.Replace($targetFolder, "").TrimStart('\')
            $files += $relativePath
        }
    }
    return $files
}

# Perform one-time sync
Write-Output "$(Get-Date): Starting one-time sync..." | Out-File -FilePath $logFile -Append

# Get lists of files
$sourceFiles = Get-SourceFiles -Path $sourceFolder
$destinationFiles = Get-DestinationFiles -Path $targetFolder

# Check all files in destination against source
foreach ($file in $destinationFiles) {
    $sourceFile = Join-Path $sourceFolder $file
    $targetFile = Join-Path $targetFolder $file

    # Skip if file should be preserved
    if (Test-ShouldPreserve -Path $targetFile) {
        Write-Output "$(Get-Date): Preserving $targetFile (protected file)" | Out-File -FilePath $logFile -Append
        continue
    }

    if (Test-Path $sourceFile) {
        # File exists in source, check if it should be published
        if (-not (Test-ShouldPublish -FilePath $sourceFile)) {
            # Only try to remove if the file exists
            if (Test-Path $targetFile) {
                Remove-Item $targetFile -Force
                Write-Output "$(Get-Date): Deleted $targetFile (marked as unpublished or missing publish flag)" | Out-File -FilePath $logFile -Append
            }
        }
    } else {
        # Only try to remove if the file exists
        if (Test-Path $targetFile) {
            Remove-Item $targetFile -Force
            Write-Output "$(Get-Date): Deleted $targetFile (no longer exists in source)" | Out-File -FilePath $logFile -Append
        }
    }
}

# Copy new and updated files
foreach ($file in $sourceFiles) {
    $sourceFile = Join-Path $sourceFolder $file
    $targetFile = Join-Path $targetFolder $file
    Copy-FileWithRelativePath -SourceFile $sourceFile -SourceRoot $sourceFolder -TargetRoot $targetFolder
}

# Clean up empty directories in destination
Get-ChildItem -Path $targetFolder -Recurse -Directory | Sort-Object -Property FullName -Descending | ForEach-Object {
    if ((Get-ChildItem -Path $_.FullName -Recurse -Force | Measure-Object).Count -eq 0) {
        Remove-Item $_.FullName -Force
        Write-Output "$(Get-Date): Removed empty directory $($_.FullName)" | Out-File -FilePath $logFile -Append
    }
}

Write-Output "$(Get-Date): One-time sync completed." | Out-File -FilePath $logFile -Append
