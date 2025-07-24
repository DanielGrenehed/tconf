#!/bin/bash

if busctl --user | grep gnome-terminal >/dev/null; then
  echo "gnome-terminal is already running"
else
  gnome-terminal &
  exit
fi

busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s \
    'global.get_window_actors().find(w => w.meta_window.get_wm_class() == "gnome-terminal").meta_window.activate(global.get_current_time());'

#busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval s '
#let apps= global.display.focus_window.get_workspace().list_windows().filter(w => w.wm_class == "gnome-terminal");
#if (apps.length > 0) apps[0].activate(global.get_current_time());
#  ""' > /dev/null
