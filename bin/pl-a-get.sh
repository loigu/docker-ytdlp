#!/bin/bash
yt-dlp -f worstaudio[protocol=https] --yes-playlist --embed-metadata --embed-chapters  "$@"
