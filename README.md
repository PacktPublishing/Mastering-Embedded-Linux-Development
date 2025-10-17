# Mastering Embedded Linux Development – Fourth Edition

This is the code repository for [Mastering Embedded Linux Development – Fourth Edition](https://www.packtpub.com/product/mastering-embedded-linux-programming-third-edition/9781803232591?utm_source=github&utm_medium=repository&utm_campaign=9781803232591), published by Packt.

**Create fast and reliable embedded solutions with Linux 6.6 and the Yocto Project 5.0 (Scarthgap)**

## What is this book about?
Embedded Linux runs many of the devices we use every day. From smart TVs and Wi-Fi routers to test equipment and industrial controllers, all of them have Linux as their heart. The Linux operating system is one of the foundational technologies that powers the internet. This book starts by breaking down the fundamental elements that underpin all embedded Linux projects: the toolchain, the bootloader, the kernel, and the root filesystem. After that, you will learn how to generate the last three elements from scratch and automate the process using Buildroot and the Yocto Project.

This book covers the following exciting topics:
* Create embedded Linux systems with Buildroot and the Yocto Project
* Troubleshoot BitBake build failures and streamline your Yocto development workflow
* Update devices securely in the field using Mender or balena
* Prototype peripheral additions by with add-on boards
* Interact with hardware without having to write kernel device drivers

If you feel this book is for you, get your [copy](https://www.amazon.com/dp/1803232595) today!

## Instructions and navigation
All of the code is organized into folders. For example, `Chapter02`.

The code will look like the following:
```
if (test expression)
{
  Statement upon condition is true
}
```

## What do you need for this book?
If you're a software engineer or system administrator who wants to learn how to run Linux on embedded devices, then this book is for you. Firmware engineers accustomed to programming for low-power microcontrollers can use this book to help make the leap to high-speed systems on chips that can run Linux. Anyone responsible for developing new hardware that needs to run Linux will also find this book useful. Basic working knowledge of the POSIX standard, C programming, Python programming, and shell scripting is assumed.

With the following software and hardware you can run all of the code examples present in the book (Chapters 1-21).

### Software and hardware list

| Chapters                    | Software/Hardware Required          | OS Required              |
| --------------------------- | ----------------------------------- | ------------------------ |
| 3, 4, 5, 6, 9, 11, 12, 14   | BeaglePlay                          | Debian 12.7 Minimal      |
| 4, 6, 7, 10, 16, 19, 20     | Raspberry Pi 4                      | Ubuntu Server 24.04 LTS  |
| 4, 5, 6, 7, 10              | QEMU (64-bit Arm)                   | Ubuntu Desktop 24.04 LTS |
| 6, 7, 8, 10, 11, 13, 19, 21 | Yocto Project 5.0 (Scarthgap)       | Ubuntu Desktop 24.04 LTS |
| 6, 13, 19, 20               | Buildroot 2024.02 LTS               | Ubuntu Desktop 24.04 LTS |
| 2, 3, 4, 5                  | Bootlin aarch64 toolchain 2024.02-1 | Ubuntu Desktop 24.04 LTS |
| 3, 4, 5                     | Arm GNU AArch32 toolchain 13.2.Rel1 | Ubuntu Desktop 24.04 LTS |
| 3, 4, 5                     | U-Boot v2024.04                     | Ubuntu Desktop 24.04 LTS |
| 4, 5                        | Linux Kernel 6.6                    | Ubuntu Desktop 24.04 LTS |

## Errata

**Page 15**: I recommend using Ubuntu 24.04 LTS as your development host environment throughout the course of the book. However, I failed to mention that you need an x86-64 version of Ubuntu for the exercises the work verbatim. If you are on Apple Silicon, you can achieve that by creating an x86-64 Ubuntu VM. Select "with Rosetta" when creating your Ubuntu VM under Parallels.

**Page 68**: Cloning TI's `ti-linux-firmware` Git repo hangs indefinitely because the URL has changed. Clone `ti-linux-firmware` from its new location instead.

```bash
$ cd ~
$ git clone https://github.com/TexasInstruments/ti-linux-firmware.git
$ cd ti-linux-firmware
$ git checkout c126d386
```

Cloning TI's `k3-image-gen` Git repo fails with `Fatal: unable to connect to git.ti.com`. Clone `k3-image-gen` from BeagleBoard's GitHub mirror instead.

```bash
$ cd ~
$ git clone https://github.com/beagleboard/k3-image-gen.git
$ cd k3-image-gen
$ git checkout 150f195
```

**Page 452**: The version of Docker bundled with the `docker.io` package is severely outdated. Install `docker-ce` instead. See dockerdocs for [instructions](https://docs.docker.com/engine/install/ubuntu/) on how to uninstall old versions and install the official version of Docker.

## Get to know the authors
**Frank Vasquez** is an independent software consultant specializing in consumer electronics. He has more than a decade of experience designing and building embedded Linux systems. During that time, he has shipped numerous products, including a rackmount DSP audio server, a diver-held sonar camcorder, an IoT hotspot, a home battery, and a grid-scale energy storage system. Since the third edition of this book was published, Frank has also become a frequent speaker at open-source software conferences including The Yocto Project Summit, Embedded Linux Conference, FOSDEM, and All Systems Go!

**Chris Simmonds** is a software consultant and trainer living in southern England. He has over two decades of experience designing and building open-source embedded systems. He is the founder and chief consultant at 2net Ltd, which provides professional training and mentoring services in embedded Linux, Linux device drivers, and Android platform development. He has trained engineers at many of the biggest companies in the embedded world, including Arm, Qualcomm, Intel, Ericsson, and General Dynamics. He is a frequent presenter at open-source and embedded conferences, including the Embedded Linux Conference and Embedded World.

### Download a free PDF

<i>If you have already purchased a print or Kindle version of this book, you can get a DRM-free PDF version at no extra cost. Simply click on the link to claim your free PDF.</i>
<p align="center"> <a href="https://packt.link/free-ebook/9781803232591">https://packt.link/free-ebook/9781803232591</a></p>
