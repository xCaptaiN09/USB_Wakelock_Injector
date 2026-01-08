# USB Audio Wakelock Injector
**Author:** xCaptaiN09
**Version:** v1.0

## ⚡ Overview
A hybrid Magisk module designed to fix audio cutouts, silence on connection, and "pause death" for USB-C DACs (e.g., Moondrop Chu II DSP) on Custom ROMs.

## 🔧 How It Works
1. **Surgical Power Keepalive:** Prevents the kernel from suspending the `snd_usb_audio` driver during short pauses (fixes resume failure).
2. **Connection Watchdog:** Restarts `audioserver` once upon USB DAC detection to force immediate audio routing.

## ⚠️ Technical Disclosure
This module sets `snd_usb_audio.power_save=0` while a DAC is connected. This keeps the audio interface awake to prevent hardware sleep bugs. It does **not** force global USB wakelocks (charging/camera are unaffected).

## 📥 Installation
1. Flash via Magisk or KernelSU.
2. Reboot.
3. Plug in your DAC.
