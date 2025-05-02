# this is an script to make runnable a jar

$ClassFile = "./ch02/examples/HelloJava.class"
$SourceCode = "./ch02/examples/HelloJava.java"
$ManifestFile = "./ch02/examples/manifest.txt"
$FinalJar = "./HelloJava.jar"

if (Test-Path $ClassFile) {
    Remove-Item $ClassFile -Verbose
    Write-Host "[!] Class already exists, removing it."
} else {
    Write-Host "[!] Class does not exists. Proceeding to create"
}

Write-Host "[!] Creating class"
javac.exe $SourceCode

Write-Host "[!] Creating jar"
jar.exe -cvmf $ManifestFile $FinalJar $ClassFile

Write-Host "[!] Executing jar"
java.exe -jar $FinalJar