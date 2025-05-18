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