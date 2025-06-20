@echo off&setlocal enabledelayedexpansion&for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a"&set "COL=%%b")&for /f %%a in ('echo prompt $E^| cmd') do set "esc=%%a"&Reg add HKCU\CONSOLE /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>&1&cd /d "%~dp0lib"&Batbox /h 0&if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin&exit /b)&FOR /F %%A in ('"PROMPT $H&FOR %%B in (1) DO REM"') DO SET "BS=%%A"&reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VSS" /v Start /t REG_DWORD /d 2 /f >nul
set g=[92m&set r=[91m&set red=[04m&set l=[1m&set w=[0m&set b=[94m&set m=[95m&set p=[35m&set c=[35m&set d=[96m&set u=[0m&set z=[91m&set n=[96m&set y=[40;33m&set g2=[102m&set r2=[101m&set t=[40m&set gg=[93m&set q=[90m&set gr=[32m&set o=[38;5;202m&set bb=[38;5;74m&set nn=[38;5;82m&set rr=[1;91m&set blb=[1;94m&set bn=[1;38;5;129m&set ha=[38;5;203m&set frr=[38;2;0;255;255m&set fw=[97m&set "redd=[04m"&set ha=[38;5;203m&set "fk=[92m"&set "xv=[91m"&set "spar=[04m"&set "sof=[1m"&set "ww=[0m"&set "bvv=[94m"&set "op=[96m"&set "tq=[0m"&set "mnb=[91m"&set "zi=[96m"&set "er=[40;33m"&set "po=[40m"&set "pu=[93m"&set "cya=[96m"&set "ggg=[90m"&set "rp=[35m"&set "drp=[95m"&set "dr=[38;5;90m"&set wtf=[97m&set lak=[30m
:: aplicando tweaks placebo 
schtasks /delete /TN "Intelligent StandbyList Cleaner" /f > nul 2>&1&bcdedit /deletevalue numproc > nul 2>&1&bcdedit /deletevalue truncatememory > nul 2>&1&reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f > nul 2>&1&reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 2 /f > nul 2>&1&reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "Medium" /f > nul 2>&1&reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "Normal" /f > nul 2>&1&reg delete "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /f > nul 2>&1&reg delete "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /f > nul 2>&1&reg delete "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /f > nul 2>&1&reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "400" /f > nul 2>&1&call :cont

:cont
powershell -nop -c "& {$host.ui.rawui.windowtitle=' '}"
for /f "tokens=3" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "CurrentBuild" 2^>nul ^| findstr "REG_SZ"') do (
    set "build=%%A"
)
set /a build_num=!build!
if !build_num! LSS 18362 (
    cls
    chcp 65001 >nul
    echo( %wtf%Sua versão do %bb%Windows é: %r%1909%wtf%, e o Memphis Optimizer por enquanto não tem suporte para o mesmo.
    pause
    exit /b 0
) else (
    goto :yoff
)


:yoff
if not exist "%windir%\system32\WindowsPowerShell\v1.0\powershell.exe" (
echo(
    echo(
	echo(		%gg%[%r%Erro 589%gg%]%w% Você não tem o powershell. Não é possivel executar o MemphisX.
	echo(
	pause
echo(
) else (
	call :aleinu
)




:aleinu
mode 97,21
set "asciiArt[0]=   __  __                              _       _          "
set "asciiArt[1]=  |  \/  |                            | |     (_)         "
set "asciiArt[2]=  | \  / |   ___   _ __ ___    _ __   | |__    _   ___    "
set "asciiArt[3]=  | |\/| |  / _ \ | '_ ` _ \  | '_ \  | '_ \  | | / __|   "
set "asciiArt[4]=  | |  | | |  __/ | | | | | | | |_) | | | | | | | \__ \   "
set "asciiArt[5]=  |_|  |_|  \___| |_| |_| |_| | .__/  |_| |_| |_| |___/   "
set "asciiArt[6]=                              | |                         "
set "asciiArt[7]=                              |_|                         "

set "posX=20"
set "posY=5"
set /a "corMax=255"
set /a "incremento=5"

cls


echo( !esc![?25l


for /L %%i in (0,%incremento%,%corMax%) do (
    set /a "line=0"
    for /L %%j in (0,1,7) do (
        set "lineText=!asciiArt[%%j]!"
        echo !esc![!posY!;!posX!H!esc![38;2;%%i;%%i;%%im!lineText!!esc![0m
        set /a "posY+=1"
    )
    set /a "posY=5"
    timeout /t 0 /nobreak >nul
)

cmd /c timeout 4 /nobreak >nul
call :main



:main
powershell -nop -c "& {$host.ui.rawui.windowtitle=' '}"
cls
mode 96,24
cmdwiz setwindowtransparency 5
chcp 65001 >nul

ECHO(
ECHO(
ECHO(	
ECHO(
set "lines[0]=            ███╗   ███╗  ███████╗  ███╗   ███╗  ██████╗   ██╗  ██╗  ██╗  ███████╗    "
set "lines[1]=            ████╗ ████║  ██╔════╝  ████╗ ████║  ██╔══██╗  ██║  ██║  ██║  ██╔════╝    "
set "lines[2]=            ██╔████╔██║  █████╗    ██╔████╔██║  ██████╔╝  ███████║  ██║  ███████╗    "
set "lines[3]=            ██║╚██╔╝██║  ██╔══╝    ██║╚██╔╝██║  ██╔═══╝   ██╔══██║  ██║  ╚════██║    "
set "lines[4]=            ██║ ╚═╝ ██║  ███████╗  ██║ ╚═╝ ██║  ██║       ██║  ██║  ██║  ███████║    "
set "lines[5]=            ╚═╝     ╚═╝  ╚══════╝  ╚═╝     ╚═╝  ╚═╝       ╚═╝  ╚═╝  ╚═╝  ╚══════╝    "
set "lines[6]=  
                                                                           
set "corBaseR=0"
set "corBaseG=255"
set "corBaseB=255"
set "variacaoR=255"
set "variacaoG=-255"
set "variacaoB=0"
set "ESC="

for /L %%j in (0,1,82) do (
    set /a "corR=corBaseR + (variacaoR * %%j / 82)"
    set /a "corG=corBaseG + (variacaoG * %%j / 82)"
    set /a "corB=corBaseB + (variacaoB * %%j / 82)"
    set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,6) do (
    set "texto=!lines[%%i]!"
    set "textoGradiente="
    for /L %%j in (0,1,82) do (
        set "char=!texto:~%%j,1!"
        if "!char!" == " " set "char= "
        set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
    )
    echo( !textoGradiente!!ESC![0m
)

set "linhaGradiente="
set /a "espacosAntes=(80 - 82) / 2"
for /L %%k in (1,1,!espacosAntes!) do set "linhaGradiente=!linhaGradiente! "
for /L %%j in (0,1,82) do (
    set /a "corR=corBaseR + (variacaoR * %%j / 82)"
    set /a "corG=corBaseG + (variacaoG * %%j / 82)"
    set /a "corB=corBaseB + (variacaoB * %%j / 82)"
    set "linhaGradiente=!linhaGradiente!!ESC![38;2;!corR!;!corG!;!corB!m─"
)
set /a "espacosDepois=(80 - 82) / 2"
for /L %%k in (1,1,!espacosDepois!) do set "linhaGradiente=!linhaGradiente! "
echo(       %linhaGradiente%!ESC![0m

chcp 437 >nul
echo( %bb%
echo( 
Call Button 36 13 "Otimizar Meu PC" # Press 
Getinput /m !Press! /h 70
if !errorlevel!==1 (call :optimizer)

:teclaerrada
call :main

:optimizer
cls
start script.vbs
chcp 65001 >nuk
echo( %g% Pressione qualquer tecla para iniciar a otimização^^!

pause >nul


:memphismode


echo( !esc![?25h

mode con: cols=46 lines=9

cls
chcp 437 >nul
powershell -Command "(Get-WmiObject -Class Win32_VideoController).Name" | findstr /i "AMD NVIDIA Intel" > nul
if %errorlevel% equ 0 (


   echo. 
    set HW_VENDOR=Unknown
    for /f "tokens=*" %%a in ('powershell -Command "(Get-WmiObject -Class Win32_VideoController).Name"') do (
        set HW_NAME=%%a
        if "!HW_NAME:AMD=!" neq "!HW_NAME!" (
            set HW_VENDOR=AMD
        ) else if "!HW_NAME:NVIDIA=!" neq "!HW_NAME!" (
            set HW_VENDOR=NVIDIA
        ) else if "!HW_NAME:Intel=!" neq "!HW_NAME!" (
            set HW_VENDOR=Intel
        )
    )
	 powershell -nop -c "& {$host.ui.rawui.windowtitle=' '}"
    echo %wtf%Sua %gg%GPU%w% %wtf%e:%o% !HW_VENDOR!%w%
 if "!HW_VENDOR!" equ "AMD" (
    echo %wtf%Aplicando Tweaks para %r%AMD%w%
    cmd /c timeout 3 /nobreak >nul

    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDMACopy" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableBlockWrite" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "StutterMode" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ShaderCache" /t REG_BINARY /d "3200" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation_OPTION" /t REG_BINARY /d "3200" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation" /t REG_BINARY /d "3100" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "VSyncControl" /t REG_BINARY /d "3000" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TFQ" /t REG_BINARY /d "3200" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\DAL2_DATA__2_0\DisplayPath_4\EDID_D109_78E9\Option" /v "ProtectionControl" /t REG_BINARY /d "0100000001000000" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D_DEF" /t REG_SZ /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D" /t REG_BINARY /d "3100" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "FlipQueueSize" /t REG_BINARY /d "3100" /f >nul
    Reg.exe add "HKLM\SYSTEM\ControlSet001\services\amdkmdap" /v "KMD_APlusISharedMiniSegmentOptions" /t REG_DWORD /d "7" /f >nul
    Reg.exe add "HKLM\SYSTEM\ControlSet001\services\amdkmdap" /v "KMD_APlusISharedMiniSegmentSize" /t REG_DWORD /d "67108864" /f >nul
    Reg.exe add "HKLM\SYSTEM\ControlSet001\services\amdkmdap" /v "KMD_PXForceVideoPlaybackToIntegrated" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\CLASS\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000" /v "KMD_EnableCrossGpuDisplaySupport" /t REG_DWORD /d "1" /f >nul
    echo %g%Sucesso
    cmd /c timeout 3 /nobreak >nul
    call :Optimizam
) else if "!HW_VENDOR!" equ "NVIDIA" (
    echo %wtf%Aplicando Tweaks para %g%NVIDIA%w%
    cmd /c timeout 3 /nobreak >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemption" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableMshybridNvsrSwitch" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableTiledDisplay" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "LogWarningEntries" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "LogPagingEntries" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "LogEventEntries" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "LogErrorEntries" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "ComputePreemption" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableBugcheckDisplay" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "NVFBCEnable" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "UseGpuTimer" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PowerSavingTweaks" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableRuntimePowerManagement" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PrimaryPushBufferSize" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PciLatencyTimerControl" /t REG_DWORD /d "32" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "NvCplAllowStartupDelay" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "DisableIndependentVidPnVSync" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "DisableMultiSourceMPOCheck" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "DisableOverlays" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "DisableVersionMismatchCheck" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "ForceDirectFlip" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "MiracastForceDisable" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "TdrDdiDelay" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "TdrDodPresentDelay" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "TdrDodVSyncDelay" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers" /v "PlatformSupportMiracast" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers\Scheduler" /v "VsyncIdleTimeout" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableGR535" /t REG_DWORD /d "0" /f >nul
Reg.exe delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup\SendTelemetryData" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "D3PCLatency" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "F1TransitionLatency" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "LowLatency" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "Node3DLowLatency" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PciLatencyTimerControl" /t REG_DWORD /d "50" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMDeepL1EntryLatencyUsec" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGspcMaxFtuS" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGspcMinFtuS" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGspcPerioduS" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMLpwrEiIdleThresholdUs" /t REG_DWORD /d "1" /f >nul 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMLpwrGrIdleThresholdUs" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMLpwrGrRgIdleThresholdUs" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RMLpwrMsIdleThresholdUs" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "VRDirectFlipDPCDelayUs" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "VRDirectFlipTimingMarginUs" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "VRDirectJITFlipMsHybridFlipDelayUs" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "vrrCursorMarginUs" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "vrrDeflickerMarginUs" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "vrrDeflickerMaxUs" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnablePreemption" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "ComputePreemption" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableMidGfxPreemptionVGPU" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableMidBufferPreemptionForHighTdrTimeout" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableAsyncMidBufferPreemption" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableSCGMidBufferPreemption" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "PerfAnalyzeMidBufferPreemption" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableMidGfxPreemption" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableMidBufferPreemption" /t REG_DWORD /d "0" /f >nul1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f >nul
    echo %g%Sucesso
    cmd /c timeout 3 /nobreak >nul
    call :Optimizam
	
) else if "!HW_VENDOR!" equ "Intel" (
    echo %wtf%Aplicando Tweaks para %b%Intel%w%
    cmd /c timeout 3 /nobreak >nul

    reg add "HKCU\Software\Intel\Display\igfxcui\HotKeys" /v "Enable" /t REG_DWORD /d "0" /f >nul
    reg add "HKCU\Software\Intel\Display\igfxcui\igfxtray" /v "ShowGraphicsBalloon" /t REG_DWORD /d "0" /f >nul
    reg add "HKCU\Software\Intel\Display\igfxcui\igfxtray" /v "ShowOptimalBalloon" /t REG_DWORD /d "0" /f >nul
    reg add "HKCU\Software\Intel\Display\igfxcui\igfxtray\TrayIcon" /v "ShowTrayIcon" /t REG_DWORD /d "0" /f >nul
    reg add "HKCU\Software\Intel\Display\igfxcui\Media" /v "EnableACE" /t REG_DWORD /d "0" /f >nul
    reg add "HKCU\Software\Intel\Display\igfxcui\Media" /v "EnableFMD" /t REG_DWORD /d "0" /f >nul
    reg add "HKCU\Software\Intel\Display\igfxcui\Media" /v "EnableNLAS" /t REG_DWORD /d "0" /f >nul
    reg add "HKCU\Software\Intel\Display\igfxcui\Media" /v "EnableSTE" /t REG_DWORD /d "0" /f >nul
    reg add "HKCU\Software\Intel\Display\igfxcui\Media" /v "EnableTCC" /t REG_DWORD /d "0" /f >nul
    reg add "HKCU\Software\Intel\Display\igfxcui\Media" /v "GCompMode" /t REG_DWORD /d "0" /f >nul
    reg add "HKCU\Software\Intel\Display\igfxcui\Media" /v "GExpMode" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKCU\Software\Intel\Display\igfxcui\Media" /v "InputYUVRangeApplyAlways" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKCU\Software\Intel\Display\igfxcui\Media" /v "SharpnessEnabledAlways" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKCU\Software\Intel\Display\igfxcui\Media" /v "NoiseReductionEnabledAlways" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKCU\Software\Intel\Display\igfxcui\Media" /v "ProcAmpApplyAlways" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\Software\INTEL\Display\igfxcui\MediaKeys" /v "ProcAmpApplyAlways" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\Software\INTEL\Display\igfxcui\MediaKeys" /v "InputYUVRangeApplyAlways" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\Software\INTEL\Display\igfxcui\MediaKeys" /v "SharpnessEnabledAlways" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\Software\INTEL\Display\igfxcui\MediaKeys" /v "NoiseReductionEnabledAlways" /t REG_DWORD /d "0" /f >nul	
    reg add "HKCU\Software\Intel\Display\igfxcui\virtualKeyboard" /v "ShowVirtualKeyBoard" /t REG_DWORD /d "0" /f >nul
    reg add "HKCU\Software\Intel\Display\igfxcui\3D" /v "Default" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000100000000000000" /f >nul
    reg add "HKLM\SOFTWARE\INTEL\Display\igfxcui\MISC" /v "MiracastFeatureEnabled" /t REG_DWORD /d "0" /f >nul
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000" /v "XVYCCFeatureEnable" /t REG_DWORD /d "0" /f >nul
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000" /v "Disable_OverlayDSQualityEnhancement" /t REG_DWORD /d "1" /f >nul
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\igfxCUIService2.0.0.0" /v "DependOnService" /t REG_MULTI_SZ /d "" /f >nul
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\igfxCUIService2.0.0.0" /v "Start" /t REG_DWORD /d "4" /f >nul
	Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000" /v "Enable4KDisplay" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000" /v "WideGamutFeatureEnable" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000" /v "XVYCCFeatureEnable" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000" /v "DeepColorHDMIDisable" /t REG_DWORD /d "1" /f >nul
	Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000" /v "Disable_OverlayDSQualityEnhancement" /t REG_DWORD /d "1" /f >nul
	Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000" /v "AllowDeepCStates" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000" /v "DelayedDetectionForDP" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000" /v "DelayedDetectionForHDMI" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SOFTWARE\INTEL\Display\igfxcui\MediaKeys" /v "ProcAmpApplyAlways" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SOFTWARE\INTEL\Display\igfxcui\MediaKeys" /v "EnableTCC" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SOFTWARE\INTEL\Display\igfxcui\MediaKeys" /v "EnableFMD" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SOFTWARE\INTEL\Display\igfxcui\MediaKeys" /v "NoiseReductionEnabledAlways" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SOFTWARE\INTEL\Display\igfxcui\MediaKeys" /v "NoiseReductionEnableChroma" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SOFTWARE\INTEL\Display\igfxcui\MediaKeys" /v "SharpnessEnabledAlways" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SOFTWARE\INTEL\Display\igfxcui\MediaKeys" /v "UISharpnessOptimalEnabledAlways" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SOFTWARE\INTEL\Display\igfxcui\MediaKeys" /v "EnableSTE" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SOFTWARE\INTEL\Display\igfxcui\MediaKeys" /v "SkinTone" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SOFTWARE\INTEL\Display\igfxcui\MediaKeys" /v "EnableACE" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SOFTWARE\INTEL\Display\igfxcui\MediaKeys" /v "EnableIS" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SOFTWARE\INTEL\Display\igfxcui\MediaKeys" /v "EnableNLAS" /t REG_DWORD /d "0" /f >nul
	Reg.exe add "HKLM\SOFTWARE\INTEL\Display\igfxcui\MediaKeys" /v "InputYUVRangeApplyAlways" /t REG_DWORD /d "0" /f >nul
    echo %g%Sucesso
    cmd /c timeout 3 /nobreak >nul
    call :Optimizam
) else (
    call :Optimizam
)


:Optimizam
cls

powershell -Command "(Get-WmiObject -Class Win32_Processor).Manufacturer" | findstr /i "AMD Intel" > nul
if %errorlevel% equ 0 (
    echo.
    set "CPU_VENDOR=Unknown"
    for /f "tokens=*" %%a in ('powershell -Command "(Get-WmiObject -Class Win32_Processor).Manufacturer"') do (
        set "CPU_NAME=%%a"
        if "!CPU_NAME:AMD=!" neq "!CPU_NAME!" (
            set "CPU_VENDOR=AMD"
        ) else if "!CPU_NAME:Intel=!" neq "!CPU_NAME!" (
            set "CPU_VENDOR=Intel"
        )
    )
	powershell -nop -c "& {$host.ui.rawui.windowtitle=' '}"
    echo %wtf%Seu %gg%processador%wtf% e:%r% !CPU_VENDOR!%w%
	cmd /c timeout 3 /nobreak >nul
    if "!CPU_VENDOR!" equ "AMD" (
        echo %wtf%Aplicando Tweaks para %r%AMD %wtf%
        cmd /c timeout 6 /nobreak >nul

for /f %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /s /v "DriverDesc"^| findstr "HKEY AMD ATI"') do if /i "%%i" neq "DriverDesc" (set "REGPATH_AMD=%%i")




				reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\HardCap0" /v "CapPercentage" /t REG_DWORD /d "0" /f >nul
				reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\HardCap0" /v "SchedulingType" /t REG_DWORD /d "0" /f  >nul
				reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\Paused" /v "CapPercentage" /t REG_DWORD /d "0" /f  >nul
				reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\Paused" /v "SchedulingType" /t REG_DWORD /d "0" /f  >nul
				reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapFull" /v "CapPercentage" /t REG_DWORD /d "0" /f >nul
				reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapFull" /v "SchedulingType" /t REG_DWORD /d "0" /f >nul
				reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapLow" /v "CapPercentage" /t REG_DWORD /d "0" /f >nul
				reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapLow" /v "SchedulingType" /t REG_DWORD /d "0" /f >nul


                      reg add "%REGPATH_AMD%" /v "3D_Refresh_Rate_Override_DEF" /t Reg_DWORD /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "3to2Pulldown_NA" /t Reg_DWORD /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "AAF_NA" /t Reg_DWORD /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "Adaptive De-interlacing" /t Reg_DWORD /d "1" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "AllowRSOverlay" /t Reg_SZ /d "false" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "AllowSkins" /t Reg_SZ /d "false" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "AllowSnapshot" /t Reg_DWORD /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "AllowSubscription" /t Reg_DWORD /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "AntiAlias_NA" /t Reg_SZ /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "AreaAniso_NA" /t Reg_SZ /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "ASTT_NA" /t Reg_SZ /d "0" /f >nul 2>&1
	              reg add "%REGPATH_AMD%" /v "AutoColorDepthReduction_NA" /t Reg_DWORD /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "DisableSAMUPowerGating" /t Reg_DWORD /d "1" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "DisableUVDPowerGatingDynamic" /t Reg_DWORD /d "1" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "DisableVCEPowerGating" /t Reg_DWORD /d "1" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "EnableAspmL0s" /t Reg_DWORD /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "EnableAspmL1" /t Reg_DWORD /d "0" /f >nul 2>&1
	              reg add "%REGPATH_AMD%" /v "EnableUlps" /t Reg_DWORD /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "EnableUlps_NA" /t Reg_SZ /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "KMD_DeLagEnabled" /t Reg_DWORD /d "1" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "KMD_FRTEnabled" /t Reg_DWORD /d "0" /f >nul 2>&1
	              reg add "%REGPATH_AMD%" /v "DisableDMACopy" /t Reg_DWORD /d "1" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "DisableBlockWrite" /t Reg_DWORD /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "StutterMode" /t Reg_DWORD /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "EnableUlps" /t Reg_DWORD /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "PP_SclkDeepSleepDisable" /t Reg_DWORD /d "1" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "PP_ThermalAutoThrottlingEnable" /t Reg_DWORD /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "DisableDrmdmaPowerGating" /t Reg_DWORD /d "1" /f >nul 2>&1
                      reg add "%REGPATH_AMD%" /v "KMD_EnableComputePreemption" /t Reg_DWORD /d "0" /f >nul 2>&1
                      reg add "%REGPATH_AMD%\UMD" /v "Main3D_DEF" /t Reg_SZ /d "1" /f >nul 2>&1
                      reg add "%REGPATH_AMD%\UMD" /v "Main3D" /t Reg_BINARY /d "3100" /f >nul 2>&1
                      reg add "%REGPATH_AMD%\UMD" /v "FlipQueueSize" /t Reg_BINARY /d "3100" /f >nul 2>&1 
                      reg add "%REGPATH_AMD%\UMD" /v "ShaderCache" /t Reg_BINARY /d "3200" /f >nul 2>&1
                      reg add "%REGPATH_AMD%\UMD" /v "Tessellation_OPTION" /t Reg_BINARY /d "3200" /f >nul 2>&1
                      reg add "%REGPATH_AMD%\UMD" /v "Tessellation" /t Reg_BINARY /d "3100" /f >nul 2>&1
                      reg add "%REGPATH_AMD%\UMD" /v "VSyncControl" /t Reg_BINARY /d "3000" /f >nul 2>&1
                      reg add "%REGPATH_AMD%\UMD" /v "TFQ" /t Reg_BINARY /d "3200" /f >nul 2>&1						
reg add "%REGPATH_AMD%\DAL2_DATA__2_0\DisplayPath_4\EDID_D109_78E9\Option" /v "ProtectionControl" /t Reg_BINARY /d "0100000001000000" /f >nul&&echo %g%Sucesso
				

				cmd /c timeout 3 /nobreak >nul
				call :sof
       
    ) else if "!CPU_VENDOR!" equ "Intel" (
        echo %wtf%Aplicando Tweaks para %b%Intel%w%
        cmd /c timeout 6 /nobreak >nul
		          bcdedit /set allowedinmemorysettings 0x0 >nul
	              bcdedit /set isolatedcontext No >nul
	             Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DistributeTimers" /t REG_DWORD /d "1" /f >nul
	             Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableTsx" /t REG_DWORD /d "0" /f >nul
	             Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul
	             Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul
	             Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d "0" /f >nul
	             Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f >nul
				 reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\HardCap0" /v "CapPercentage" /t REG_DWORD /d "0" /f >nul
				reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\HardCap0" /v "SchedulingType" /t REG_DWORD /d "0" /f  >nul
				reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\Paused" /v "CapPercentage" /t REG_DWORD /d "0" /f  >nul
				reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\Paused" /v "SchedulingType" /t REG_DWORD /d "0" /f  >nul
				reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapFull" /v "CapPercentage" /t REG_DWORD /d "0" /f >nul
				reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapFull" /v "SchedulingType" /t REG_DWORD /d "0" /f >nul
				reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapLow" /v "CapPercentage" /t REG_DWORD /d "0" /f >nul
				reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapLow" /v "SchedulingType" /t REG_DWORD /d "0" /f >nul
				    
					for /f %%t in ('Reg query "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /t REG_SZ /s /e /f "Intel" ^| findstr "HKEY"') do (
					Reg.exe add "%%t" /v "Disable_OverlayDSQualityEnhancement" /t REG_DWORD /d "1" /f >nul
					Reg.exe add "%%t" /v "IncreaseFixedSegment" /t REG_DWORD /d "1" /f >nul
					Reg.exe add "%%t" /v "AdaptiveVsyncEnable" /t REG_DWORD /d "0" /f >nul
					Reg.exe add "%%t" /v "DisablePFonDP" /t REG_DWORD /d "1" /f >nul
					Reg.exe add "%%t" /v "EnableCompensationForDVI" /t REG_DWORD /d "1" /f >nul
					Reg.exe add "%%t" /v "NoFastLinkTrainingForeDP" /t REG_DWORD /d "0" /f >nul
					Reg.exe add "%%t" /v "ACPowerPolicyVersion" /t REG_DWORD /d "16898" /f >nul
					Reg.exe add "%%t" /v "DCPowerPolicyVersion" /t REG_DWORD /d "16642" /f >nul
  )

                 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\intelppm\Parameters" /v "DisableHyperThreading" /t REG_DWORD /d "1" /f >nul&&echo %g%Sucesso%w%
			    cmd /c timeout 3 /nobreak >nul
			   call :sof
    )
) else (
    call :sof
)

:sof
cls
ECHO(
chcp 437 >nul
for /f "tokens=*" %%a in ('powershell -Command "(Get-WmiObject -Class Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB"') do (
    set "TotalMemoryGB=%%a"
	powershell -nop -c "& {$host.ui.rawui.windowtitle=' '}"
    echo %wtf%Sua memoria e:%cya% %%a GB%w%
)
cmd /c timeout 3 /nobreak >nul



if !TotalMemoryGB! LEQ 4 (
    echo(%wtf%Otimizando Memoria %b%4GB%w%
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 4194304 /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /t REG_DWORD /d "96" /f >nul&&Echo(%g% Sucesso%w%
    cmd /c timeout 3 /nobreak >nul
    call :mem
)




) else if !TotalMemoryGB! LEQ 8 (
powershell -nop -c "& {$host.ui.rawui.windowtitle=' '}"
    echo(%wtf%Otimizando Memoria %b%8GB%w% 

    reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 8388608 /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /t REG_DWORD /d "96" /f >nul&&Echo(%g%Sucesso%w%
    cmd /c timeout 3 /nobreak >nul
    call :mem
)

) else if !TotalMemoryGB! LEQ 10 (
powershell -nop -c "& {$host.ui.rawui.windowtitle=' '}"
	echo(%wtf%Otimizando memoria %b%10GB%w% 

reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 10485760 /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /t REG_DWORD /d "96" /f >nul&&Echo( %g% Sucesso%w%
cmd /c timeout 3 /nobreak >nul
call :mem                   



) else if !TotalMemoryGB! LEQ 12 (
	powershell -nop -c "& {$host.ui.rawui.windowtitle=' '}"																						
    echo(%wtf% Otimizando Memoria %b%12GB%w%
    reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 12582912 /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\memory management\prefetchparameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >nul
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /t REG_DWORD /d "96" /f >nul&ECHO( %g%Sucesso%w%
    cmd /c timeout 3 /nobreak >nul
    call :mem
)




) else if !TotalMemoryGB! LEQ 16 (
powershell -nop -c "& {$host.ui.rawui.windowtitle=' '}"
    echo( %wtf%Otimizando memoria %b%16GB%w%

	
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 16777216 /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\memory management\prefetchparameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /t REG_DWORD /d "96" /f >nul&ECHO( %g%Sucesso%w%
    cmd /c timeout 3 /nobreak >nul
    call :mem
)

	
	
	
	
	
	
	
) else if !TotalMemoryGB! LEQ 32 (
powershell -nop -c "& {$host.ui.rawui.windowtitle=' '}"

    echo %wtf%Otimizando memoria %b%32GB%r% (Ou mais)%w%

    reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d 33554432 /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >nul
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /t REG_DWORD /d "96" /f >nul&&ECHO(%g%Sucesso%w%
    cmd /c timeout 3 /nobreak >nul
    call :mem
)
																									
) else (
call :mem
)




:mem
cls
ECHO(
for /f "tokens=*" %%A in ('powershell -command "Get-PhysicalDisk | Where-Object { $_.DeviceID -eq 0 } | Select-Object -ExpandProperty MediaType"') do (
    set "MediaType=%%A"
)


if /i "%MediaType%"=="SSD" (
    cmd /c timeout 2 /nobreak >nul
chcp 437 >nul
powershell -nop -c "& {$host.ui.rawui.windowtitle=' '}"
chcp 65001 >nul
	echo %wtf%Seu computador tem 1 %m%SSD%w%
	cmd /c timeout 3 /nobreak >nul
	echo %wtf%Aplicando Tweaks para %g%SSD%w%
	        cmd /c timeout 6 /nobreak >nul
fsutil behavior set disabledeletenotify 0 >nul
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBoottrace" /t REG_DWORD /d "0" /f >nul
fsutil behavior set disableLastAccess 0 >nul
fsutil behavior set disable8dot3 1 >nul
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "DontVerifyRandomDrivers" /t REG_DWORD /d "1" /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Disk" /v EnableWriteCache /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisable8dot3NameCreation /t REG_DWORD /d 1 /f >nul 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisableLastAccessUpdate /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsMftZoneReservation /t REG_DWORD /d 2 /f >nul
schtasks /change /tn "Microsoft\Windows\Defrag\ScheduledDefrag" /disable >nul
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "0" /f >nul&&ECHO %ha%Sucesso%w%
	cmd /c timeout 5 /nobreak >nul
call :mem1

) else (
chcp 437 >nul
	cmd /c timeout 4 /nobreak >nul
powershell -nop -c "& {$host.ui.rawui.windowtitle=' '}"
	echo %wtf% Seu computador tem 1 HDD
	cmd /c timeout 3 /nobreak >nul
    echo %wtf% Aplicando Tweaks para %g%HDD%w%
	cmd /c timeout 3 /nobreak >nul
fsutil behavior set disabledeletenotify 0 >nul
fsutil behavior set disableLastAccess 2 >nul
fsutil behavior set disable8dot3 0 >nul
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBoottrace" /t REG_DWORD /d "0" /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Disk" /v EnableWriteCache /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisable8dot3NameCreation /t REG_DWORD /d 1 /f >nul 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisableLastAccessUpdate /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsMftZoneReservation /t REG_DWORD /d 2 /f >nul
call :mem1
)



:mem1
FOR /F %%A in ('"PROMPT $H&FOR %%B in (1) DO REM"') DO SET "BS=%%A"
cls
mode con: cols=84 lines=28
chcp 65001 >nul
echo( %y%
echo(
echo(
Call :TYPEfast "   • À otimização terminou até aqui, deseja fazer outras configurações extras?"
echo( 
chcp 437 >nul
echo(%b% 
Call Button  25 10 "   Sim   " 42 10 "    Nao    " # Press
Getinput /m !Press! /h 70
if %errorlevel%==1 (goto extra)
if %errorlevel%==2 (goto something)

:teclaerrada2
call :mem1


:extra
chcp 65001 >NUL
mode con: cols=74 lines=9
cls
cmd /c timeout 2 /nobreak >nul
echo(
echo( %r%
Call :TYPEfast "   • Deseja otimizar as configurações gerais do Windows? (S/N)"
echo(
echo(
set /p "diney=>%gg% "%w%

if !diney! equ s call :op1
if !diney! equ n call :op2

:tlll 
call :extra

:op1
chcp 437 > nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t REG_DWORD /d "5" /f >nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enabled" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enabled" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enabled" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enabled" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enabled" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f >nul
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v "Start" /t REG_DWORD /d "4" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v "Start" /t REG_DWORD /d "4" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /v "Start" /t REG_DWORD /d "4" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v "Start" /t REG_DWORD /d "4" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul
Reg.exe add "HKCU\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "0" /f >nul
Reg.exe add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "0" /f >nul
Reg.exe add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "0" /f >nul
Reg.exe add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f >nul
chcp 65001 > nul
call :extra2

:op2
call :extra2


:extra2
cls
cmd /c timeout 2 /nobreak >nul
echo(
echo( %r%
Call :TYPEfast "   • Deseja diminuir a latencia do monitor? (S/N)"
echo(
echo(
set /p "dine=>%gg% "%w%

if !dine! equ s call :opp1
if !dine! equ n call :opp2

:tll
call :extra2

:opp1
cmd /c timeout 3 /nobreak >nul
   reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f>nul
   reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d "0" /f>nul&&ECHO( %g% Sucesso
	call :leinu
	
	
:opp2
call :leinu


:leinu
cls
cmd /c timeout 2 /nobreak >nul
echo(
echo( %r%
Call :TYPEfast "   • Deseja desativar o Windows Update? (S/N)"
echo(
echo(
set /p "free=>%gg% "%w%

if !free! equ s call :oopp1
if !free! equ n call :oopp2


:tl
call :leinu


:oopp1

start Wub.exe
call :hashem


:oopp2
call :hashem




:hashem
cls
cmd /c timeout 2 /nobreak >nul
echo(
echo( %r%
Call :TYPEfast "   • Deseja ativar o Win32Priority na configuração máxima? (S/N)"
echo(
echo(
set /p "hashem=>%gg% "%w%

if !hashem! equ s call :oopp11
if !hashem! equ n call :oopp22

:A
call :hashem

:oopp11
cmd /c timeout 3 /nobreak >nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 0x2a /f >nul&&ECHO( %g%Sucesso
call :nomorehate


:oopp22
call :nomorehate




:nomorehate
cls
cmd /c timeout 2 /nobreak >nul
echo(
echo( %r%
Call :TYPEfast "   • Deseja Desativar a telemetria do office? (S/N)"
echo(
echo(
set /p "sivan=>%gg% "%w%

if !sivan! equ s call :oopp111
if !sivan! equ n call :oopp222

:echad
call :nomorehate


:oopp111
Reg.exe add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "sendcustomerdata" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "enabled" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "includescreenshot" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "SendTelemetry" /t REG_DWORD /d "3" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "qmenable" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "updatereliabilitydata" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "shownfirstrunoptin" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "skydrivesigninoption" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\ptwatson" /v "ptwoptin" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Firstrun" /v "disablemovie" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "Enablelogging" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnableFileObfuscation" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "accesssolution" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "olksolution" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "onenotesolution" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "pptsolution" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "projectsolution" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "publishersolution" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "visiosolution" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "wdsolution" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "xlsolution" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "agave" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "appaddins" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "comaddins" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "documentfiles" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "templatefiles" /t REG_DWORD /d "1" /f >nul&&Echo( %g%Sucesso
call :something

:oopp222
call :something



:something
mode 104,22

chcp 65001 >nul
echo(
echo(
echo(
set "lines[0]=                          ███╗   ███╗       ██╗       ███████╗        ██████╗"    
set "lines[1]=                          ████╗ ████║       ██║       ██╔════╝       ██╔════╝"   
set "lines[2]=                          ██╔████╔██║       ██║       ███████╗       ██║"        
set "lines[3]=                          ██║╚██╔╝██║       ██║       ╚════██║       ██║"         
set "lines[4]=                          ██║ ╚═╝ ██║       ██║       ███████║       ╚██████╗"    
set "lines[5]=                          ╚═╝     ╚═╝       ╚═╝       ╚══════╝        ╚═════╝"   
set "lines[6]=		 													"

set "corBaseR=255"
set "corBaseG=105"
set "corBaseB=180"
set "variacaoR=75"
set "variacaoG=0"
set "variacaoB=130"
set "ESC="

for /L %%j in (0,1,82) do (
    set /a "corR=corBaseR - (variacaoR * %%j / 82)"
    set /a "corG=corBaseG + (variacaoG * %%j / 82)"
    set /a "corB=corBaseB + (variacaoB * %%j / 82)"
    set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,6) do (
    set "texto=!lines[%%i]!"
    set "textoGradiente="
    for /L %%j in (0,1,82) do (
        set "char=!texto:~%%j,1!"
        if "%%char%%" neq "" (
            set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
        )
    )
    echo !textoGradiente!!ESC![0m
)

set "linhaGradiente="
set /a "espacosAntes=(80 - 82) / 2"
for /L %%k in (1,1,!espacosAntes!) do set "linhaGradiente=!linhaGradiente! "
for /L %%j in (0,1,82) do (
    set /a "corR=corBaseR - (variacaoR * %%j / 82)"
    set /a "corG=corBaseG + (variacaoG * %%j / 82)"
    set /a "corB=corBaseB + (variacaoB * %%j / 82)"
    set "linhaGradiente=!linhaGradiente!!ESC![38;2;!corR!;!corG!;!corB!m─"
)
set /a "espacosDepois=(80 - 82) / 2"
for /L %%k in (1,1,!espacosDepois!) do set "linhaGradiente=!linhaGradiente! "
echo(          %linhaGradiente%!ESC![0m


chcp 437 >nul
echo(%wtf% 
Call Button 25 13 "   Creditos   " 45 13 "    Duvidas Frequentes    " 30 17 "    Agradecimentos especiais     "  # Press

Getinput /m !Press! /h 70
if %errorlevel%==1 (goto credt)
if %errorlevel%==2 (call :lixo)
if %errorlevel%==3 (call :oi)

:memphis
call :something


:credt
start creditos.hta
call :something


:lixo
start likethis.hta
goto :somenthing

:oi
start huh.hta
call :something













:TYPE
SET "d[text]=%~1"
CALL :TYPELOOP
GOTO :EOF


:TYPELOOP
IF "%d[text]:~0,1%" == "#" (
    <NUL SET /P "=^!"
) else (
    <NUL SET /P "=d!BS!%d[text]:~0,1%"
)
SET "d[text]=%d[text]:~1%"
IF "%d[text]%" == "" (
    GOTO :EOF
) else (
    FOR /L %%J in (1, 100, 10000000) DO REM
    GOTO :TYPELOOP
)
exit


:TYPEFast
SET "d[text]=%~1"
CALL :TYPELOOPFast
GOTO :EOF


:TYPELOOPFast
IF "%d[text]:~0,1%" == "#" (
    <NUL SET /P "=^!"
) else (
    <NUL SET /P "=d!BS!%d[text]:~0,1%"
)
SET "d[text]=%d[text]:~1%"
IF "%d[text]%" == "" (
    GOTO :EOF
) else (
    FOR /L %%J in (1, 100, 1000000) DO REM
    GOTO :TYPELOOPFast
)


:ColorText      
<nul set /p ".=%DEL%" > "%~2"    
findstr /v /a:%1 /R "^$" "%~2" nul    
del "%~2" > nul 2>&1    
goto :eof 
