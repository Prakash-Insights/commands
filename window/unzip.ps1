# TESTED
# Add-Type -AssemblyName System.IO.Compression.FileSystem;
# Add-Type -AssemblyName System.Text.Encoding;
$files= Get-ChildItem "D:\new-images\00000-00010";  #601-1100, 1101-1300, 1301-1400 1401-2050 2051-3227 3228-3300 3301-3378
$destinationFilePath="D:\new-images\extract-images";
# function Unzip
# {
#     param([string]$zipfile, [string]$outpath);
#     # [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath, [System.Text.Encoding]::UTF8, $true);
#     [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath);
#     # Expand-Archive -LiteralPath $zipfile -DestinationPath $outpath -Force
# }

function UnZipOverwrite($zipfile, $outdir)
{
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [System.IO.Compression.ZipFile]::OpenRead($zipfile)
    foreach ($entry in $archive.Entries)
    {
        $entryTargetFilePath = [System.IO.Path]::Combine($outdir, $entry.FullName)
        $entryDir = [System.IO.Path]::GetDirectoryName($entryTargetFilePath)
        
        #Ensure the directory of the archive entry exists
        if(!(Test-Path $entryDir )){
            # Write-Host "Exist"
            New-Item -ItemType Directory -Path $entryDir | Out-Null 
        }
        
        #If the entry is not a directory entry, then extract entry
        if(!$entryTargetFilePath.EndsWith("\")){
            # Write-Host "Entry"
            [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $entryTargetFilePath, $true);
        }
    }
}

# Unzip $filePath $destinationFilePath
Write-Host $files.Count;
$total_count = $files.Count;;
for ($i=0; $i -lt $files.Count; $i++) {
    Write-Host "Start: ";
    Write-Host $files[$i].FullName;
    Write-Host "`n";
    # Unzip $files[$i].FullName.ToString() $destinationFilePath;
    UnZipOverwrite -zipfile  $files[$i].FullName.ToString() -outdir $destinationFilePath
    Write-Host "End: $i / $total_count";
    # if ($i -eq 6) {  break }  
}

# foreach($file in $filepath)
#     {
#         Write-Host $file
#         # $zip = $shell.NameSpace($file.FullName)
#         # foreach($item in $zip.items())
#         # {
#         #     # $shell.Namespace($file.DirectoryName).copyhere($item)
#         #     Write-Host $file.DirectoryName
#         # }
#         # # Remove-Item $file.FullName
#     }

# Expand-Archive -LiteralPath C:\Archives\Invoices.Zip -DestinationPath C:\ InvoicesUnzipped
# Get-ChildItem -Recurse "." | Where { ! $_.PSIsContainer } | Select Name