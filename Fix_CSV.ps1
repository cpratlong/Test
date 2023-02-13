Get-ChildItem -Path  C:\inetpub\wwwroot\Reporting\LogHistory\EMEA\ -Filter *.csv -Recurse | ForEach-Object {

    $myCSV = Import-CSV $_.FullName | Where-Object {[datetime]$_.date -ge "02/01/2018"}

    Foreach ($line in $myCSV) {
        $line | Add-Member -Name "W10 1803" -MemberType "NoteProperty" -Value "null"
    }
    $myCSV | Export-Csv $_.FullName -NoTypeInformation
}

