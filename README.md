# docker-android-images

Docker images for Android SDK and Emulators

## android-sdk.Dockerfile

Downloads the Android SDK and installs build tools and platform tools.

### Image name

`reactivecircus/android-sdk`

### Image version

Image versions (tags) can be found on [Docker Hub](https://hub.docker.com/r/reactivecircus/android-sdk/tags/)

### Current SDK Versions

* Build tools - `29.0.2`
* Platform tools - `29`

### Base image

`ubuntu:16.04`

### Included packages

* `openjdk-8-jdk`
* `curl`
* `unzip`

## android-emulator-&lt;api-version&gt;.Dockerfile

Downloads and installs packages required for hardware acceleration with **kvm**, and the Android system image for the `<api-version>`. All system images are `Google APIs Intel x86 Atom`.

**Note: host machine must support hardware acceleration in the BIOS settings in order to run x86 emulators, which is not the case with most of the hosted CI services.**

### Update 1 (26/02/2019)

The [new emulator 28.1.8 Canary](https://androidstudio.googleblog.com/2019/02/emulator-2818-canary.html) introduced a headless emulator build without KVM dependency which is a blocker for running instrumented tests on most cloud CI services as the host machines usually don't have the required bios settings turned on for KVM. The [android-emulator-28.Dockerfile](android-emulator-28.Dockerfile) has been updated to the canary build for experimenting with this. [Related discussion with the Android Emulator Team on reddit](https://www.reddit.com/r/androiddev/comments/atm3im/emulator_2818_canary/eh6uv01/?context=8&depth=9)

### Update 2 (17/08/2019)

`emulator-headless` has been released to stable channel for a few months but is still not practically usable in a CI environment with limited memory.

### Update 3 (02/11/2019)

`emulator-headless` is retired in [Emulator 29.2.7 Canary](https://androidstudio.googleblog.com/2019/11/emulator-2927-canary.html). Headless emulator can be launched with `emulator -no-window`.

### Image name

`ychescale9/android-emulator-<api-version>`

### Image version

Image versions (tags) can be found on Docker Hub:
* [android-emulator-22](https://hub.docker.com/r/ychescale9/android-emulator-22/tags/)
* [android-emulator-23](https://hub.docker.com/r/ychescale9/android-emulator-23/tags/)
* [android-emulator-27](https://hub.docker.com/r/ychescale9/android-emulator-27/tags/)
* [android-emulator-28](https://hub.docker.com/r/reactivecircus/android-emulator-28/tags/)
* [android-emulator-29](https://hub.docker.com/r/reactivecircus/android-emulator-29/tags/)

### Base image

`reactivecircus/android-sdk:<latest-image-version>`

### Included packages

* `libc++1`
