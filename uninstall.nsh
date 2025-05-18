;-----Uninstall----------------
Section "Uninstall"

  RMDir /r "$INSTDIR"
  RMDir /r "$APPDATA\Ryujinx"
  RMDir /r "$SMPROGRAMS\Ryujinx"

SectionEnd
;------------------------------