# DFRoot for SM-S938B / S938BXXSCCZH1

Firmware-specific DFRoot build embedding KernelSU Next v3.4.0 for Samsung Galaxy S25 Ultra firmware `S938BXXSCCZH1`.

## Target contract

- Device: Samsung Galaxy S25 Ultra `SM-S938B`
- Firmware: `S938BXXSCCZH1`
- Kernel: `6.6.98-android15-8-pd6ff1cd-abogkiS938BXXSCCZH1-4k`
- KernelSU mode: late-load LKM
- Samsung adaptations: KDP, RKP, DEFEX and no-patch-text

The embedded `ksud` contains the firmware-specific `android15-6.6_kernelsu.ko`, built with the target's additional `task_struct.android_vendor_data2` ABI field. Compatibility validation passed for vermagic, required symbols, CRC divergence, BTF layouts and `struct module` relocations.

Build the APK with:

```bash
./gradlew assembleDebug
cp app/build/outputs/apk/debug/dirtyfrag.apk dirtyfrag.apk
```

**Warning:** this payload is firmware-bound. Do not install or execute it on a different device or firmware.

To rebuild KernelSU Next, embed the resulting `ksud`, and compile the APK in one command:

```bash
./scripts/build-s938b-cczh1.sh
```
