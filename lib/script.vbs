Dim resposta

Do
    resposta = InputBox("Voce deseja criar um ponto de restauracao? (sim/nao): ", "Ponto de Restauracao", "sim")
    

    If resposta = "" Or (LCase(resposta) <> "sim" And LCase(resposta) <> "nao") Then
        MsgBox "apenas sim ou nao >:(", vbExclamation, "Erro"
    Else
        If LCase(resposta) = "sim" Then
            Set objShell = CreateObject("WScript.Shell")
            objShell.Run "%windir%\System32\SystemPropertiesProtection.exe"
        End If
        Exit Do
    End If
Loop

