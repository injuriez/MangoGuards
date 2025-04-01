#Requires AutoHotkey v2.0
#Include AHKv2-Gdip-master\Gdip_All.ahk
#Include Discord-Webhook-master\lib\WEBHOOK.ahk

SendWebhook() {
    pToken := Gdip_Startup()
    if !pToken {
        MsgBox("Failed to initialize GDI+")
        return
    }

    ; Capture the entire screen
    pBitmap := Gdip_BitmapFromScreen()
    if !pBitmap {
        MsgBox("Failed to capture the screen")
        Gdip_Shutdown(pToken)
        return
    }

    ; Get screen dimensions
    ScreenWidth := SysGet(78)
    ScreenHeight := SysGet(79)

    ; Crop the bitmap to the full screen dimensions
    pCroppedBitmap := CropImage(pBitmap, 0, 0, ScreenWidth, ScreenHeight)
    if !pCroppedBitmap {
        MsgBox("Failed to crop the bitmap")
        Gdip_DisposeImage(pBitmap)
        Gdip_Shutdown(pToken)
        return
    }

    ; Read stats from the text files
    statsDir := A_ScriptDir . "\Settings\MangoSettings\session\stats\"
    winsFile := statsDir . "wins.txt"
    lossesFile := statsDir . "losses.txt"
    timeFile := statsDir . "TotalTimeUsage.txt"

    ; Default values
    wins := 0
    losses := 0
    totalTime := "0:00:00"


    ; Read wins
    if FileExist(winsFile) {
        wins := Trim(FileRead(winsFile, "UTF-8"))
    } else {
        MsgBox("Wins file does not exist!")
    }

    ; Read losses
    if FileExist(lossesFile) {
        losses := Trim(FileRead(lossesFile, "UTF-8"))
    } else {
        MsgBox("Losses file does not exist!")
    }

    ; Read total time usage and convert to HH:MM:SS

    ; Read total time usage and convert to HH:MM:SS
totalSeconds := 0
if FileExist(timeFile) {
    try {
        ; Read the file and trim any whitespace including newlines
        fileContent := Trim(FileRead(timeFile, "UTF-8"), " `t`n`r")
        
        ; Handle empty strings
        if (fileContent = "" or !fileContent) {
            totalSeconds := 0
            totalTime := "0:00:00"
        } 
        ; Convert to number if it's a valid digit string
        else if (fileContent ~= "^\d+$") {
            totalSeconds := fileContent + 0  ; Coerce string to number
            totalTime := FormatTimeFromSeconds(totalSeconds)
        } 
        ; Handle invalid content
        else {
        
            totalTime := "0:00:00"
        }
    } catch as err {

        totalTime := "0:00:00"
    }
} else {

    totalTime := "0:00:00"
}

    ; Prepare the attachment and embed
    attachment := AttachmentBuilder(pCroppedBitmap)
    myEmbed := EmbedBuilder()
        .setAuthor({ name: "MangoGuards", icon_url: "https://cdn.discordapp.com/attachments/1342045511175376962/1342714291089969202/mango.png?ex=67c28ca1&is=67c13b21&hm=d0cbfa9458dcb435d4d9256446f70a22bccbf61bf2ae700237dabaac8a0841b8&"})
        .setTitle("Completed Map")
        .setDescription("**Wins:** " wins " | **Losses:** " losses " | **Time:** " totalTime)
        .setColor(0xFFBF34)
        .setImage(attachment)
        .setFooter({ text: "MangoGuards" })
        .setTimeStamp()

    ; Assign a value to UserIDSent
    UserIDSent := ""

    ; Send the webhook
    webhook.send({
        content: UserIDSent,
        embeds: [myEmbed],
        files: [attachment]
    })

    ; Clean up resources
    Gdip_DisposeImage(pBitmap)
    Gdip_DisposeImage(pCroppedBitmap)
    Gdip_Shutdown(pToken)
}

FormatTimeFromSeconds(seconds) {
    ; Ensure seconds is numeric
    try {
        seconds := Integer(seconds)  ; Explicitly convert to integer
    } catch {

        return "0:00:00"
    }

    ; Convert seconds to HH:MM:SS format
    hours := Floor(seconds / 3600)
    minutes := Floor(Mod(seconds, 3600) / 60)
    secs := Mod(seconds, 60)

    ; Format minutes and seconds with leading zeros
    minStr := minutes < 10 ? "0" . minutes : minutes
    secStr := secs < 10 ? "0" . secs : secs

    ; Construct the formatted time
    return hours . ":" . minStr . ":" . secStr
}

CropImage(pBitmap, x, y, width, height) {
    croppedBitmap := Gdip_CreateBitmap(width, height)
    if !croppedBitmap
        return 0
    g := Gdip_GraphicsFromImage(croppedBitmap)
    Gdip_DrawImage(g, pBitmap, 0, 0, width, height, x, y, width, height)
    Gdip_DeleteGraphics(g)
    return croppedBitmap
}

InitiateWebhook() {
    ; Get the correct path - remove the duplicate "libs\"
    filePath := A_ScriptDir . "\Settings\webhookURL.txt"
    
    ; Check if directory exists, create if it doesn't
    fileDir := A_ScriptDir . "\Settings"
    if !DirExist(fileDir)
        DirCreate(fileDir)
    
    ; Use try/catch to handle file errors
    try {
        global WebhookURL := FileRead(filePath, "UTF-8")
    } catch as err {
        MsgBox("Error reading webhook file: " . err.Message . "`n`nCreating empty file at:`n" . filePath)
        ; Create the file if it doesn't exist
        try {
            FileAppend("", filePath)
            global WebhookURL := ""
        } catch as writeErr {
            MsgBox("Failed to create webhook file: " . writeErr.Message)
            return
        }
    }
    
    if (WebhookURL = "") {
        return
    }

    ; Updated regex to be more flexible with webhook URLs
    if (WebhookURL ~= 'i)https?:\/\/discord\.com\/api\/webhooks\/\d{17,19}\/[\w-]+') {
        global webhook := WebHookBuilder(WebhookURL)
        SendWebhook()
    } else {
        MsgBox("Invalid webhook URL format")
    }
}
InitiateWebhook()