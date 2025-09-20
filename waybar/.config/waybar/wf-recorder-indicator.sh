#!/bin/bash

if /usr/bin/pgrep wf-recorder >/dev/null 2>&1; then
  echo '{"text": "●", "tooltip": "Recording", "class": "recording"}'
else
  echo '{"text": "", "tooltip": "Not recording", "class": "idle"}'
fi
