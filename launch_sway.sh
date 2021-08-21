# env vars
#export GDK_BACKEND="wayland"
#export MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1

#export __NV_PRIME_RENDER_OFFLOAD=1
#export __GLX_VENDOR_LIBRARY_NAME=nvidia
 #export QT_QPA_PLATFORM=wayland
# launch sway wm
exec sway --my-next-gpu-wont-be-nvidia
