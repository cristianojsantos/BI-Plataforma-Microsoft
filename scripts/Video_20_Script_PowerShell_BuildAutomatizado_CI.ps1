<# 
Nome do CI: CI-CursoBI-Plataforma-Microsoft_PowerShell
Nome Task Nuget: Use NuGet 5.8.1.7021
Nome Task Nuget SSISBuild: NuGet Get SSISBuild
Path do Projeto: \src\ETL.CursoBI\ETL.CursoBI.dtproj
Nome Task PowerShell: PowerShell Script - Build SSIS
Nome Task Copy Files: Copy Files to: $(build.ArtifactStagingDirectory)
Nome Task Publish: Publish Artifact: CursoBI 
#>

<#--- Aqui vai o Path do seu Projeto de SSIS ---#> 
$ProjectBuild = ""
 
$ProjectFilePath = Join-Path -Path $env:BUILD_SOURCESDIRECTORY -ChildPath $ProjectBuild
 
if (!(Test-Path $ProjectFilePath)) {
    throw "Project $($ProjectFilePath) not found!"
}
else
{
    &"$($env:BUILD_SOURCESDIRECTORY)\SSISBuild.2.3.0\tools\ssisbuild.exe" $ProjectFilePath -Configuration Development -ProtectionLevel EncryptSensitiveWithPassword -Password "@cursoBI101"
 
    if ($LASTEXITCODE -ne 0) {
        throw "Build of $($ProjectFilePath) failed.";
    }
}
