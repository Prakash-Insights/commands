# NOT TESTED
$filesperfolder = 5000
$sourcePath = "D:\nielsen-images\extract-images"
$destPath = "D:\nielsen-images\file_per_folders"
$i = 0;
$folderNum = 1;

Get-ChildItem "$sourcePath\*.jpg" | % {
    New-Item -Path ($destPath + "\" + $folderNum) -Type Directory -Force
    Move-Item $_ ($destPath + "\" + $folderNum);
    $i++;
    if ($i -eq $filesperfolder){
        $folderNum++;
        $i = 0 ;
    }
}