---
layout: post
title: Apple Sierra - Not Developer Grade
category: postmac
tags: ["apple", "mac", "postmac"]
---
Dear Apple, 

Note: I'm writing this on my new MacBook Pro, freshly rebooted.  Arggh...

I got my first Mac in 1987 and I have loved you for years and years.  And then when OSX became really, really viable for developers, I jumped on board back in 2006 and I've never looked back.  At last count there are well over double digit numbers of Apple devices in my house from laptops to desktops to iphones to ipads.  Honestly there isn't much that you make that I don't have at this point.

Unfortunately, as of late, it feels like we're stuck in a dysfunctional relationship.  I'm not a fan of your latest hardware.  And since I needed an upgrade, I went with the last generation top of the line and spent almost $3,000 with you.  Sadly this machine is not developer grade and I put the burden on Mac OS Sierra.  **Three** times now in the past two weeks, I've had kernel panics.  Here's the latest one:

    Anonymous UUID:       0BED44E4-EF15-166F-0516-B0506E8AF4A8

    Sat Jan 28 04:53:12 2017

    *** Panic Report ***
    Machine-check capabilities: 0x0000000001000c07
     family: 6 model: 61 stepping: 4 microcode: 33
     signature: 0x306d4
     Intel(R) Core(TM) i7-5557U CPU @ 3.10GHz
     7 error-reporting banks
    Processor 0: IA32_MCG_STATUS: 0x0000000000000005
     IA32_MC1_STATUS(0x405): 0xbf80000000000114
     IA32_MC1_ADDR(0x406):   0x0000000333a6d840
     IA32_MC1_MISC(0x407):   0x0000000000000086
    Processor 1: IA32_MCG_STATUS: 0x0000000000000005
     IA32_MC1_STATUS(0x405): 0xbf80000000000114
     IA32_MC1_ADDR(0x406):   0x0000000333a6d840
     IA32_MC1_MISC(0x407):   0x0000000000000086
    panic(cpu 2 caller 0xffffff8016c07125): "Machine Check at 0x00007fff7dd40e93, registers:\n" "CR0: 0x0000000080010033, CR2: 0x000000011485f000, CR3: 0x0000000332cd9085, CR4: 0x00000000003627e0\n" "RAX: 0x0000608003c79480, RBX: 0x0000608003c79480, RCX: 0x00007fff7e8bd78e, RDX: 0x0000000000000000\n" "RSP: 0x00007fff5113bb38, RBP: 0x00007fff5113bb60, RSI: 0x00007fff7e86b87d, RDI: 0x0000608000765dc0\n" "R8:  0x0000000000001914, R9:  0x0000000000001915, R10: 0x00007fff9a3c5ef8, R11: 0x00007f94d5b4c5d0\n" "R12: 0x0000608000765dc0, R13: 0x00007fff7e866001, R14: 0x0000608000765dc0, R15: 0x00007fff9485eb40\n" "RFL: 0x0000000000000246, RIP: 0x00007fff7dd40e93, CS:  0x000000000000002b, SS:  0x0000000000000023\n" "Error code: 0x0000000000000000\n"@/Library/Caches/com.apple.xbs/Sources/xnu/xnu-3789.21.3/osfmk/i386/trap_native.c:168
    Backtrace (CPU 2), Frame : Return Address
    0xffffff922c27bdd0 : 0xffffff8016af368c 
    0xffffff922c27be50 : 0xffffff8016c07125 
    0xffffff922c27bfb0 : 0xffffff8016aa5fdf 

    **BSD process name corresponding to current thread: Mail**

    Mac OS version:
    16B2555

    Kernel version:
    Darwin Kernel Version 16.1.0: Thu Oct 13 21:26:57 PDT 2016; root:xnu-3789.21.3~60/RELEASE_X86_64
    Kernel UUID: 8941AC1C-B084-37DE-8A34-4CE638C5CFC9
    Kernel slide:     0x0000000016800000
    Kernel text base: 0xffffff8016a00000
    __HIB  text base: 0xffffff8016900000
    System model name: MacBookPro12,1 (Mac-E43C1C25D4880AD6)

    System uptime in nanoseconds: 342781203597508
    last loaded kext at 337660924571055: com.apple.iokit.AppleBCM5701Ethernet	10.2.6 (addr 0xffffff7f99be6000, size 307200)
    last unloaded kext at 337871927422739: com.apple.driver.usb.AppleUSBHostCompositeDevice	1.1 (addr 0xffffff7f99b2b000, size 28672)
    loaded kexts:
    org.virtualbox.kext.VBoxNetAdp	5.1.8
    org.virtualbox.kext.VBoxNetFlt	5.1.8
    org.virtualbox.kext.VBoxUSB	5.1.8
    org.virtualbox.kext.VBoxDrv	5.1.8
    com.apple.iokit.AppleBCM5701Ethernet	10.2.6
    com.apple.filesystems.smbfs	3.1
    com.apple.filesystems.autofs	3.0
    com.apple.driver.AudioAUUC	1.70
    com.apple.driver.ApplePlatformEnabler	2.7.0d0
    com.apple.driver.AGPM	110.23.11
    com.apple.driver.X86PlatformShim	1.0.0
    com.apple.driver.AppleOSXWatchdog	1
    com.apple.driver.AppleGraphicsDevicePolicy	3.13.74
    com.apple.driver.AppleUpstreamUserClient	3.6.4
    com.apple.driver.AppleHDA	278.23
    com.apple.driver.pmtelemetry	1
    com.apple.iokit.IOUserEthernet	1.0.1
    com.apple.iokit.IOBluetoothSerialManager	5.0.1f7
    com.apple.Dont_Steal_Mac_OS_X	7.0.0
    com.apple.driver.AppleHV	1
    com.apple.driver.AppleLPC	3.1
    com.apple.driver.AppleThunderboltIP	3.0.8
    com.apple.driver.AppleIntelBDWGraphics	10.2.0
    com.apple.driver.AppleIntelSlowAdaptiveClocking	4.0.0
    com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport	5.0.1f7
    com.apple.driver.AppleCameraInterface	5.57.0
    com.apple.driver.AppleSMCLMU	208
    com.apple.driver.AppleBacklight	170.9.10
    com.apple.driver.AppleMCCSControl	1.2.13
    com.apple.driver.AppleIntelBDWGraphicsFramebuffer	10.2.0
    com.apple.driver.AppleUSBCardReader	404.20.1
    com.apple.AppleFSCompression.AppleFSCompressionTypeDataless	1.0.0d1
    com.apple.AppleFSCompression.AppleFSCompressionTypeZlib	1.0.0
    com.apple.BootCache	40
    com.apple.filesystems.hfs.kext	366.1.1
    com.apple.iokit.IOAHCIBlockStorage	295.20.1
    com.apple.driver.AppleAHCIPort	326
    com.apple.driver.AppleTopCaseHIDEventDriver	103
    com.apple.driver.AirPort.Brcm4360	1110.4.1a8
    com.apple.driver.AppleSmartBatteryManager	161.0.0
    com.apple.driver.AppleRTC	2.0
    com.apple.driver.AppleACPIButtons	5.0
    com.apple.driver.AppleHPET	1.8
    com.apple.driver.AppleSMBIOS	2.1
    com.apple.driver.AppleACPIEC	5.0
    com.apple.driver.AppleAPIC	1.7
    com.apple.nke.applicationfirewall	172
    com.apple.security.quarantine	3
    com.apple.security.TMSafetyNet	8
    com.apple.iokit.IOEthernetAVBController	1.0.3b4
    com.apple.driver.AppleThunderboltPCIUpAdapter	2.0.5
    com.apple.iokit.IOUSBUserClient	900.4.1
    com.apple.kext.triggers	1.0
    com.apple.driver.DspFuncLib	278.23
    com.apple.kext.OSvKernDSPLib	525
    com.apple.iokit.IOSurface	153.1
    com.apple.driver.X86PlatformPlugin	1.0.0
    com.apple.driver.IOPlatformPluginFamily	6.0.0d8
    com.apple.iokit.IOSlowAdaptiveClockingFamily	1.0.0
    com.apple.iokit.IOBluetoothHostControllerUSBTransport	5.0.1f7
    com.apple.iokit.IOBluetoothHostControllerTransport	5.0.1f7
    com.apple.iokit.IOBluetoothFamily	5.0.1f7
    com.apple.driver.AppleHDAController	278.23
    com.apple.iokit.IOHDAFamily	278.23
    com.apple.iokit.IOAudioFamily	205.11
    com.apple.vecLib.kext	1.2.0
    com.apple.iokit.IOSerialFamily	11
    com.apple.driver.AppleGraphicsControl	3.13.74
    com.apple.driver.AppleBacklightExpert	1.1.0
    com.apple.iokit.IONDRVSupport	2.4.1
    com.apple.driver.AppleSMC	3.1.9
    com.apple.driver.AppleSMBusController	1.0.14d1
    com.apple.AppleGraphicsDeviceControl	3.13.74
    com.apple.iokit.IOAcceleratorFamily2	288.15
    com.apple.iokit.IOGraphicsFamily	2.4.1
    com.apple.iokit.IOSCSIBlockCommandsDevice	394
    com.apple.iokit.IOUSBMassStorageDriver	131.1.1
    com.apple.iokit.IOSCSIArchitectureModelFamily	394
    com.apple.driver.usb.networking	5.0.0
    com.apple.driver.AppleThunderboltDPInAdapter	4.5.5
    com.apple.driver.AppleThunderboltDPAdapterFamily	4.5.5
    com.apple.driver.AppleThunderboltPCIDownAdapter	2.0.5
    com.apple.driver.CoreStorage	540
    com.apple.filesystems.hfs.encodings.kext	1
    com.apple.iokit.IOAHCIFamily	288
    com.apple.driver.AppleHIDKeyboard	197
    com.apple.driver.AppleMultitouchDriver	368.4
    com.apple.driver.AppleInputDeviceSupport	76.4
    com.apple.driver.AppleHSSPIHIDDriver	49
    com.apple.driver.AppleThunderboltNHI	4.1.6
    com.apple.iokit.IOThunderboltFamily	6.2.3
    com.apple.iokit.IO80211Family	1200.12.2
    com.apple.driver.mDNSOffloadUserClient	1.0.1b8
    com.apple.iokit.IONetworkingFamily	3.2
    com.apple.driver.corecapture	1.0.4
    com.apple.driver.AppleHSSPISupport	49
    com.apple.driver.AppleIntelLpssSpiController	3.0.60
    com.apple.driver.AppleIntelLpssDmac	3.0.60
    com.apple.driver.AppleIntelLpssGspi	3.0.60
    com.apple.driver.usb.AppleUSBXHCIPCI	1.1
    com.apple.driver.usb.AppleUSBXHCI	1.1
    com.apple.driver.usb.AppleUSBHostPacketFilter	1.0
    com.apple.iokit.IOUSBFamily	900.4.1
    com.apple.iokit.IOUSBHostFamily	1.1
    com.apple.driver.AppleUSBHostMergeProperties	1.1
    com.apple.driver.AppleBusPowerController	1.0
    com.apple.driver.AppleEFINVRAM	2.1
    com.apple.driver.AppleEFIRuntime	2.0
    com.apple.iokit.IOHIDFamily	2.0.0
    com.apple.iokit.IOSMBusFamily	1.1
    com.apple.security.sandbox	300.0
    com.apple.kext.AppleMatch	1.0.0d1
    com.apple.driver.AppleKeyStore	2
    com.apple.driver.AppleMobileFileIntegrity	1.0.5
    com.apple.driver.AppleCredentialManager	1.0
    com.apple.driver.DiskImages	444.20.3
    com.apple.iokit.IOStorageFamily	2.1
    com.apple.iokit.IOReportFamily	31
    com.apple.driver.AppleFDEKeyStore	28.30
    com.apple.driver.AppleACPIPlatform	5.0
    com.apple.iokit.IOPCIFamily	2.9
    com.apple.iokit.IOACPIFamily	1.4
    com.apple.kec.Libm	1
    com.apple.kec.pthread	1
    com.apple.kec.corecrypto	1.0
    Model: MacBookPro12,1, BootROM MBP121.0167.B17, 2 processors, Intel Core i7, 3.1 GHz, 16 GB, SMC 2.28f7
    Graphics: Intel Iris Graphics 6100, Intel Iris Graphics 6100, Built-In
    Memory Module: BANK 0/DIMM0, 8 GB, DDR3, 1867 MHz, 0x02FE, 0x4544464232333241314D412D4A442D460000
    Memory Module: BANK 1/DIMM0, 8 GB, DDR3, 1867 MHz, 0x02FE, 0x4544464232333241314D412D4A442D460000
    AirPort: spairport_wireless_card_type_airport_extreme (0x14E4, 0x133), Broadcom BCM43xx 1.0 (7.21.171.47.1a8)
    Bluetooth: Version 5.0.1f7, 3 services, 27 devices, 1 incoming serial ports
    Network Service: Thunderbolt Ethernet, Ethernet, en4
    Network Service: Wi-Fi, AirPort, en0
    PCI Card: Apple 57762-A0, Ethernet Controller, Thunderbolt@195,0,0
    Serial ATA Device: APPLE SSD SM1024G, 1 TB
    USB Device: USB 3.0 Bus
    USB Device: Bluetooth USB Host Controller
    Thunderbolt Bus: MacBook Pro, Apple Inc., 27.1
    Thunderbolt Device: Thunderbolt to Gigabit Ethernet Adapter, Apple Inc., 1, 5.5

I run two machines side by side, an early 2014 MacBook Air running El Capitan and this machine, a MacBook Pro 13" running Sierra.  I put my MacBook Air, with less RAM and a slower SSD thru a far more intensive work load then this machine which I use solely for email (using Apple Mail) and development of a new side project which I wanted to keep entirely separate from all my paid work.

What the hell Apple?  I mean seriously -- Mail is the damn issue?  I'm going to go ahead and pull Apple Mail from the Dock so I'm not tempted to use it anymore.  I can revert back to browser based gmail I suppose but come on -- I've never thought that Sierra was a good release ever since I burned half a man day helping [Dv](http;//dasari.me) just get Rails development back on track after his upgrade to Sierra but this is ridiculous.

**Sidebar**: I just tried to look up pricing on a new iPad for one of my kids home schooling and I got "An error occurred tring to fulfill your request.  Please try again later."  Software quality really seems to be an overall problem for Apple at this point.

I've now officially stopped recommending Apple hardware to people and if getting rid of mail doesn't resolve this then I'm going to seriously go down the Dell XPS running Ubuntu Mate route.
