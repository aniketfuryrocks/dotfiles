# env vars
export GDK_BACKEND="wayland"
export MOZ_ENABLE_WAYLAND=1
#export QT_QPA_PLATFORM=wayland
# launch sway wm
exec sway --my-next-gpu-wont-be-nvidia
