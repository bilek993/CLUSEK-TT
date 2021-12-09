@echo off
call flutter pub run build_runner build
call flutter gen-l10n
