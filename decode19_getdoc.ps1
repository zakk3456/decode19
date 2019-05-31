#ダウンロード先を指定してね
$saveDirectory = "c:\decode2019_doc\"

$client = New-Object System.Net.WebClient
$downloadUrl = "https://eventmarketing.blob.core.windows.net/decode2019-after/"

# 取得したいセッションID(サイトからぶっこ抜いた）
$tracks = (
"KN01","CD06","SP08","PR08","AI53","SP11","SE01","DP04","IT53","DT02","CM01","SP09","CD05","CD64","DT61","PR51","DT10","MW01","IT04","AI54","SE03","AI82","MW82","DT91","SE91","CM05","DT06","CD01","MW62","CD62","DP51","DP10","IT01","AI05","MW52","AI01","CD84","SP82","CD91","DP81","CM02","CD12","MW03","CD68","CD67","AI52","IT07","DT05","AI06","SE51","PR04","PR81","CM84","MW81","SE82","CM13","SP01","DT03","CD70","PR61","DT53","PR09","AI07","CD07","CD53","SP10","CM86","DT81","DT07","PR02","CD11","IT03","DP02","SE04","SP06","CD65","CD61","CM52","SP12","AI02","CM08","DT51","CM14","AI81","DT82","CD83","IT82","DT08","SP07","CM09","SE07","CD02","AI10","IT05","DT62","MW61","CM51","DP06","AI09","PR05","CD51","SP04","PR82","SP81","AI91","PR91","PR41","CD41","CD43","CD44","DP41","CD42","AI41","DT41","AI92","CD93","SP03","CM07","PR06","AI04","CM03","DT04","CD04","CM61","CD63","DT52","DP07","IT02","CD14","DP52","PR07","SE81","CM83","CD92","PR92","SP02","CM10","PR10","CD03","CM11","DP09","DP01","CD71","CD66","AI51","SE02","IT06","CD52","MW02","CD82","CM85","IT83","SP83","CD10","DT01","CM12","CM15","CM16","SE06","MW04","DT63","MW63","PR52","PR01","CD08","DP03","IT51","AI08","CM82","MW91","CM81","CD81","AI03","CM06","CD09","SE05","PR03","CD13","DP05","CM62","CD69","MW51","DT09","CM04","DP08","IT52","SP05","AI83","DP82"
)

#資料の拡張子
$exts = (".pptx", ".pdf")

[System.Console]::WriteLine("▼START")

foreach ($track in $tracks) 
{
    $compCount = 0
    foreach ($ext in $exts) 
    {
        $pref = ""
        if($ext -eq ".pptx")
        {
            $pref = "PPT"
        }
        else
        {
            $pref = "PDF"
        }
        $fileName = [string]::Format("decode19_{0}_{1}{2}", $pref, $track, $ext)

        try 
        {
            $client.DownloadFile([System.IO.Path]::Combine($downloadUrl, $fileName), [System.IO.Path]::Combine($saveDirectory, $fileName))
            $compCount++
            [System.Console]::WriteLine("○: " + $fileName)
            break
        }
        catch
        {
        }
    }
    if($compCount -eq 0)
    {
        [System.Console]::WriteLine("×: " + $track)
    }
}
[System.Console]::WriteLine("▲END")
0