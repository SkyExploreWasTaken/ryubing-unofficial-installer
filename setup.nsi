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