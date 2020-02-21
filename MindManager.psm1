function Get-MMTopic {
    begin {

    }
    process {
        $ret = @(osascript "./osaBridge/Get-MMTopic.scpt")
        if ($ret[0].startsWith("ERROR:")) {
            Write-Error $ret[0] -ErrorAction Stop
        }
        else {
        
            $ret | ForEach-Object {
                if ($_.Length -ne 0) {
                    $line = $_.Remove($_.Length - 1).Remove(0, 1)
                    $topicProps = $line -split "`",`""
                    [PSCustomObject][ordered]@{
                        PSTypeName = "MMTopic"
                        Index      = $topicProps[0]
                        ID         = $topicProps[1]
                        ParentID   = $topicProps[2]
                        FillColor  = $topicProps[3]
                        TextColor  = $topicProps[4]
                        Name       = [System.Web.HttpUtility]::UrlDecode($topicProps[5])
                    }
                }
            }
        }
    }

}

