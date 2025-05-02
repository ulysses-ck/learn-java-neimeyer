# this is an script to make runnable a jar

# classes
$ClassFiles = "./ch03/exercises/HelloJava2.class", "./ch03/exercises/HelloComponent2.class"

$SourceCode = "./ch03/exercises/HelloJava2.java"
# in manifest, don't forget to add a newline after a declaration
$ManifestFile = "./ch03/exercises/HelloJava2Manifest.txt"
$FinalJar = "./HelloJava2.jar"

# expression with color
$WriteHostColor = "Write-Host -ForegroundColor DarkGreen"

foreach ($ClassFile in $ClassFiles) {
    if (Test-Path $ClassFile) {
        Remove-Item $ClassFile -Verbose
        Invoke-Expression "${WriteHostColor} '[!] Class file ${ClassFile} already exists, removing it.'"
    } else {
        Invoke-Expression "${WriteHostColor} '[!] Class file ${ClassFile} does not exists. Do nothing'"
    }
}

Invoke-Expression "${WriteHostColor} '[!] Compiling classes'"
javac.exe $SourceCode

Invoke-Expression "${WriteHostColor} '[!] Creating jar'"
jar.exe -cvmf $ManifestFile $FinalJar $ClassFiles

Invoke-Expression "${WriteHostColor} '[!] Executing jar'"
java.exe -jar $FinalJar