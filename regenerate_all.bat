@echo off
call flutter pub run build_runner build --delete-conflicting-outputs
call flutter gen-l10n
