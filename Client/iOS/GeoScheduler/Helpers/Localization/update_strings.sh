#!/bin/bash

PROJECT_DIR=$1

if which bartycrouch > /dev/null; then
    # Incrementally update all Storyboards/XIBs strings files
    bartycrouch interfaces -b -p "$PROJECT_DIR"

    # Add new keys to Localizable.strings files from NSLocalizedString in code
    bartycrouch code -p "$PROJECT_DIR" -l "$PROJECT_DIR" -k -s -f "LocalizedString"
else
    echo "warning: BartyCrouch not installed, download it from https://github.com/Flinesoft/BartyCrouch"
fi