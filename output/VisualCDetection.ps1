# Collection of all versions of the runtime the script should check for,
# adjust to fit your needs. In its current state it will detect all
# Visual C++ Redistributables from 2005 to 2019 in both x86 and x64 flavors.

$PackagesFound = @{
#    "2005" = $False;
    "2008x86" = $False;
    "2010x86" = $False;
    "2012x86" = $False;
    "2013x86" = $False;
    "2015-2019x86" = $False;
    
#    "2005x64" = $False;
    "2008x64" = $False;
    "2010x64" = $False;
    "2012x64" = $False;
    "2013x64" = $False;
    "2015-2019x64" = $False;
}

# Variable initialization
$Year = ""
$Architecture = ""

# Iterate through below mentioned registry keys
& {
    Get-ChildItem HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*
    Get-ChildItem HKLM:\SOFTWARE\WoW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*
} | ForEach-Object { 
    $CurDisplayName = $_.GetValue("DisplayName") # Get DisplayName
    # Check if Display Name begins with "Microsoft Visual C++" and if so extract the year.
    if( $CurDisplayName -match "^Microsoft Visual C\+\+\D*(?<Year>(\d|-){4,9}).*Redistributable.*" ) {
        $Year = $Matches.Year
        [Void] ($CurDisplayName -match "(?<Arch>(x86|x64))") # Extract Architecture
        $Architecture = $Matches.Arch
        $PackagesFound[ ''+$Year+$Architecture ] = $True
    }
}


# Report result back
If ( $PackagesFound.Values -notcontains $False) {
    Write-Host "All required versions of Microsoft Visual C++ were found"
} Else {
#Not found
}