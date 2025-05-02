# this is an script to make runnable a jar

# classes
$ClassFiles = "./ch03/exercises/HelloJava2.class", "./ch03/exercises/HelloComponent2.class"

$SourceCode = "./ch03/exercises/HelloJava2.java"
# in manifest, don't forget to add a newline after a declaration
$ManifestFile = "./ch03/exercises/HelloJava2Manifest.txt"
$FinalJar = "./HelloJava2.jar"

foreach ($ClassFile in $ClassFiles) {
    if (Test-Path $ClassFile) {
        Remove-Item $ClassFile -Verbose
        Write-Host "[!] Class file ${ClassFile} already exists, removing it."
    } else {
        Write-Host "[!] Class file ${ClassFile} does not exists. Do nothing"
    }
}

Write-Host "[!] Compiling classes"
javac.exe $SourceCode

Write-Host "[!] Creating jar"
jar.exe -cvmf $ManifestFile $FinalJar $ClassFiles

Write-Host "[!] Executing jar"
java.exe -jar $FinalJar