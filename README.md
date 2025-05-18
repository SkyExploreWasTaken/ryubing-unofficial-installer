# [Ryujinx](https://github.com/Ryubing) fan-made Installer by [SkyExploreWT](https://sewt.is-a.dev)

### This is the code of my custom fan-made installer for [Ryujinx](https://github.com/Ryubing), the best [Nintendo Switch](https://www.nintendo.com/gaming-systems/switch/) emulator. It is divided in multiple files, to gain readability.

setup.nsi

~~~nsis
!include "MUI2.nsh"

;-----Details------------------
Name "Ryujinx"
OutFile "RyujinxSetup.exe"
Unicode True
InstallDir "C:\Emulators\Ryujinx"
RequestExecutionLevel user
SetCompressor /FINAL zlib
;------------------------------

;-----MUI-Configuration--------
!define MUI_LANGDLL_ALWAYSSHOW
!define MUI_ICON "Ryujinx.ico"
!define MUI_UNICON "Ryujinx.ico"
!define MUI_ABORTWARNING
    !define MUI_ABORTWARNING_CANCEL_DEFAULT
!define MUI_LICENSEPAGE_CHECKBOX
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_FINISHPAGE_RUN "$INSTDIR\Ryujinx.exe"
    !define MUI_FINISHPAGE_RUN_NOTCHECKED
!define MUI_UNABORTWARNING
    !define MUI_UNABORTWARNING_CANCEL_DEFAULT
;------------------------------

;-----Pages--------------------
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE LICENSE
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH
;------------------------------

;-----Language-----------------
!include language.nsh
;------------------------------

;-----Install-Uninstall--------
!include "install.nsh"
!include "uninstall.nsh"
;------------------------------
~~~

language.nsh

~~~nsis
;-----Language-----------------
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "French"
!insertmacro MUI_LANGUAGE "German"
!insertmacro MUI_LANGUAGE "Spanish"
!insertmacro MUI_LANGUAGE "SimpChinese"
!insertmacro MUI_LANGUAGE "TradChinese"
!insertmacro MUI_LANGUAGE "Hindi"
!insertmacro MUI_LANGUAGE "Japanese"
!insertmacro MUI_LANGUAGE "Korean"
!insertmacro MUI_LANGUAGE "Italian"
!insertmacro MUI_LANGUAGE "Dutch"
!insertmacro MUI_LANGUAGE "Danish"
!insertmacro MUI_LANGUAGE "Swedish"
!insertmacro MUI_LANGUAGE "Norwegian"
!insertmacro MUI_LANGUAGE "Finnish"
!insertmacro MUI_LANGUAGE "Greek"
!insertmacro MUI_LANGUAGE "Russian"
!insertmacro MUI_LANGUAGE "Portuguese"
!insertmacro MUI_LANGUAGE "PortugueseBR"
!insertmacro MUI_LANGUAGE "Arabic"
!insertmacro MUI_LANGUAGE "Polish"
!insertmacro MUI_LANGUAGE "Romanian"
!insertmacro MUI_LANGUAGE "Slovak"
!insertmacro MUI_LANGUAGE "Czech"
!insertmacro MUI_LANGUAGE "Hungarian"
!insertmacro MUI_LANGUAGE "Catalan"
!insertmacro MUI_LANGUAGE "Bulgarian"
Function .onInit
         !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd
;------------------------------
~~~

install.nsh

~~~nsis
;-----Install------------------
Section "Install"
  CreateDirectory "$INSTDIR"
  CreateDirectory "$INSTDIR\firmware"

  SetOutPath "$INSTDIR"
  File /r "Ryujinx\*"

  SetOutPath "$INSTDIR\firmware"
  File /r "firmware\*"

  CreateDirectory "$APPDATA\Ryujinx"
  CreateDirectory "$APPDATA\Ryujinx\system"

  SetOutPath "$APPDATA\Ryujinx\system"
  File "title.keys"
  File "prod.keys"

  CreateDirectory "$SMPROGRAMS\Ryujinx"
  CreateShortCut "$SMPROGRAMS\Ryujinx\Ryujinx.lnk" "$INSTDIR\Ryujinx.exe"
  CreateShortCut "$SMPROGRAMS\Ryujinx\Uninstall Ryujinx.lnk" "$INSTDIR\Uninstall.exe"

  WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd
;------------------------------
~~~

uninstall.nsh

~~~nsis
;-----Uninstall----------------
Section "Uninstall"

  RMDir /r "$INSTDIR"
  RMDir /r "$APPDATA\Ryujinx"
  RMDir /r "$SMPROGRAMS\Ryujinx"

SectionEnd
;------------------------------
~~~