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

    ; Prepare the attachment and embed
    attachment := AttachmentBuilder(pCroppedBitmap)
    myEmbed := EmbedBuilder()
        .setAuthor({ name: "MangoGuards", icon_url: "https://cdn.discordapp.com/attachments/1342045511175376962/1342714291089969202/mango.png?ex=67c28ca1&is=67c13b21&hm=d0cbfa9458dcb435d4d9256446f70a22bccbf61bf2ae700237dabaac8a0841b8&"})
        .setTitle("Completed Portal")
        .setColor(0xFFBF34)
        .setImage(attachment)
        .setFooter({ text: "MangoGuards" })
        .setTimeStamp()

    ; Assign a value to UserIDSent
    UserIDSent := "991558850056573031"

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

CropImage(pBitmap, x, y, width, height) {
    ; Initialize GDI+ Graphics from the source bitmap
    pGraphics := Gdip_GraphicsFromImage(pBitmap)
    if !pGraphics {
        MsgBox("Failed to initialize graphics object")
        return
    }

    ; Create a new bitmap for the cropped image
    pCroppedBitmap := Gdip_CreateBitmap(width, height)
    if !pCroppedBitmap {
        MsgBox("Failed to create cropped bitmap")
        Gdip_DeleteGraphics(pGraphics)
        return
    }

    ; Initialize GDI+ Graphics for the new cropped bitmap
    pTargetGraphics := Gdip_GraphicsFromImage(pCroppedBitmap)
    if !pTargetGraphics {
        MsgBox("Failed to initialize graphics for cropped bitmap")
        Gdip_DisposeImage(pCroppedBitmap)
        Gdip_DeleteGraphics(pGraphics)
        return
    }

    ; Copy the selected area from the source bitmap to the new cropped bitmap
    Gdip_DrawImage(pTargetGraphics, pBitmap, 0, 0, width, height, x, y, width, height)

    ; Cleanup
    Gdip_DeleteGraphics(pGraphics)
    Gdip_DeleteGraphics(pTargetGraphics)

    ; Return the cropped bitmap
    return pCroppedBitmap
}

InitiateWebhook() {
    filePath := A_ScriptDir . "\libs\Settings\webhookURL.txt"


    
    global WebhookURL := FileRead(filePath, "UTF-8")

    if (WebhookURL = "") {
       
        return
    }

    if (webhookURL ~= 'i)https?:\/\/discord\.com\/api\/webhooks\/(\d{18,19})\/[\w-]{68}') {
        global webhook := WebHookBuilder(WebhookURL)
        SendWebhook()
    }
}

