---
layout: post
title: Why I Haven't Left OSX Despite Constant Crashes, Lockups and Other Bullcrappery
---

Anonymous UUID:       0BED44E4-EF15-166F-0516-B0506E8AF4A8

Thu Jun  1 15:23:01 2017

*** MCA Error Report ***
CPU Machine Check Architecture Error Dump (CPU: Intel(R) Core(TM) i7-5557U CPU @ 3.10GHz, CPUID: 0x306D4)
Core: 0 
  IA32_MC1_STATUS=0xFF80000000000124
  IA32_MC1_CTL=0x0
  IA32_MC1_ADDR=0x30B03E340
  IA32_MC1_MISC=0x86
Core: 0 
  IA32_MC5_STATUS=0xEE0000000040110B
  IA32_MC5_CTL=0x0
  IA32_MC5_ADDR=0xFF7075C0
  IA32_MC5_MISC=0x3880000086
Core: 0 
  IA32_MC6_STATUS=0xEE0000000040110B
  IA32_MC6_CTL=0x0
  IA32_MC6_ADDR=0xFF70FBC0
  IA32_MC6_MISC=0x3880000086


*** Device Tree ***
{
    "pcie_cfg_base" : "0xe0000000",
    "pci_devices" :
    {
        "0x10000" : "IGPU@2",
        "0xa0000" : "XHC1@14",
        "0xb0000" : "pci8086,9cba@16",
        "0x0" : "MCHC@0",
        "0xa8000" : "SDMA@15",
        "0xac000" : "SPI1@15,4",
        "0x18000" : "HDAU@3",
        "0xd8000" : "HDEF@1B",
        "0xe0000" : "RP01@1C",
        "0xe1000" : "RP02@1C,1",
        "0xe2000" : "RP03@1C,2",
        "0xe4000" : "RP05@1C,4",
        "0x300000" : "RP03@1C,2/IOPP/ARPT@0",
        "0x200000" : "RP02@1C,1/IOPP/CMRA@0",
        "0x500000" : "RP05@1C,4/IOPP/UPSB@0",
        "0x600000" : "RP05@1C,4/IOPP/UPSB@0/IOPP/DSB0@0",
        "0x618000" : "RP05@1C,4/IOPP/UPSB@0/IOPP/DSB1@3",
        "0x630000" : "RP05@1C,4/IOPP/UPSB@0/IOPP/DSB4@6",
        "0x620000" : "RP05@1C,4/IOPP/UPSB@0/IOPP/DSB2@4",
        "0x628000" : "RP05@1C,4/IOPP/UPSB@0/IOPP/DSB3@5",
        "0x700000" : "RP05@1C,4/IOPP/UPSB@0/IOPP/DSB0@0/IOPP/NHI0@0",
        "0xe5000" : "RP06@1C,5",
        "0xf8000" : "LPCB@1F",
        "0xfe000" : "pci8086,9ca4@1F,6",
        "0xfb000" : "SBUS@1F,3",
        "0x400000" : "RP06@1C,5/IOPP/SSD0@0",
        "0xc100000" : "RP05@1C,4/IOPP/UPSB@0/IOPP/DSB1@3/IOPP/UPS0@0",
        "0xc200000" : "RP05@1C,4/IOPP/UPSB@0/IOPP/DSB1@3/IOPP/UPS0@0/IOPP/pci-bridge@0",
        "0xc300000" : "RP05@1C,4/IOPP/UPSB@0/IOPP/DSB1@3/IOPP/UPS0@0/IOPP/pci-bridge@0/IOPP/ethernet@0"
    },
    "device_mmio" :
    {
        "PCI0@0" :
        [
            { "a" : "0xcf8", "s" : "0x8" }
        ],
        "PCI0@0/AppleACPIPCI/IGPU@2" :
        [
            { "a" : "0x7fa0000000", "s" : "0x1000000" },
            { "a" : "0x7f90000000", "s" : "0x10000000" }
        ],
        "PCI0@0/AppleACPIPCI/HDAU@3" :
        [
            { "a" : "0x7fa1014000", "s" : "0x4000" }
        ],
        "PCI0@0/AppleACPIPCI/XHC1@14" :
        [
            { "a" : "0x7fa1000000", "s" : "0x10000" }
        ],
        "PCI0@0/AppleACPIPCI/SDMA@15" :
        [
            { "a" : "0xc181a000", "s" : "0x1000" }
        ],
        "PCI0@0/AppleACPIPCI/SPI1@15,4" :
        [
            { "a" : "0xc1819000", "s" : "0x1000" }
        ],
        "PCI0@0/AppleACPIPCI/pci8086,9cba@16" :
        [
            { "a" : "0x7fa1019100", "s" : "0x20" }
        ],
        "PCI0@0/AppleACPIPCI/HDEF@1B" :
        [
            { "a" : "0x7fa1010000", "s" : "0x4000" }
        ],
        "PCI0@0/AppleACPIPCI/RP02@1C,1/IOPP/CMRA@0" :
        [
            { "a" : "0xc1700000", "s" : "0x10000" },
            { "a" : "0x7f80000000", "s" : "0x10000000" },
            { "a" : "0xc1600000", "s" : "0x100000" }
        ],
        "PCI0@0/AppleACPIPCI/RP03@1C,2/IOPP/ARPT@0" :
        [
            { "a" : "0xc1400000", "s" : "0x8000" },
            { "a" : "0xc1000000", "s" : "0x400000" }
        ],
        "PCI0@0/AppleACPIPCI/RP05@1C,4/IOPP/UPSB@0/IOPP/DSB0@0/IOPP/NHI0@0" :
        [
            { "a" : "0xc1900000", "s" : "0x40000" },
            { "a" : "0xc1940000", "s" : "0x1000" }
        ],
        "PCI0@0/AppleACPIPCI/RP05@1C,4/IOPP/UPSB@0/IOPP/DSB1@3/IOPP/UPS0@0/IOPP/pci-bridge@0/IOPP/ethernet@0" :
        [
            { "a" : "0x7fa1110000", "s" : "0x10000" },
            { "a" : "0x7fa1100000", "s" : "0x10000" }
        ],
        "PCI0@0/AppleACPIPCI/RP06@1C,5/IOPP/SSD0@0" :
        [
            { "a" : "0xc1500000", "s" : "0x2000" }
        ],
        "PCI0@0/AppleACPIPCI/SBUS@1F,3" :
        [
            { "a" : "0x7fa1019000", "s" : "0x100" }
        ],
        "PCI0@0/AppleACPIPCI/pci8086,9ca4@1F,6" :
        [
            { "a" : "0x7fa1018000", "s" : "0x1000" }
        ],
        "DMAC" :
        [
            { "a" : "0x0", "s" : "0x20" },
            { "a" : "0x81", "s" : "0x11" },
            { "a" : "0x93", "s" : "0xd" },
            { "a" : "0xc0", "s" : "0x20" }
        ],
        "FWHD" :
        [
            { "a" : "0xff000000", "s" : "0x1000000" }
        ],
        "HPET" :
        [
            { "a" : "0xfed00000", "s" : "0x4000" }
        ],
        "IPIC" :
        [
            { "a" : "0x20", "s" : "0x2" },
            { "a" : "0x24", "s" : "0x2" },
            { "a" : "0x28", "s" : "0x2" },
            { "a" : "0x2c", "s" : "0x2" },
            { "a" : "0x30", "s" : "0x2" },
            { "a" : "0x34", "s" : "0x2" },
            { "a" : "0x38", "s" : "0x2" },
            { "a" : "0x3c", "s" : "0x2" },
            { "a" : "0xa0", "s" : "0x2" },
            { "a" : "0xa4", "s" : "0x2" },
            { "a" : "0xa8", "s" : "0x2" },
            { "a" : "0xac", "s" : "0x2" },
            { "a" : "0xb0", "s" : "0x2" },
            { "a" : "0xb4", "s" : "0x2" },
            { "a" : "0xb8", "s" : "0x2" },
            { "a" : "0xbc", "s" : "0x2" },
            { "a" : "0x4d0", "s" : "0x2" }
        ],
        "MATH" :
        [
            { "a" : "0xf0", "s" : "0x1" }
        ],
        "LDRC" :
        [
            { "a" : "0x2e", "s" : "0x2" },
            { "a" : "0x4e", "s" : "0x2" },
            { "a" : "0x61", "s" : "0x1" },
            { "a" : "0x63", "s" : "0x1" },
            { "a" : "0x65", "s" : "0x1" },
            { "a" : "0x67", "s" : "0x1" },
            { "a" : "0x80", "s" : "0x1" },
            { "a" : "0x92", "s" : "0x1" },
            { "a" : "0xb2", "s" : "0x2" },
            { "a" : "0xffff", "s" : "0x1" },
            { "a" : "0x1800", "s" : "0x80" },
            { "a" : "0x800", "s" : "0x80" }
        ],
        "RTC" :
        [
            { "a" : "0x70", "s" : "0x8" }
        ],
        "TIMR" :
        [
            { "a" : "0x40", "s" : "0x4" },
            { "a" : "0x50", "s" : "0x4" }
        ],
        "SMC" :
        [
            { "a" : "0x300", "s" : "0x20" },
            { "a" : "0xfef00000", "s" : "0x10000" }
        ],
        "EC" :
        [
            { "a" : "0x62", "s" : "0x1" },
            { "a" : "0x66", "s" : "0x1" }
        ],
        "PDRC" :
        [
            { "a" : "0xfed1c000", "s" : "0x4000" },
            { "a" : "0xfed10000", "s" : "0x8000" },
            { "a" : "0xfed18000", "s" : "0x1000" },
            { "a" : "0xfed19000", "s" : "0x1000" },
            { "a" : "0xe0000000", "s" : "0x10000000" },
            { "a" : "0xfed20000", "s" : "0x20000" },
            { "a" : "0xfed90000", "s" : "0x4000" },
            { "a" : "0xfed45000", "s" : "0x4b000" },
            { "a" : "0xff000000", "s" : "0x1000000" },
            { "a" : "0xfee00000", "s" : "0x100000" }
        ],
        "MEM2" :
        [
            { "a" : "0x20000000", "s" : "0x200000" },
            { "a" : "0x40000000", "s" : "0x200000" }
        ]
    }
}


Model: MacBookPro12,1, BootROM MBP121.0167.B24, 2 processors, Intel Core i7, 3.1 GHz, 16 GB, SMC 2.28f7
Graphics: Intel Iris Graphics 6100, Intel Iris Graphics 6100, Built-In
Memory Module: BANK 0/DIMM0, 8 GB, DDR3, 1867 MHz, 0x02FE, 0x4544464232333241314D412D4A442D460000
Memory Module: BANK 1/DIMM0, 8 GB, DDR3, 1867 MHz, 0x02FE, 0x4544464232333241314D412D4A442D460000
AirPort: spairport_wireless_card_type_airport_extreme (0x14E4, 0x133), Broadcom BCM43xx 1.0 (7.21.171.124.1a2)
Bluetooth: Version 5.0.4f18, 3 services, 17 devices, 1 incoming serial ports
Network Service: Wi-Fi, AirPort, en0
Serial ATA Device: APPLE SSD SM1024G, 1 TB
USB Device: USB 3.0 Bus
USB Device: Bluetooth USB Host Controller
Thunderbolt Bus: MacBook Pro, Apple Inc., 27.1


TextMate

I don't think I actually believe in stability any more


====

Process:               Safari [20044]
Path:                  /Applications/Safari.app/Contents/MacOS/Safari
Identifier:            com.apple.Safari
Version:               10.1.1 (12603.2.4)
Build Info:            WebBrowser-7603002004000000~2
Code Type:             X86-64 (Native)
Parent Process:        ??? [1]
Responsible:           Safari [20044]
User ID:               501

Date/Time:             2017-07-07 06:49:41.027 -0400
OS Version:            Mac OS X 10.12.5 (16F73)
Report Version:        12
Anonymous UUID:        0BED44E4-EF15-166F-0516-B0506E8AF4A8


Time Awake Since Boot: 94000 seconds

System Integrity Protection: enabled

Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_ACCESS (SIGSEGV)
Exception Codes:       EXC_I386_GPFLT
Exception Note:        EXC_CORPSE_NOTIFY

Termination Signal:    Segmentation fault: 11
Termination Reason:    Namespace SIGNAL, Code 0xb
Terminating Process:   exc handler [0]

Application Specific Information:
Enabled Extensions:
com.ideashower.pocket.safari-ET279A6R5N (41 - 1.9.19) Save to Pocket
 
Performing @selector(buttonPressed:) from sender NSButton 0x600000b470c0

Thread 0 Crashed:: Dispatch queue: com.apple.main-thread
0   com.apple.Safari.framework    	0x00007fffd3d3dc87 Safari::BrowserContentViewController::abortInitiateLoad() + 33
1   com.apple.Safari.framework    	0x00007fffd3cae732 -[AppController _handleUnresponsiveWebProcessDialogResponse:completionHandler:] + 147
2   com.apple.AppKit              	0x00007fffc0e55b4e __54-[NSAlert beginSheetModalForWindow:completionHandler:]_block_invoke_2 + 29
3   com.apple.AppKit              	0x00007fffc0c9fb48 -[NSWindow _endWindowBlockingModalSession:returnCode:] + 248
4   com.apple.AppKit              	0x00007fffc0cffae1 -[NSAlert buttonPressed:] + 361
5   libsystem_trace.dylib         	0x00007fffd88e03a7 _os_activity_initiate_impl + 53
6   com.apple.AppKit              	0x00007fffc11ac721 -[NSApplication(NSResponder) sendAction:to:from:] + 456
7   com.apple.Safari.framework    	0x00007fffd3d1e0c4 -[BrowserApplication sendAction:to:from:] + 343
8   com.apple.AppKit              	0x00007fffc0c90cc4 -[NSControl sendAction:to:] + 86
9   com.apple.AppKit              	0x00007fffc0c90bec __26-[NSCell _sendActionFrom:]_block_invoke + 136
10  libsystem_trace.dylib         	0x00007fffd88e03a7 _os_activity_initiate_impl + 53
11  com.apple.AppKit              	0x00007fffc0c90b44 -[NSCell _sendActionFrom:] + 128
12  com.apple.AppKit              	0x00007fffc0cd3539 -[NSButtonCell _sendActionFrom:] + 98
13  libsystem_trace.dylib         	0x00007fffd88e03a7 _os_activity_initiate_impl + 53
14  com.apple.AppKit              	0x00007fffc0cedf46 -[NSButtonCell performClick:] + 690
15  com.apple.AppKit              	0x00007fffc0cedc4c __33-[NSButton performKeyEquivalent:]_block_invoke + 85
16  libsystem_trace.dylib         	0x00007fffd88e03a7 _os_activity_initiate_impl + 53
17  com.apple.AppKit              	0x00007fffc0c7d8fa -[NSButton performKeyEquivalent:] + 356
18  com.apple.AppKit              	0x00007fffc0c7d54e -[NSView _performKeyEquivalent:conditionally:] + 227
19  com.apple.AppKit              	0x00007fffc0c7d77b -[NSControl _performKeyEquivalent:conditionally:] + 136
20  com.apple.AppKit              	0x00007fffc0c7d64c -[NSView performKeyEquivalent:] + 234
21  com.apple.AppKit              	0x00007fffc0e5d80a -[_NSAlertContentView performKeyEquivalent:] + 88
22  com.apple.AppKit              	0x00007fffc0c7d54e -[NSView _performKeyEquivalent:conditionally:] + 227
23  com.apple.AppKit              	0x00007fffc0c7d64c -[NSView performKeyEquivalent:] + 234
24  com.apple.AppKit              	0x00007fffc0c7d54e -[NSView _performKeyEquivalent:conditionally:] + 227
25  com.apple.AppKit              	0x00007fffc12ceea2 -[NSWindow _commonPerformKeyEquivalent:conditionally:] + 79
26  com.apple.AppKit              	0x00007fffc0cc681e -[NSWindow keyDown:] + 30
27  com.apple.AppKit              	0x00007fffc13252cc -[NSWindow(NSEventRouting) _reallySendEvent:isDelayedEvent:] + 4086
28  com.apple.AppKit              	0x00007fffc1323f0a -[NSWindow(NSEventRouting) sendEvent:] + 541
29  com.apple.AppKit              	0x00007fffc11a94a8 -[NSApplication(NSEvent) sendEvent:] + 4768
30  com.apple.Safari.framework    	0x00007fffd3d1e788 -[BrowserApplication sendEvent:] + 637
31  com.apple.AppKit              	0x00007fffc0a23427 -[NSApplication run] + 1002
32  com.apple.AppKit              	0x00007fffc09ede0e NSApplicationMain + 1237
33  libdyld.dylib                 	0x00007fffd86ae235 start + 1

Thread 1:
0   libsystem_kernel.dylib        	0x00007fffd87dcf46 __semwait_signal + 10
1   libsystem_c.dylib             	0x00007fffd8763b72 nanosleep + 199
2   libc++.1.dylib                	0x00007fffd728865b std::__1::this_thread::sleep_for(std::__1::chrono::duration<long long, std::__1::ratio<1l, 1000000000l> > const&) + 80
3   com.apple.JavaScriptCore      	0x00007fffc5f3f053 bmalloc::Heap::scavenge(std::__1::unique_lock<bmalloc::StaticMutex>&, std::__1::chrono::duration<long long, std::__1::ratio<1l, 1000l> >) + 275
4   com.apple.JavaScriptCore      	0x00007fffc5f3ee06 bmalloc::Heap::concurrentScavenge() + 102
5   com.apple.JavaScriptCore      	0x00007fffc5f40491 bmalloc::AsyncTask<bmalloc::Heap, void (bmalloc::Heap::*)()>::threadRunLoop() + 97
6   com.apple.JavaScriptCore      	0x00007fffc5f4039d bmalloc::AsyncTask<bmalloc::Heap, void (bmalloc::Heap::*)()>::threadEntryPoint(bmalloc::AsyncTask<bmalloc::Heap, void (bmalloc::Heap::*)()>*) + 29
7   com.apple.JavaScriptCore      	0x00007fffc5f4064d void* std::__1::__thread_proxy<std::__1::tuple<void (*)(bmalloc::AsyncTask<bmalloc::Heap, void (bmalloc::Heap::*)()>*), bmalloc::AsyncTask<bmalloc::Heap, void (bmalloc::Heap::*)()>*> >(void*) + 93
8   libsystem_pthread.dylib       	0x00007fffd88c793b _pthread_body + 180
9   libsystem_pthread.dylib       	0x00007fffd88c7887 _pthread_start + 286
10  libsystem_pthread.dylib       	0x00007fffd88c708d thread_start + 13

Thread 2:: WebCore: IconDatabase
0   libsystem_kernel.dylib        	0x00007fffd87dcbf2 __psynch_cvwait + 10
1   libsystem_pthread.dylib       	0x00007fffd88c87fa _pthread_cond_wait + 712
2   com.apple.JavaScriptCore      	0x00007fffc53d958f WTF::ThreadCondition::timedWait(WTF::Mutex&, double) + 63
3   com.apple.JavaScriptCore      	0x00007fffc5f27d52 WTF::ParkingLot::parkConditionallyImpl(void const*, WTF::ScopedLambda<bool ()> const&, WTF::ScopedLambda<void ()> const&, WTF::TimeWithDynamicClockType const&) + 2706
4   com.apple.WebCore             	0x00007fffc9f960f6 bool WTF::ConditionBase::waitUntil<WTF::Lock>(WTF::Lock&, WTF::TimeWithDynamicClockType const&) + 150
5   com.apple.WebCore             	0x00007fffc9d0857d WebCore::IconDatabase::syncThreadMainLoop() + 621
6   com.apple.WebCore             	0x00007fffc9d06021 WebCore::IconDatabase::iconDatabaseSyncThread() + 385
7   com.apple.JavaScriptCore      	0x00007fffc53d1682 WTF::threadEntryPoint(void*) + 178
8   com.apple.JavaScriptCore      	0x00007fffc53d15af WTF::wtfThreadEntryPoint(void*) + 15
9   libsystem_pthread.dylib       	0x00007fffd88c793b _pthread_body + 180
10  libsystem_pthread.dylib       	0x00007fffd88c7887 _pthread_start + 286
11  libsystem_pthread.dylib       	0x00007fffd88c708d thread_start + 13

Thread 3:: com.apple.NSURLConnectionLoader
0   libsystem_kernel.dylib        	0x00007fffd87d534a mach_msg_trap + 10
1   libsystem_kernel.dylib        	0x00007fffd87d4797 mach_msg + 55
2   com.apple.CoreFoundation      	0x00007fffc2f35434 __CFRunLoopServiceMachPort + 212
3   com.apple.CoreFoundation      	0x00007fffc2f348c1 __CFRunLoopRun + 1361
4   com.apple.CoreFoundation      	0x00007fffc2f34114 CFRunLoopRunSpecific + 420
5   com.apple.CFNetwork           	0x00007fffc2072734 +[NSURLConnection(Loader) _resourceLoadLoop:] + 313
6   com.apple.Foundation          	0x00007fffc4957b3d __NSThread__start__ + 1243
7   libsystem_pthread.dylib       	0x00007fffd88c793b _pthread_body + 180
8   libsystem_pthread.dylib       	0x00007fffd88c7887 _pthread_start + 286
9   libsystem_pthread.dylib       	0x00007fffd88c708d thread_start + 13

Thread 4:: com.apple.coreanimation.render-server
0   libsystem_kernel.dylib        	0x00007fffd87d534a mach_msg_trap + 10
1   libsystem_kernel.dylib        	0x00007fffd87d4797 mach_msg + 55
2   com.apple.QuartzCore          	0x00007fffc8b15bf0 CA::Render::Server::server_thread(void*) + 272
3   com.apple.QuartzCore          	0x00007fffc8bc63af thread_fun + 25
4   libsystem_pthread.dylib       	0x00007fffd88c793b _pthread_body + 180
5   libsystem_pthread.dylib       	0x00007fffd88c7887 _pthread_start + 286
6   libsystem_pthread.dylib       	0x00007fffd88c708d thread_start + 13

Thread 5:: com.apple.CFSocket.private
0   libsystem_kernel.dylib        	0x00007fffd87dceb6 __select + 10
1   com.apple.CoreFoundation      	0x00007fffc2f7066a __CFSocketManager + 682
2   libsystem_pthread.dylib       	0x00007fffd88c793b _pthread_body + 180
3   libsystem_pthread.dylib       	0x00007fffd88c7887 _pthread_start + 286
4   libsystem_pthread.dylib       	0x00007fffd88c708d thread_start + 13

Thread 6:: com.apple.NSEventThread
0   libsystem_kernel.dylib        	0x00007fffd87d534a mach_msg_trap + 10
1   libsystem_kernel.dylib        	0x00007fffd87d4797 mach_msg + 55
2   com.apple.CoreFoundation      	0x00007fffc2f35434 __CFRunLoopServiceMachPort + 212
3   com.apple.CoreFoundation      	0x00007fffc2f348c1 __CFRunLoopRun + 1361
4   com.apple.CoreFoundation      	0x00007fffc2f34114 CFRunLoopRunSpecific + 420
5   com.apple.AppKit              	0x00007fffc0b7bf02 _NSEventThread + 205
6   libsystem_pthread.dylib       	0x00007fffd88c793b _pthread_body + 180
7   libsystem_pthread.dylib       	0x00007fffd88c7887 _pthread_start + 286
8   libsystem_pthread.dylib       	0x00007fffd88c708d thread_start + 13

Thread 7:: com.apple.CFNetwork.CustomProtocols
0   libsystem_kernel.dylib        	0x00007fffd87d534a mach_msg_trap + 10
1   libsystem_kernel.dylib        	0x00007fffd87d4797 mach_msg + 55
2   com.apple.CoreFoundation      	0x00007fffc2f35434 __CFRunLoopServiceMachPort + 212
3   com.apple.CoreFoundation      	0x00007fffc2f348c1 __CFRunLoopRun + 1361
4   com.apple.CoreFoundation      	0x00007fffc2f34114 CFRunLoopRunSpecific + 420
5   com.apple.CFNetwork           	0x00007fffc22bba9e _privateRunloopEmulationSet(void*) + 258
6   libsystem_pthread.dylib       	0x00007fffd88c793b _pthread_body + 180
7   libsystem_pthread.dylib       	0x00007fffd88c7887 _pthread_start + 286
8   libsystem_pthread.dylib       	0x00007fffd88c708d thread_start + 13

Thread 8:: WebCore: LocalStorage
0   libsystem_kernel.dylib        	0x00007fffd87dcbf2 __psynch_cvwait + 10
1   libsystem_pthread.dylib       	0x00007fffd88c87fa _pthread_cond_wait + 712
2   com.apple.JavaScriptCore      	0x00007fffc53d958f WTF::ThreadCondition::timedWait(WTF::Mutex&, double) + 63
3   com.apple.JavaScriptCore      	0x00007fffc5f27d52 WTF::ParkingLot::parkConditionallyImpl(void const*, WTF::ScopedLambda<bool ()> const&, WTF::ScopedLambda<void ()> const&, WTF::TimeWithDynamicClockType const&) + 2706
4   com.apple.WebKitLegacy        	0x00007fffcb164df6 bool WTF::ConditionBase::waitUntil<WTF::Lock>(WTF::Lock&, WTF::TimeWithDynamicClockType const&) + 150
5   com.apple.WebKitLegacy        	0x00007fffcb1680bf std::__1::unique_ptr<WTF::Function<void ()>, std::__1::default_delete<WTF::Function<void ()> > > WTF::MessageQueue<WTF::Function<void ()> >::waitForMessageFilteredWithTimeout<WTF::MessageQueue<WTF::Function<void ()> >::waitForMessage()::'lambda'(WTF::Function<void ()> const&)>(WTF::MessageQueueWaitResult&, WTF::MessageQueue<WTF::Function<void ()> >::waitForMessage()::'lambda'(WTF::Function<void ()> const&)&&, WTF::WallTime) + 127
6   com.apple.WebKitLegacy        	0x00007fffcb16785c WebCore::StorageThread::threadEntryPoint() + 172
7   com.apple.JavaScriptCore      	0x00007fffc53d1682 WTF::threadEntryPoint(void*) + 178
8   com.apple.JavaScriptCore      	0x00007fffc53d15af WTF::wtfThreadEntryPoint(void*) + 15
9   libsystem_pthread.dylib       	0x00007fffd88c793b _pthread_body + 180
10  libsystem_pthread.dylib       	0x00007fffd88c7887 _pthread_start + 286
11  libsystem_pthread.dylib       	0x00007fffd88c708d thread_start + 13

Thread 9:: WebCore: LocalStorage
0   libsystem_kernel.dylib        	0x00007fffd87dcbf2 __psynch_cvwait + 10
1   libsystem_pthread.dylib       	0x00007fffd88c87fa _pthread_cond_wait + 712
2   com.apple.JavaScriptCore      	0x00007fffc53d958f WTF::ThreadCondition::timedWait(WTF::Mutex&, double) + 63
3   com.apple.JavaScriptCore      	0x00007fffc5f27d52 WTF::ParkingLot::parkConditionallyImpl(void const*, WTF::ScopedLambda<bool ()> const&, WTF::ScopedLambda<void ()> const&, WTF::TimeWithDynamicClockType const&) + 2706
4   com.apple.WebKitLegacy        	0x00007fffcb164df6 bool WTF::ConditionBase::waitUntil<WTF::Lock>(WTF::Lock&, WTF::TimeWithDynamicClockType const&) + 150
5   com.apple.WebKitLegacy        	0x00007fffcb1680bf std::__1::unique_ptr<WTF::Function<void ()>, std::__1::default_delete<WTF::Function<void ()> > > WTF::MessageQueue<WTF::Function<void ()> >::waitForMessageFilteredWithTimeout<WTF::MessageQueue<WTF::Function<void ()> >::waitForMessage()::'lambda'(WTF::Function<void ()> const&)>(WTF::MessageQueueWaitResult&, WTF::MessageQueue<WTF::Function<void ()> >::waitForMessage()::'lambda'(WTF::Function<void ()> const&)&&, WTF::WallTime) + 127
6   com.apple.WebKitLegacy        	0x00007fffcb16785c WebCore::StorageThread::threadEntryPoint() + 172
7   com.apple.JavaScriptCore      	0x00007fffc53d1682 WTF::threadEntryPoint(void*) + 178
8   com.apple.JavaScriptCore      	0x00007fffc53d15af WTF::wtfThreadEntryPoint(void*) + 15
9   libsystem_pthread.dylib       	0x00007fffd88c793b _pthread_body + 180
10  libsystem_pthread.dylib       	0x00007fffd88c7887 _pthread_start + 286
11  libsystem_pthread.dylib       	0x00007fffd88c708d thread_start + 13

Thread 10:
0   libsystem_kernel.dylib        	0x00007fffd87dd44e __workq_kernreturn + 10
1   libsystem_pthread.dylib       	0x00007fffd88c748e _pthread_wqthread + 1023
2   libsystem_pthread.dylib       	0x00007fffd88c707d start_wqthread + 13

Thread 11:
0   libsystem_kernel.dylib        	0x00007fffd87dd44e __workq_kernreturn + 10
1   libsystem_pthread.dylib       	0x00007fffd88c7621 _pthread_wqthread + 1426
2   libsystem_pthread.dylib       	0x00007fffd88c707d start_wqthread + 13

Thread 12:
0   libsystem_kernel.dylib        	0x00007fffd87dd44e __workq_kernreturn + 10
1   libsystem_pthread.dylib       	0x00007fffd88c7621 _pthread_wqthread + 1426
2   libsystem_pthread.dylib       	0x00007fffd88c707d start_wqthread + 13

Thread 13:
0   libsystem_kernel.dylib        	0x00007fffd87dd44e __workq_kernreturn + 10
1   libsystem_pthread.dylib       	0x00007fffd88c748e _pthread_wqthread + 1023
2   libsystem_pthread.dylib       	0x00007fffd88c707d start_wqthread + 13

Thread 14:
0   libsystem_pthread.dylib       	0x00007fffd88c7070 start_wqthread + 0
1   ???                           	0x0000000000000050 0 + 80

Thread 15:
0   libsystem_pthread.dylib       	0x00007fffd88c7070 start_wqthread + 0
1   ???                           	0x0000400000000044 0 + 70368744177732

Thread 16:
0   libsystem_pthread.dylib       	0x00007fffd88c7070 start_wqthread + 0
1   ???                           	0x00000001066b8000 0 + 4402675712

Thread 17:
0   libsystem_pthread.dylib       	0x00007fffd88c7070 start_wqthread + 0
1   ???                           	0x000000000000006c 0 + 108

Thread 0 crashed with X86 Thread State (64-bit):
  rax: 0x0000000130582300  rbx: 0x0000000130582300  rcx: 0x0100000000000000  rdx: 0x2f2f3a7370747468
  rdi: 0x2b65726f6870616d  rsi: 0x0000000000000000  rbp: 0x00007fff5957dbc0  rsp: 0x00007fff5957dbb0
   r8: 0x0000000000000000   r9: 0x00006000000c6688  r10: 0x00007fffe0bb8968  r11: 0x00007ff8e0736db0
  r12: 0x0000000000000000  r13: 0x00007ff8e31cfb30  r14: 0x000060800444ba90  r15: 0x00000000000003e9
  rip: 0x00007fffd3d3dc87  rfl: 0x0000000000010246  cr2: 0x00007ff8e405aa08
  
Logical CPU:     0
Error Code:      0x00000000
Trap Number:     13


Binary Images:
       0x106681000 -        0x106681fff  com.apple.Safari (10.1.1 - 12603.2.4) <CCF0F8FC-F5A6-357C-886D-1EEA312FCAF7> /Applications/Safari.app/Contents/MacOS/Safari
       0x108738000 -        0x108738fff  com.apple.WebInspectorUI (12603 - 12603.2.4) <73D8CC24-A589-3932-8CC8-1B1AF3C53348> /System/Library/PrivateFrameworks/WebInspectorUI.framework/Versions/A/WebInspectorUI
       0x10899f000 -        0x1089a4ff3  libgermantok.dylib (17) <35A589D9-5F0E-31D7-9188-37237CC471EC> /usr/lib/libgermantok.dylib
       0x1089ce000 -        0x1089d1fff  com.apple.Seeding (1.0 - 1) <FAF0BBE3-F590-3DEA-B0D3-F992A8EE0F52> /System/Library/PrivateFrameworks/Seeding.framework/Seeding
       0x108b7b000 -        0x108b7cfff  com.apple.AddressBook.LocalSourceBundle (10.0 - 1756.20) <D7B1ADAF-B5B0-3F1C-B31F-032FA9160A16> /System/Library/Address Book Plug-Ins/LocalSource.sourcebundle/Contents/MacOS/LocalSource
       0x109a1e000 -        0x109a35ffb  libCGInterfaces.dylib (331.5) <17109679-A284-3C72-AA60-DBA815D3062B> /System/Library/Frameworks/Accelerate.framework/Frameworks/vImage.framework/Versions/A/Libraries/libCGInterfaces.dylib
       0x10a5b7000 -        0x10a5f4dc7  dyld (433.5) <322C06B7-8878-311D-888C-C8FD2CA96FF3> /usr/lib/dyld
       0x10becd000 -        0x10bed1fff  com.apple.DirectoryServicesSource (10.0 - 1756.20) <7F98B6EF-6630-338E-8EFF-D96B6F8330BC> /System/Library/Address Book Plug-Ins/DirectoryServices.sourcebundle/Contents/MacOS/DirectoryServices
       0x10bf83000 -        0x10c129fff  GLEngine (14.0.16) <1999FBF9-0B82-34B1-8876-87B4F82101BB> /System/Library/Frameworks/OpenGL.framework/Resources/GLEngine.bundle/GLEngine
       0x10c168000 -        0x10c6b7ff7  com.apple.driver.AppleIntelBDWGraphicsGLDriver (10.25.13 - 10.2.5) <3A433317-B62E-3DF2-B612-DDEDC75862AA> /System/Library/Extensions/AppleIntelBDWGraphicsGLDriver.bundle/Contents/MacOS/AppleIntelBDWGraphicsGLDriver
       0x10c8d2000 -        0x10c8fcfff  GLRendererFloat (14.0.16) <8D11C08E-8249-38DB-9856-BFC01EEDE0CB> /System/Library/Frameworks/OpenGL.framework/Resources/GLRendererFloat.bundle/GLRendererFloat
       0x10c906000 -        0x10c985fff  com.apple.driver.AppleIntelBDWGraphicsMTLDriver (10.25.13 - 10.2.5) <405EB5A7-AB50-38E8-AF51-E03FB06E1AB1> /System/Library/Extensions/AppleIntelBDWGraphicsMTLDriver.bundle/Contents/MacOS/AppleIntelBDWGraphicsMTLDriver
       0x10d491000 -        0x10d49bfff  com.apple.SyncedDefaults (2.0 - 261.4) <156CF4AD-5D6F-33E1-A9E1-A7E181570F06> /System/Library/PrivateFrameworks/SyncedDefaults.framework/SyncedDefaults
       0x10e04f000 -        0x10e050ff1 +cl_kernels (???) <9FD28BE8-315F-4797-92A2-6EDD11BF4620> cl_kernels
       0x10e544000 -        0x10e62afff  unorm8_bgra.dylib (2.8.5) <74CB9618-8EDC-336E-A994-C5A1612BD32E> /System/Library/Frameworks/OpenCL.framework/Versions/A/Libraries/ImageFormats/unorm8_bgra.dylib
       0x10f11f000 -        0x10f126ffb  com.apple.symptoms.SymptomReporter (1.0 - 1) <33640FA7-BA53-303E-BDB5-61315FDE4B2F> /System/Library/PrivateFrameworks/Symptoms.framework/Frameworks/SymptomReporter.framework/SymptomReporter
       0x10ff1d000 -        0x10ff34ff7  com.apple.LookupFramework (1.2 - 221) <071D9DE8-06BD-3B8E-B771-5A9E325BB95A> /System/Library/PrivateFrameworks/Lookup.framework/Lookup
       0x111bf1000 -        0x111c11fff  com.apple.CoreNLP (1.0 - 78.2) <B686BDA2-A162-3D70-9257-FEB0592DBD7E> /System/Library/PrivateFrameworks/CoreNLP.framework/Versions/A/CoreNLP
       0x1135ca000 -        0x11362aff7  com.apple.AddressBook.CardDAVPlugin (10.9 - 521) <85A6B3FC-F7D0-36AA-BD20-E120386E5C46> /System/Library/Address Book Plug-Ins/CardDAVPlugin.sourcebundle/Contents/MacOS/CardDAVPlugin
    0x7fffbdb5f000 -     0x7fffbdea4ff7  com.apple.RawCamera.bundle (7.03 - 912) <1476F375-6C4B-382A-ABDB-99B7DCBF4F6D> /System/Library/CoreServices/RawCamera.bundle/Contents/MacOS/RawCamera
    0x7fffbf6db000 -     0x7fffbf89cfff  com.apple.avfoundation (2.0 - 1187.36) <8C7813BE-B548-33E3-A61E-FF1F1984386A> /System/Library/Frameworks/AVFoundation.framework/Versions/A/AVFoundation
    0x7fffbf89d000 -     0x7fffbf93fff7  com.apple.audio.AVFAudio (1.0 - ???) <7997D588-B542-3EBB-B822-D719C1114BB4> /System/Library/Frameworks/AVFoundation.framework/Versions/A/Frameworks/AVFAudio.framework/Versions/A/AVFAudio
    0x7fffbf940000 -     0x7fffbfa09ff3  com.apple.AVKit (1.1 - 356.12) <CFEBC4BF-8A1D-3AF2-A83F-D531C10A848E> /System/Library/Frameworks/AVKit.framework/Versions/A/AVKit
    0x7fffbfa0a000 -     0x7fffbfa0afff  com.apple.Accelerate (1.11 - Accelerate 1.11) <916E360F-323C-3AE1-AB3D-D1F3B284AEE9> /System/Library/Frameworks/Accelerate.framework/Versions/A/Accelerate
    0x7fffbfa23000 -     0x7fffbff3cfeb  com.apple.vImage (8.1 - ???) <B58A7937-BEE2-38FE-87F4-5D5F40D31DC9> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vImage.framework/Versions/A/vImage
    0x7fffbff3d000 -     0x7fffc00aeff3  libBLAS.dylib (1185.50.4) <4087FFE0-627E-3623-96B4-F0A9A1991E09> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib
    0x7fffc00af000 -     0x7fffc00c3ffb  libBNNS.dylib (15) <254698C7-7D36-3FFF-864E-ADEEEE543076> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBNNS.dylib
    0x7fffc00c4000 -     0x7fffc04bafef  libLAPACK.dylib (1185.50.4) <C35FFB2F-A0E6-3903-8A3C-113A74BCBCA2> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libLAPACK.dylib
    0x7fffc04bb000 -     0x7fffc04d1fff  libLinearAlgebra.dylib (1185.50.4) <345CAACF-7263-36EF-B69B-793EA8B390AF> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libLinearAlgebra.dylib
    0x7fffc04d2000 -     0x7fffc04d8fff  libQuadrature.dylib (3) <EF56C8E6-DE22-3C69-B543-A8648F335FDD> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libQuadrature.dylib
    0x7fffc04d9000 -     0x7fffc04edff7  libSparseBLAS.dylib (1185.50.4) <67BA432E-FB59-3C78-A8BE-ED4274CBC359> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libSparseBLAS.dylib
    0x7fffc04ee000 -     0x7fffc0675fe7  libvDSP.dylib (600.60.1) <4155F45B-41CD-3782-AE8F-7AE740FD83C3> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libvDSP.dylib
    0x7fffc0676000 -     0x7fffc0728fff  libvMisc.dylib (600.60.1) <98F27D2D-E5DD-38EF-8747-0C4DE821A23D> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libvMisc.dylib
    0x7fffc0729000 -     0x7fffc0729fff  com.apple.Accelerate.vecLib (3.11 - vecLib 3.11) <7C5733E7-0568-3E7D-AF61-160F19FED544> /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/vecLib
    0x7fffc072a000 -     0x7fffc0767ffb  com.apple.Accounts (113 - 113) <8550BD08-7D05-3AC4-A0CC-B67ECB2DE950> /System/Library/Frameworks/Accounts.framework/Versions/A/Accounts
    0x7fffc0768000 -     0x7fffc09e7ff7  com.apple.AddressBook.framework (10.0 - 1756.20) <EF74B8FF-3AFE-3336-82B0-02792B17406C> /System/Library/Frameworks/AddressBook.framework/Versions/A/AddressBook
    0x7fffc09e8000 -     0x7fffc17c1ff3  com.apple.AppKit (6.9 - 1504.83.101) <EC7BD195-F9E1-3E43-820A-5FDD0B2B0B67> /System/Library/Frameworks/AppKit.framework/Versions/C/AppKit
    0x7fffc17d3000 -     0x7fffc17d3fff  com.apple.ApplicationServices (48 - 48) <4C71CBA8-47E4-38BF-BE3B-F20DF8667D5D> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/ApplicationServices
    0x7fffc17d4000 -     0x7fffc1842ff7  com.apple.ApplicationServices.ATS (377 - 422.2) <A31D17BE-F747-39FB-9A84-5F2F8891204C> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/ATS.framework/Versions/A/ATS
    0x7fffc18dc000 -     0x7fffc1a0bff7  libFontParser.dylib (194.12) <73C3946D-EF92-3AC1-89C3-0E75B2A85325> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/ATS.framework/Versions/A/Resources/libFontParser.dylib
    0x7fffc1a0c000 -     0x7fffc1a56fff  libFontRegistry.dylib (196.4) <EA96AE47-3369-3DEA-BB82-98348ADBD85B> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/ATS.framework/Versions/A/Resources/libFontRegistry.dylib
    0x7fffc1ab3000 -     0x7fffc1ae6fff  libTrueTypeScaler.dylib (194.12) <8944A23A-EE36-3657-9B4F-933231C8FDEC> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/ATS.framework/Versions/A/Resources/libTrueTypeScaler.dylib
    0x7fffc1b53000 -     0x7fffc1bfdff7  com.apple.ColorSync (4.12.0 - 502.2) <ACA4001E-A0E3-33F6-9CD6-EEC2AA15E322> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/ColorSync.framework/Versions/A/ColorSync
    0x7fffc1bfe000 -     0x7fffc1c4ffff  com.apple.HIServices (1.22 - 592.1) <7353E76E-9A3A-3693-87AF-41953585E024> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/HIServices.framework/Versions/A/HIServices
    0x7fffc1c50000 -     0x7fffc1c5fff3  com.apple.LangAnalysis (1.7.0 - 1.7.0) <2CBE7F61-2056-3F96-99A1-0D527796AFA6> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/LangAnalysis.framework/Versions/A/LangAnalysis
    0x7fffc1c60000 -     0x7fffc1cadfff  com.apple.print.framework.PrintCore (12 - 491) <5027FD58-F0EE-33E4-8577-934CA06CD2AF> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Versions/A/PrintCore
    0x7fffc1cae000 -     0x7fffc1ce9fff  com.apple.QD (3.12 - 313) <B339C41D-8CDF-3342-8414-F9717DCCADD4> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/QD.framework/Versions/A/QD
    0x7fffc1cea000 -     0x7fffc1cf5fff  com.apple.speech.synthesis.framework (6.6.2 - 6.6.2) <7853EFF4-62B9-394E-B7B8-41A645656820> /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/SpeechSynthesis.framework/Versions/A/SpeechSynthesis
    0x7fffc1cf6000 -     0x7fffc1f02fff  com.apple.audio.toolbox.AudioToolbox (1.14 - 1.14) <91D2BA22-B168-3A9A-9008-6FFC5A8FDC1E> /System/Library/Frameworks/AudioToolbox.framework/Versions/A/AudioToolbox
    0x7fffc1f03000 -     0x7fffc1f03fff  com.apple.audio.units.AudioUnit (1.14 - 1.14) <8C0153FD-FEFF-309C-AACD-BF9657A31F8E> /System/Library/Frameworks/AudioUnit.framework/Versions/A/AudioUnit
    0x7fffc206c000 -     0x7fffc2446fff  com.apple.CFNetwork (811.5.4 - 811.5.4) <4DBF8932-6286-3B23-87D9-63615B9958D9> /System/Library/Frameworks/CFNetwork.framework/Versions/A/CFNetwork
    0x7fffc2460000 -     0x7fffc2460fff  com.apple.Carbon (154 - 157) <69F403C7-F0CB-34E6-89B0-235CF4978C17> /System/Library/Frameworks/Carbon.framework/Versions/A/Carbon
    0x7fffc2461000 -     0x7fffc2464fff  com.apple.CommonPanels (1.2.6 - 98) <BF04BB22-D54C-309E-9F5C-897D969CAF70> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/CommonPanels.framework/Versions/A/CommonPanels
    0x7fffc2465000 -     0x7fffc276efff  com.apple.HIToolbox (2.1.1 - 857.8) <CAB143FE-AEAF-3EDE-AD7B-C04E1B7C5615> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/HIToolbox
    0x7fffc276f000 -     0x7fffc2772ff7  com.apple.help (1.3.5 - 49) <B1A930E3-5907-3677-BACD-858EF68B172D> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/Help.framework/Versions/A/Help
    0x7fffc2773000 -     0x7fffc2778fff  com.apple.ImageCapture (9.0 - 9.0) <341252B4-E082-361A-B756-6A330259C741> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/ImageCapture.framework/Versions/A/ImageCapture
    0x7fffc2779000 -     0x7fffc2810ff3  com.apple.ink.framework (10.9 - 219) <1BD40B45-FD33-3177-A935-565EE5FC79D7> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/Ink.framework/Versions/A/Ink
    0x7fffc2811000 -     0x7fffc282bfff  com.apple.openscripting (1.7 - 172) <31CFBB35-24BD-3E12-9B6B-1FA842FB605B> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/OpenScripting.framework/Versions/A/OpenScripting
    0x7fffc282c000 -     0x7fffc282dff3  com.apple.print.framework.Print (12 - 267) <E2F82F1F-DC27-3EF0-9F75-B354F701450A> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/Print.framework/Versions/A/Print
    0x7fffc282e000 -     0x7fffc2830ff7  com.apple.securityhi (9.0 - 55006) <DBD65629-535D-3669-8218-7F074D61638C> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/SecurityHI.framework/Versions/A/SecurityHI
    0x7fffc2831000 -     0x7fffc2837ff7  com.apple.speech.recognition.framework (6.0.1 - 6.0.1) <082895DC-3AC7-3DEF-ADCA-5B018C19C9D3> /System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/SpeechRecognition.framework/Versions/A/SpeechRecognition
    0x7fffc2838000 -     0x7fffc2917ffb  com.apple.cloudkit.CloudKit (651.14 - 651.14) <9F901E45-23E3-3F45-B66F-1BAB3AFC4462> /System/Library/Frameworks/CloudKit.framework/Versions/A/CloudKit
    0x7fffc2918000 -     0x7fffc2918fff  com.apple.Cocoa (6.11 - 22) <85EDFBE1-75F0-369E-8CA8-C6A639B98FA6> /System/Library/Frameworks/Cocoa.framework/Versions/A/Cocoa
    0x7fffc2926000 -     0x7fffc29c6fff  com.apple.contacts.Contacts (1.0 - 2250.10) <917E2E8A-1E67-3160-B0F3-6E4CFC21B46C> /System/Library/Frameworks/Contacts.framework/Versions/A/Contacts
    0x7fffc29c7000 -     0x7fffc2a61ffb  com.apple.ContactsUI (10.0 - 1756.20) <1C8FB43A-119C-3E33-AF87-7B751AF83AB7> /System/Library/Frameworks/ContactsUI.framework/Versions/A/ContactsUI
    0x7fffc2a62000 -     0x7fffc2aeffff  com.apple.audio.CoreAudio (4.3.0 - 4.3.0) <78767F88-91D4-31CE-AAC6-1F9407F479BB> /System/Library/Frameworks/CoreAudio.framework/Versions/A/CoreAudio
    0x7fffc2af0000 -     0x7fffc2b03fff  com.apple.CoreBluetooth (1.0 - 1) <BCB78777-76F0-3CC1-8443-9E61AEF7EF63> /System/Library/Frameworks/CoreBluetooth.framework/Versions/A/CoreBluetooth
    0x7fffc2b04000 -     0x7fffc2dfffff  com.apple.CoreData (120 - 754.2) <4C9CAB2C-60D4-3694-A0A0-5B04B14BD14E> /System/Library/Frameworks/CoreData.framework/Versions/A/CoreData
    0x7fffc2e00000 -     0x7fffc2eacff7  com.apple.CoreDisplay (1.0 - 1) <AAD5DF0B-0D22-305E-86FF-BB1431130363> /System/Library/Frameworks/CoreDisplay.framework/Versions/A/CoreDisplay
    0x7fffc2ead000 -     0x7fffc3346ff7  com.apple.CoreFoundation (6.9 - 1349.8) <09ED473E-5DE8-307F-B55C-16F6419236D5> /System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation
    0x7fffc3347000 -     0x7fffc39c9fff  com.apple.CoreGraphics (2.0 - 1070.22) <78E7C882-837D-3CC3-B221-767B999873CE> /System/Library/Frameworks/CoreGraphics.framework/Versions/A/CoreGraphics
    0x7fffc39ca000 -     0x7fffc3c0dffb  com.apple.CoreImage (12.4.0 - 451.4.9) <BE4303C9-C9D9-361D-AC94-DBE40EB6700E> /System/Library/Frameworks/CoreImage.framework/Versions/A/CoreImage
    0x7fffc3c0e000 -     0x7fffc3c73ff7  com.apple.corelocation (2101.0.63) <B76E6C13-E10B-3F2F-AFD7-DB2C0DEF6579> /System/Library/Frameworks/CoreLocation.framework/Versions/A/CoreLocation
    0x7fffc3c74000 -     0x7fffc3d25fff  com.apple.CoreMedia (1.0 - 1907.59.1.5) <6CCDE81A-6992-33ED-A1D9-9D27A4C1E31F> /System/Library/Frameworks/CoreMedia.framework/Versions/A/CoreMedia
    0x7fffc3d26000 -     0x7fffc3d71ff7  com.apple.CoreMediaIO (805.0 - 4932) <ACE54DDE-C526-31CA-9755-3938603E3751> /System/Library/Frameworks/CoreMediaIO.framework/Versions/A/CoreMediaIO
    0x7fffc3d72000 -     0x7fffc3d72fff  com.apple.CoreServices (775.19 - 775.19) <7255917D-EFBB-3BE2-A8FD-DAD631BC0949> /System/Library/Frameworks/CoreServices.framework/Versions/A/CoreServices
    0x7fffc3d73000 -     0x7fffc3dc4fff  com.apple.AE (712.5 - 712.5) <61F2AE2C-E04E-3FDF-9E88-201325136C83> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/AE.framework/Versions/A/AE
    0x7fffc3dc5000 -     0x7fffc40a0ff7  com.apple.CoreServices.CarbonCore (1159.6 - 1159.6) <08AC074C-965B-3EDF-8E45-0707C8DE9EAD> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/CarbonCore.framework/Versions/A/CarbonCore
    0x7fffc40a1000 -     0x7fffc40d4fff  com.apple.DictionaryServices (1.2 - 274) <D23866E2-F7C8-3984-A9D4-96552CCDE573> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/DictionaryServices.framework/Versions/A/DictionaryServices
    0x7fffc40d5000 -     0x7fffc40ddff3  com.apple.CoreServices.FSEvents (1230.50.1 - 1230.50.1) <2AD1B0E5-7214-37C4-8D11-A27C9CAC0F74> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/FSEvents.framework/Versions/A/FSEvents
    0x7fffc40de000 -     0x7fffc424aff7  com.apple.LaunchServices (775.19 - 775.19) <94D15A2A-852C-3B4B-A701-43043C8F1527> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/LaunchServices
    0x7fffc424b000 -     0x7fffc42fbffb  com.apple.Metadata (10.7.0 - 1075.40) <DA911E1B-3977-386D-930D-96BD5085CB8E> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/Metadata.framework/Versions/A/Metadata
    0x7fffc42fc000 -     0x7fffc435bfff  com.apple.CoreServices.OSServices (775.19 - 775.19) <C709A773-4FA0-33DD-B3E2-FBA41E00F177> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/OSServices.framework/Versions/A/OSServices
    0x7fffc435c000 -     0x7fffc43ccfff  com.apple.SearchKit (1.4.0 - 1.4.0) <7A6DDA2B-03F1-3137-BA9E-1CC211973E26> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/SearchKit.framework/Versions/A/SearchKit
    0x7fffc43cd000 -     0x7fffc4412ff7  com.apple.coreservices.SharedFileList (38 - 38) <DA096678-93AB-3291-BDE2-482F1D544589> /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/SharedFileList.framework/Versions/A/SharedFileList
    0x7fffc4413000 -     0x7fffc449affb  com.apple.CoreTelephony (113 - 4959) <774F74F4-D78B-36A5-81DF-0EDED551897A> /System/Library/Frameworks/CoreTelephony.framework/Versions/A/CoreTelephony
    0x7fffc449b000 -     0x7fffc45e8ffb  com.apple.CoreText (352.0 - 544.15) <BF0EE575-BB7E-3BF9-9029-232B4ADC24E4> /System/Library/Frameworks/CoreText.framework/Versions/A/CoreText
    0x7fffc45e9000 -     0x7fffc461eff3  com.apple.CoreVideo (1.8 - 235.3) <AC11D5FB-C77B-34F5-B942-F698E84C229F> /System/Library/Frameworks/CoreVideo.framework/Versions/A/CoreVideo
    0x7fffc461f000 -     0x7fffc4690ffb  com.apple.framework.CoreWLAN (11.0 - 1200.31) <E47C0568-E37B-3052-9E77-F0F371DCDE7F> /System/Library/Frameworks/CoreWLAN.framework/Versions/A/CoreWLAN
    0x7fffc46c3000 -     0x7fffc46ceff3  com.apple.DirectoryService.Framework (10.12 - 194) <45BEA292-4550-3082-8CE7-5D6CE7E0052A> /System/Library/Frameworks/DirectoryService.framework/Versions/A/DirectoryService
    0x7fffc46cf000 -     0x7fffc478dff7  com.apple.DiscRecording (9.0.3 - 9030.4.5) <88544E99-217A-33D9-8AC7-F54D2716658D> /System/Library/Frameworks/DiscRecording.framework/Versions/A/DiscRecording
    0x7fffc478e000 -     0x7fffc4793fff  com.apple.DiskArbitration (2.7 - 2.7) <8AC72143-D3C4-3AA6-84DF-734E3AFAC49B> /System/Library/Frameworks/DiskArbitration.framework/Versions/A/DiskArbitration
    0x7fffc4925000 -     0x7fffc4ccbff3  com.apple.Foundation (6.9 - 1349.81) <730B7944-BB43-35D5-A546-9F6CCED4B9F3> /System/Library/Frameworks/Foundation.framework/Versions/C/Foundation
    0x7fffc4cf7000 -     0x7fffc4d28ff7  com.apple.GSS (4.0 - 2.0) <6FADED0B-0425-3567-A75A-040C5A4638EB> /System/Library/Frameworks/GSS.framework/Versions/A/GSS
    0x7fffc4de8000 -     0x7fffc4e8bffb  com.apple.Bluetooth (5.0.4 - 5.0.4f18) <B3FED7E7-45EE-32DD-B59E-7942BCE9426C> /System/Library/Frameworks/IOBluetooth.framework/Versions/A/IOBluetooth
    0x7fffc4e8c000 -     0x7fffc4f22ff7  com.apple.framework.IOKit (2.0.2 - 1324.60.3) <7CE4C98B-107C-3AAA-B49A-F2ACFCBBF526> /System/Library/Frameworks/IOKit.framework/Versions/A/IOKit
    0x7fffc4f23000 -     0x7fffc4f29ffb  com.apple.IOSurface (159.7 - 159.7) <40550017-EF96-3C52-B400-806AFEE4B134> /System/Library/Frameworks/IOSurface.framework/Versions/A/IOSurface
    0x7fffc4f2a000 -     0x7fffc4f7bff7  com.apple.ImageCaptureCore (7.0 - 7.0) <A640CA2F-8093-34AB-947C-26679ECB8A6D> /System/Library/Frameworks/ImageCaptureCore.framework/Versions/A/ImageCaptureCore
    0x7fffc4f7c000 -     0x7fffc50dcfef  com.apple.ImageIO.framework (3.3.0 - 1599.10.2) <87AA4D39-0AFC-3A34-98EF-02710E2BF3CA> /System/Library/Frameworks/ImageIO.framework/Versions/A/ImageIO
    0x7fffc50dd000 -     0x7fffc50e1fff  libGIF.dylib (1599.10.2) <6ED05614-1301-3452-943B-118F00F20C8D> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libGIF.dylib
    0x7fffc50e2000 -     0x7fffc51d2ff7  libJP2.dylib (1599.10.2) <72C00423-55F0-3CAD-B198-EF00950791E6> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libJP2.dylib
    0x7fffc51d3000 -     0x7fffc51f6ffb  libJPEG.dylib (1599.10.2) <78945614-990F-3705-A91C-46F717F7C635> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libJPEG.dylib
    0x7fffc51f7000 -     0x7fffc521eff7  libPng.dylib (1599.10.2) <B800C14F-6E41-36B6-8DC1-1AE97A83A964> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libPng.dylib
    0x7fffc521f000 -     0x7fffc5221ff3  libRadiance.dylib (1599.10.2) <037D95B4-82A7-3A59-B3EB-0FF0977CF7A5> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libRadiance.dylib
    0x7fffc5222000 -     0x7fffc5270fff  libTIFF.dylib (1599.10.2) <CA2C7BF9-FDDB-36CF-B063-B075B29F8878> /System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/libTIFF.dylib
    0x7fffc5275000 -     0x7fffc53cdffb  com.apple.Intents (1.0 - 1) <D6CDE56C-6FC3-3D94-8567-73B87D4AAD4F> /System/Library/Frameworks/Intents.framework/Versions/A/Intents
    0x7fffc53ce000 -     0x7fffc5fd6ff3  com.apple.JavaScriptCore (12603 - 12603.2.4) <FFD37381-05F4-3907-BD31-74CFC3D7868F> /System/Library/Frameworks/JavaScriptCore.framework/Versions/A/JavaScriptCore
    0x7fffc5fd7000 -     0x7fffc5ff0ff7  com.apple.Kerberos (3.0 - 1) <B9D242EB-E325-3A21-9812-C77CBBFB0D51> /System/Library/Frameworks/Kerberos.framework/Versions/A/Kerberos
    0x7fffc5ff1000 -     0x7fffc6027fff  com.apple.LDAPFramework (2.4.28 - 194.5) <492ACA22-373E-3DD9-BAEB-9EF6AA962FD5> /System/Library/Frameworks/LDAP.framework/Versions/A/LDAP
    0x7fffc604c000 -     0x7fffc6070ff3  com.apple.CoreAuthentication.SharedUtils (1.0 - 240.61.1) <9A51DCFD-51B2-30ED-AF92-46736A968458> /System/Library/Frameworks/LocalAuthentication.framework/Support/SharedUtils.framework/Versions/A/SharedUtils
    0x7fffc6071000 -     0x7fffc6084ff3  com.apple.LocalAuthentication (1.0 - 240.61.1) <17E3167B-6F71-39FC-B52F-A1B9E5650414> /System/Library/Frameworks/LocalAuthentication.framework/Versions/A/LocalAuthentication
    0x7fffc6085000 -     0x7fffc6278fff  com.apple.MapKit (1.0 - 1696.24.9.30.33) <0D7781CC-DE83-31EC-9285-AA8784CA8EB2> /System/Library/Frameworks/MapKit.framework/Versions/A/MapKit
    0x7fffc6279000 -     0x7fffc627ffff  com.apple.MediaAccessibility (1.0 - 97.1.1) <0BD82735-6644-37CE-B13D-8E7CC59A1752> /System/Library/Frameworks/MediaAccessibility.framework/Versions/A/MediaAccessibility
    0x7fffc6280000 -     0x7fffc6294ff7  com.apple.MediaLibrary (1.3.2 - 733) <DAAE2CED-13CD-353B-BADA-24178E9F38E7> /System/Library/Frameworks/MediaLibrary.framework/Versions/A/MediaLibrary
    0x7fffc6295000 -     0x7fffc67ceff7  com.apple.MediaToolbox (1.0 - 1907.59.1.5) <2024A2A2-50B6-36AA-BC6D-3AAFA78EB707> /System/Library/Frameworks/MediaToolbox.framework/Versions/A/MediaToolbox
    0x7fffc67cf000 -     0x7fffc682afff  com.apple.Metal (87.18 - 87.18) <5C2F12FB-45C1-3103-A827-3D225BF8D05A> /System/Library/Frameworks/Metal.framework/Versions/A/Metal
    0x7fffc7113000 -     0x7fffc711bfff  com.apple.NetFS (6.0 - 4.0) <14A24D00-5673-330A-959D-87F72040DEFF> /System/Library/Frameworks/NetFS.framework/Versions/A/NetFS
    0x7fffc72f2000 -     0x7fffc72faff7  libcldcpuengine.dylib (2.8.5) <73E1E526-01DF-3199-9B48-155F0329EF44> /System/Library/Frameworks/OpenCL.framework/Versions/A/Libraries/libcldcpuengine.dylib
    0x7fffc72fb000 -     0x7fffc7349ff3  com.apple.opencl (2.8.6 - 2.8.6) <5FAF6F49-2648-39E6-922B-5630A5D7F7E4> /System/Library/Frameworks/OpenCL.framework/Versions/A/OpenCL
    0x7fffc734a000 -     0x7fffc7363ffb  com.apple.CFOpenDirectory (10.12 - 194) <A64E9A01-3F6E-36EA-9C10-88C564A68C9D> /System/Library/Frameworks/OpenDirectory.framework/Versions/A/Frameworks/CFOpenDirectory.framework/Versions/A/CFOpenDirectory
    0x7fffc7364000 -     0x7fffc736fff7  com.apple.OpenDirectory (10.12 - 194) <4298FFD0-B1A7-3064-AF5B-708B3FA38671> /System/Library/Frameworks/OpenDirectory.framework/Versions/A/OpenDirectory
    0x7fffc7370000 -     0x7fffc7372fff  libCVMSPluginSupport.dylib (14.0.16) <A20EC348-37C9-33B6-9A81-06006F3214A1> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libCVMSPluginSupport.dylib
    0x7fffc7373000 -     0x7fffc7376ff7  libCoreFSCache.dylib (156.3) <687C4CC3-6537-344B-8BE1-5234C8CB2864> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libCoreFSCache.dylib
    0x7fffc7377000 -     0x7fffc737bfff  libCoreVMClient.dylib (156.3) <E7AEFCBE-B6BF-3C7C-9A4E-E78CB04DB794> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libCoreVMClient.dylib
    0x7fffc737c000 -     0x7fffc7385ff7  libGFXShared.dylib (14.0.16) <63542E68-EB1A-3ECF-AAFB-E7B8AB313C70> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGFXShared.dylib
    0x7fffc7386000 -     0x7fffc7391fff  libGL.dylib (14.0.16) <84BEED97-0A93-356D-A922-97EA311EA446> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGL.dylib
    0x7fffc7392000 -     0x7fffc73ceff7  libGLImage.dylib (14.0.16) <3518A85C-6905-3511-A6C9-2F82C519D28F> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGLImage.dylib
    0x7fffc73cf000 -     0x7fffc7545ff3  libGLProgrammability.dylib (14.0.16) <0EDA89D8-7C28-3D53-BDBA-7CB25232C329> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGLProgrammability.dylib
    0x7fffc7546000 -     0x7fffc7587ff7  libGLU.dylib (14.0.16) <9860DCF7-56E0-3A8F-A377-52635C9D8B27> /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGLU.dylib
    0x7fffc7eef000 -     0x7fffc7efdfff  com.apple.opengl (14.0.16 - 14.0.16) <27E7D76E-A26B-39F8-8CF2-AB57920776A3> /System/Library/Frameworks/OpenGL.framework/Versions/A/OpenGL
    0x7fffc7f9a000 -     0x7fffc80e1fff  com.apple.QTKit (7.7.3 - 2978.7) <49F88771-52FE-3989-AAB7-10A7494C4419> /System/Library/Frameworks/QTKit.framework/Versions/A/QTKit
    0x7fffc80e2000 -     0x7fffc834cff7  com.apple.imageKit (3.0 - 1023) <9C547565-CBAA-3ACB-A3F6-1366A0DCDCB4> /System/Library/Frameworks/Quartz.framework/Versions/A/Frameworks/ImageKit.framework/Versions/A/ImageKit
    0x7fffc834d000 -     0x7fffc8414fff  com.apple.PDFKit (1.0 - 1) <BE82F14C-B20C-3771-B16C-F0723F6552AD> /System/Library/Frameworks/Quartz.framework/Versions/A/Frameworks/PDFKit.framework/Versions/A/PDFKit
    0x7fffc8415000 -     0x7fffc893bff7  com.apple.QuartzComposer (5.1 - 356) <C66293F6-EF05-3B36-8524-081CEB9FADD7> /System/Library/Frameworks/Quartz.framework/Versions/A/Frameworks/QuartzComposer.framework/Versions/A/QuartzComposer
    0x7fffc893c000 -     0x7fffc895fffb  com.apple.quartzfilters (1.10.0 - 1.10.0) <365342ED-7A1A-3C75-AE60-90764E96034C> /System/Library/Frameworks/Quartz.framework/Versions/A/Frameworks/QuartzFilters.framework/Versions/A/QuartzFilters
    0x7fffc8960000 -     0x7fffc8a4dfff  com.apple.QuickLookUIFramework (5.0 - 720.7) <3136C23E-399E-3296-928A-B18EC9FC423C> /System/Library/Frameworks/Quartz.framework/Versions/A/Frameworks/QuickLookUI.framework/Versions/A/QuickLookUI
    0x7fffc8a4e000 -     0x7fffc8a4efff  com.apple.quartzframework (1.5 - 21) <09455972-8A33-3D61-B193-BA7E7CF984CA> /System/Library/Frameworks/Quartz.framework/Versions/A/Quartz
    0x7fffc8a4f000 -     0x7fffc8c4ffff  com.apple.QuartzCore (1.11 - 453.39.3) <AB46D60D-17A8-3122-800E-2A9DA604FCBA> /System/Library/Frameworks/QuartzCore.framework/Versions/A/QuartzCore
    0x7fffc8c50000 -     0x7fffc8ca5fff  com.apple.QuickLookFramework (5.0 - 720.7) <3BD7BA2F-924C-3EFF-B26E-3F930E62E6B4> /System/Library/Frameworks/QuickLook.framework/Versions/A/QuickLook
    0x7fffc8ca6000 -     0x7fffc8cbbfff  com.apple.SafariServices.framework (12603 - 12603.2.4) <BD072E0A-9759-341D-9E59-5D869380076B> /System/Library/Frameworks/SafariServices.framework/Versions/A/SafariServices
    0x7fffc91b6000 -     0x7fffc94b8ff7  com.apple.security (7.0 - 57740.60.18) <021AACF6-D15F-37E0-840B-88853684BA00> /System/Library/Frameworks/Security.framework/Versions/A/Security
    0x7fffc94b9000 -     0x7fffc952efff  com.apple.securityfoundation (6.0 - 55132.50.7) <4433C0CC-FE90-3DD3-BAC1-CC31D515B510> /System/Library/Frameworks/SecurityFoundation.framework/Versions/A/SecurityFoundation
    0x7fffc952f000 -     0x7fffc9558fff  com.apple.securityinterface (10.0 - 55079.50.4) <50E3EAA8-1AF0-3910-AAFD-57D93D958DFF> /System/Library/Frameworks/SecurityInterface.framework/Versions/A/SecurityInterface
    0x7fffc9559000 -     0x7fffc955cff3  com.apple.xpc.ServiceManagement (1.0 - 1) <9F285B19-B53B-3502-85A2-72C26DB40EA7> /System/Library/Frameworks/ServiceManagement.framework/Versions/A/ServiceManagement
    0x7fffc955d000 -     0x7fffc95a7ff7  com.apple.sociald.Social (???) <6FAB064C-EAA9-32A1-837C-57F1DDF47FD4> /System/Library/Frameworks/Social.framework/Versions/A/Social
    0x7fffc98e3000 -     0x7fffc9952ff7  com.apple.SystemConfiguration (1.14 - 1.14) <2412CDE0-C317-31EA-8F53-7A58BBFCC720> /System/Library/Frameworks/SystemConfiguration.framework/Versions/A/SystemConfiguration
    0x7fffc9953000 -     0x7fffc9d01fff  com.apple.VideoToolbox (1.0 - 1907.59.1.5) <75E2F901-572F-3FC8-A599-96A085EEBC88> /System/Library/Frameworks/VideoToolbox.framework/Versions/A/VideoToolbox
    0x7fffc9d02000 -     0x7fffcb088ff3  com.apple.WebCore (12603 - 12603.2.4) <EC9BCF4D-4BC6-3CCF-BF5F-13FB10A24303> /System/Library/Frameworks/WebKit.framework/Versions/A/Frameworks/WebCore.framework/Versions/A/WebCore
    0x7fffcb089000 -     0x7fffcb275ff7  com.apple.WebKitLegacy (12603 - 12603.2.4) <8471B2BB-79A1-3214-B195-167063D5CFD5> /System/Library/Frameworks/WebKit.framework/Versions/A/Frameworks/WebKitLegacy.framework/Versions/A/WebKitLegacy
    0x7fffcb276000 -     0x7fffcb621ffb  com.apple.WebKit (12603 - 12603.2.4) <1CF8B545-5910-31BC-AA29-F89ADFD919F9> /System/Library/Frameworks/WebKit.framework/Versions/A/WebKit
    0x7fffcb622000 -     0x7fffcb66dff7  com.apple.AOSAccounts (1.3.1 - 63.0.6) <8597759B-0A89-32D0-8A9D-2EAD956D2A1E> /System/Library/PrivateFrameworks/AOSAccounts.framework/Versions/A/AOSAccounts
    0x7fffcb66e000 -     0x7fffcb90aff7  com.apple.AOSKit (1.07 - 251) <8E83C542-E4FF-3242-9CF0-A07C352F17F1> /System/Library/PrivateFrameworks/AOSKit.framework/Versions/A/AOSKit
    0x7fffcb90b000 -     0x7fffcb90bffb  com.apple.AOSMigrate (1.0 - 1) <EA2F1657-D8DD-35CA-BEF3-988446C5A64D> /System/Library/PrivateFrameworks/AOSMigrate.framework/Versions/A/AOSMigrate
    0x7fffcba2c000 -     0x7fffcba33ffb  com.apple.APFS (1.0 - 1) <4CDEFDF0-A8CD-3982-B428-02CBA8FAC7C6> /System/Library/PrivateFrameworks/APFS.framework/Versions/A/APFS
    0x7fffcbe7b000 -     0x7fffcbf19ff7  com.apple.accounts.AccountsDaemon (113 - 113) <2A3C41BC-740B-3F7B-AE86-8C2A7B369559> /System/Library/PrivateFrameworks/AccountsDaemon.framework/Versions/A/AccountsDaemon
    0x7fffcbf1a000 -     0x7fffcbf4effb  com.apple.framework.accountsui (1.0 - 45) <C3E4D8B1-295D-37A8-A383-33276A690DD4> /System/Library/PrivateFrameworks/AccountsUI.framework/Versions/A/AccountsUI
    0x7fffcc1a7000 -     0x7fffcc1c2ff3  com.apple.AppContainer (4.0 - 307.50.21) <C2E6BA3D-81FF-39C3-B4BF-DBB9A17DE078> /System/Library/PrivateFrameworks/AppContainer.framework/Versions/A/AppContainer
    0x7fffcc1c3000 -     0x7fffcc1d0ff3  com.apple.AppSandbox (4.0 - 307.50.21) <BF9FA426-8C11-358B-9E1F-A3901E3F2B14> /System/Library/PrivateFrameworks/AppSandbox.framework/Versions/A/AppSandbox
    0x7fffcc1d1000 -     0x7fffcc1f3ffb  com.apple.framework.Apple80211 (12.0 - 1200.47) <B692048E-1B61-3DAF-9CBA-4D314E7562DC> /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Apple80211
    0x7fffcc1f4000 -     0x7fffcc203feb  com.apple.AppleFSCompression (88.50.3 - 1.0) <478E8BFF-8BA2-375E-BE02-BA27F115C15A> /System/Library/PrivateFrameworks/AppleFSCompression.framework/Versions/A/AppleFSCompression
    0x7fffcc2cc000 -     0x7fffcc2d7ff3  com.apple.AppleIDAuthSupport (1.0 - 1) <E17ED2D4-BB59-3156-99B0-D53631AD256E> /System/Library/PrivateFrameworks/AppleIDAuthSupport.framework/Versions/A/AppleIDAuthSupport
    0x7fffcc2f7000 -     0x7fffcc38297f  com.apple.AppleJPEG (1.0 - 1) <B9E9570D-04A4-34E4-B756-D200043B25B8> /System/Library/PrivateFrameworks/AppleJPEG.framework/Versions/A/AppleJPEG
    0x7fffcc383000 -     0x7fffcc395ffb  com.apple.AppleLDAP (10.12 - 41) <AA6AD401-51AB-3869-A5EA-02169711DA54> /System/Library/PrivateFrameworks/AppleLDAP.framework/Versions/A/AppleLDAP
    0x7fffcc396000 -     0x7fffcc3b1fff  com.apple.aps.framework (4.0 - 4.0) <6CA07CDF-1E35-34E9-95BF-BD565FF42BAD> /System/Library/PrivateFrameworks/ApplePushService.framework/Versions/A/ApplePushService
    0x7fffcc3b2000 -     0x7fffcc3baffb  com.apple.AppleSRP (5.0 - 1) <6AAE93B6-9816-35B2-9C59-D5C3218065AF> /System/Library/PrivateFrameworks/AppleSRP.framework/Versions/A/AppleSRP
    0x7fffcc3bb000 -     0x7fffcc3beff3  com.apple.AppleSystemInfo (3.1.5 - 3.1.5) <42A1731A-A576-307A-B07C-9F8F64696CB7> /System/Library/PrivateFrameworks/AppleSystemInfo.framework/Versions/A/AppleSystemInfo
    0x7fffcc3bf000 -     0x7fffcc411fff  com.apple.AppleVAFramework (5.0.36 - 5.0.36) <7352078D-C230-397C-81A5-57A48CF218C0> /System/Library/PrivateFrameworks/AppleVA.framework/Versions/A/AppleVA
    0x7fffcc41b000 -     0x7fffcc422ff7  com.apple.AssetCacheServices (48.3 - 48.3) <C59F7295-36D8-3109-A910-C83D884CC92C> /System/Library/PrivateFrameworks/AssetCacheServices.framework/Versions/A/AssetCacheServices
    0x7fffcc4bf000 -     0x7fffcc74bfff  com.apple.AuthKit (1.0 - 1) <5E0C9787-655C-36D6-8CEF-C22EECE427EC> /System/Library/PrivateFrameworks/AuthKit.framework/Versions/A/AuthKit
    0x7fffcc74c000 -     0x7fffcc7b4ffb  com.apple.AuthKitUI (1.0 - 1) <D67F0547-D3CE-3578-9CC9-59B7B6E2ADC6> /System/Library/PrivateFrameworks/AuthKitUI.framework/Versions/A/AuthKitUI
    0x7fffcc7b5000 -     0x7fffcc833ff7  com.apple.backup.framework (1.8.5 - 1.8.5) <CC679891-E8F5-3166-8EB6-AEA06954A52D> /System/Library/PrivateFrameworks/Backup.framework/Versions/A/Backup
    0x7fffcc83c000 -     0x7fffcc842fff  com.apple.BezelServicesFW (274.3 - 274.3) <DEC2BCB8-827E-31B6-8695-7F8F27D85249> /System/Library/PrivateFrameworks/BezelServices.framework/Versions/A/BezelServices
    0x7fffcc843000 -     0x7fffcc845ff3  com.apple.BioKitAggDLibrary (1.0 - 1) <CED311DD-99D7-364C-ABDC-685DBD146698> /System/Library/PrivateFrameworks/BioKitAggD.framework/Versions/A/BioKitAggD
    0x7fffcc846000 -     0x7fffcc85bff7  com.apple.BiometricKit (1.0 - 100.99) <CE211D5F-3AF5-3031-A4D4-1F67457CAE22> /System/Library/PrivateFrameworks/BiometricKit.framework/Versions/A/BiometricKit
    0x7fffcc85c000 -     0x7fffcc899ffb  com.apple.bom (14.0 - 194.1) <0CBECAF1-B5E0-302F-99EC-D7ED14E12B84> /System/Library/PrivateFrameworks/Bom.framework/Versions/A/Bom
    0x7fffcc8a3000 -     0x7fffcc8a3fff  com.apple.SafariDAVNotifier (1.1.1 - 1) <1C86425B-4FF8-3E82-AF55-1964800D1B59> /System/Library/PrivateFrameworks/BookmarkDAV.framework/Versions/A/Frameworks/SafariDAVNotifier.framework/Versions/A/SafariDAVNotifier
    0x7fffccada000 -     0x7fffccb03ffb  com.apple.CacheDelete (1.0 - 1) <D9678282-6F34-3EE4-94E2-42B2F6A055A5> /System/Library/PrivateFrameworks/CacheDelete.framework/Versions/A/CacheDelete
    0x7fffccecf000 -     0x7fffccef6fff  com.apple.CalendarAgentLink (8.0 - 250) <E50E29F6-2BAB-3B8B-BBEA-7DC0B8B077AD> /System/Library/PrivateFrameworks/CalendarAgentLink.framework/Versions/A/CalendarAgentLink
    0x7fffccf0f000 -     0x7fffccf74ffb  com.apple.CalendarFoundation (8.0 - 504.0.6) <29498D9F-BAAE-3C9C-AB15-D3F1B1BA3462> /System/Library/PrivateFrameworks/CalendarFoundation.framework/Versions/A/CalendarFoundation
    0x7fffcd4be000 -     0x7fffcd4e5ff3  com.apple.ChunkingLibrary (173 - 173) <FC2165F9-FC93-39C0-8323-C2F43A5E00A3> /System/Library/PrivateFrameworks/ChunkingLibrary.framework/Versions/A/ChunkingLibrary
    0x7fffcd4e6000 -     0x7fffcd572ff7  com.apple.CloudDocs (1.0 - 486.29) <751554B6-A09E-32A8-A604-9F1B1FD8B84D> /System/Library/PrivateFrameworks/CloudDocs.framework/Versions/A/CloudDocs
    0x7fffcdda6000 -     0x7fffcddb8fff  com.apple.CloudPhotoServicesConfiguration (2.0 - 3150.4.120) <7E663D10-569A-3DF0-A97F-A5A2E6383AD3> /System/Library/PrivateFrameworks/CloudPhotoServices.framework/Versions/A/Frameworks/CloudPhotoServicesConfiguration.framework/Versions/A/CloudPhotoServicesConfiguration
    0x7fffcddb9000 -     0x7fffcddb9ff7  com.apple.CloudPhotosConfigurationXPC (2.0 - 3150.4.120) <8AE80AD7-901C-3410-B407-82EA9D402DD9> /System/Library/PrivateFrameworks/CloudPhotoServices.framework/Versions/A/Frameworks/CloudPhotosConfigurationXPC.framework/Versions/A/CloudPhotosConfigurationXPC
    0x7fffcddba000 -     0x7fffcddc7fff  com.apple.CloudServices (1.0 - 222.60.1) <0A557DFE-31C7-3F5F-BEFB-BEC4208E34C9> /System/Library/PrivateFrameworks/CloudServices.framework/Versions/A/CloudServices
    0x7fffcddc8000 -     0x7fffcddfdffb  com.apple.CommerceKit (1.2.0 - 583.17) <59B530A6-694B-3267-AC73-CB5E4E14C3BE> /System/Library/PrivateFrameworks/CommerceKit.framework/Versions/A/CommerceKit
    0x7fffcddfe000 -     0x7fffcde09ffb  com.apple.CommerceCore (1.0 - 583.17) <EA36D593-7DFE-3776-B688-DD3736CE0274> /System/Library/PrivateFrameworks/CommerceKit.framework/Versions/A/Frameworks/CommerceCore.framework/Versions/A/CommerceCore
    0x7fffcde0a000 -     0x7fffcde13ffb  com.apple.CommonAuth (4.0 - 2.0) <216950CB-269F-3476-BA17-D6363AC49FBC> /System/Library/PrivateFrameworks/CommonAuth.framework/Versions/A/CommonAuth
    0x7fffcde14000 -     0x7fffcde20fff  com.apple.commonutilities (8.0 - 900) <B0C96E6D-2C68-36EF-86BE-A2E5F380C78B> /System/Library/PrivateFrameworks/CommonUtilities.framework/Versions/A/CommonUtilities
    0x7fffcde21000 -     0x7fffcde25ff7  com.apple.communicationsfilter (10.0 - 1000) <4747FBCF-F2BB-3C06-9C04-4C9F4A5B7869> /System/Library/PrivateFrameworks/CommunicationsFilter.framework/Versions/A/CommunicationsFilter
    0x7fffcdeda000 -     0x7fffcdf2affb  com.apple.AddressBook.ContactsFoundation (8.0 - 2250.10) <3097DEAC-ED6B-358E-8E81-8B7011CECA91> /System/Library/PrivateFrameworks/ContactsFoundation.framework/Versions/A/ContactsFoundation
    0x7fffcdf2b000 -     0x7fffcdf4dfff  com.apple.contacts.ContactsPersistence (1.0 - 2250.10) <7EC0366F-30A6-3538-8BC9-8CABD55C178D> /System/Library/PrivateFrameworks/ContactsPersistence.framework/Versions/A/ContactsPersistence
    0x7fffcdf4e000 -     0x7fffcdf96ff7  com.apple.Contacts.ContactsUICore (1.0 - 999.9.9) <01514CAA-4692-31DC-BA39-9079BDD2BBB8> /System/Library/PrivateFrameworks/ContactsUICore.framework/Versions/A/ContactsUICore
    0x7fffcdf97000 -     0x7fffce376ff7  com.apple.CoreAUC (226.0.0 - 226.0.0) <FBF6C5BC-5937-3957-B6BA-E101DF9B0DF6> /System/Library/PrivateFrameworks/CoreAUC.framework/Versions/A/CoreAUC
    0x7fffce377000 -     0x7fffce3a7fff  com.apple.CoreAVCHD (5.9.0 - 5900.4.1) <3F6857D1-AE7C-3593-B064-930F5BB7269E> /System/Library/PrivateFrameworks/CoreAVCHD.framework/Versions/A/CoreAVCHD
    0x7fffce3e1000 -     0x7fffce441ff7  com.apple.coredav (1.0.1 - 320.6) <9C927A7D-8EFF-332F-B0D0-AC530AFC7C53> /System/Library/PrivateFrameworks/CoreDAV.framework/Versions/A/CoreDAV
    0x7fffce442000 -     0x7fffce44affb  com.apple.frameworks.CoreDaemon (1.3 - 1.3) <2AB86FAF-37B3-3323-9EF0-CA591B6E357C> /System/Library/PrivateFrameworks/CoreDaemon.framework/Versions/B/CoreDaemon
    0x7fffce44b000 -     0x7fffce524ff3  com.apple.CoreDuet (1.0 - 1) <1475EC32-415A-326A-A34D-CE6F91A5C848> /System/Library/PrivateFrameworks/CoreDuet.framework/Versions/A/CoreDuet
    0x7fffce541000 -     0x7fffce553fff  com.apple.CoreDuetDaemonProtocol (1.0 - 1) <0AAC4791-2A90-3A16-AF07-AF519329A2F9> /System/Library/PrivateFrameworks/CoreDuetDaemonProtocol.framework/Versions/A/CoreDuetDaemonProtocol
    0x7fffce556000 -     0x7fffce558fff  com.apple.CoreDuetDebugLogging (1.0 - 1) <19DD8BD6-63C5-3F44-A4BE-F71E6715CE32> /System/Library/PrivateFrameworks/CoreDuetDebugLogging.framework/Versions/A/CoreDuetDebugLogging
    0x7fffce55b000 -     0x7fffce56bfff  com.apple.CoreEmoji (1.0 - 40.3.3) <E9A28301-2D79-3A97-A046-028258A6ABE5> /System/Library/PrivateFrameworks/CoreEmoji.framework/Versions/A/CoreEmoji
    0x7fffce617000 -     0x7fffce62fff3  com.apple.CoreInterest (1.0 - 1) <4D15288F-0457-32AE-8CF4-78A4EBB10C26> /System/Library/PrivateFrameworks/CoreInterest.framework/Versions/A/CoreInterest
    0x7fffce630000 -     0x7fffce646ff3  com.apple.CoreMediaAuthoring (2.2 - 956) <AEBFF55F-BF1E-3CA5-AA9C-1CE22218A665> /System/Library/PrivateFrameworks/CoreMediaAuthoring.framework/Versions/A/CoreMediaAuthoring
    0x7fffce64d000 -     0x7fffce6ddffb  com.apple.CorePDF (4.0 - 4) <7F50E4A6-940C-33F5-BE4E-7E01AFE98A8F> /System/Library/PrivateFrameworks/CorePDF.framework/Versions/A/CorePDF
    0x7fffce6de000 -     0x7fffce759ff7  com.apple.siri.parsec.CoreParsec (1.0 - 1) <56EE1A82-1566-3D8A-B1D5-EE78057DACBB> /System/Library/PrivateFrameworks/CoreParsec.framework/Versions/A/CoreParsec
    0x7fffce7e0000 -     0x7fffce7eaffb  com.apple.corerecents (1.0 - 1) <9EDDBBC1-9D10-3DB7-8769-309A4C90667E> /System/Library/PrivateFrameworks/CoreRecents.framework/Versions/A/CoreRecents
    0x7fffce8a6000 -     0x7fffce8d6ff3  com.apple.CoreServicesInternal (276.2 - 276.2) <05EB7D45-DD4C-3A0F-AC63-A0C2A68E6481> /System/Library/PrivateFrameworks/CoreServicesInternal.framework/Versions/A/CoreServicesInternal
    0x7fffce8d7000 -     0x7fffce91dfff  com.apple.CoreSpotlight (1.0 - 144) <AFE848C4-8534-399A-94B1-E6FF83D59095> /System/Library/PrivateFrameworks/CoreSpotlight.framework/Versions/A/CoreSpotlight
    0x7fffceb67000 -     0x7fffcebf6ff7  com.apple.CoreSymbolication (62046) <7839CD8E-011D-3567-88DE-3D472C661136> /System/Library/PrivateFrameworks/CoreSymbolication.framework/Versions/A/CoreSymbolication
    0x7fffcebf7000 -     0x7fffced36fe7  com.apple.coreui (2.1 - 431.3) <2E8FEC10-FC5B-3782-92DA-A85C24B7BF7C> /System/Library/PrivateFrameworks/CoreUI.framework/Versions/A/CoreUI
    0x7fffced37000 -     0x7fffcee07ff3  com.apple.CoreUtils (5.1 - 510.31) <E68BB8ED-8874-36EC-A7C5-1017C0E727CB> /System/Library/PrivateFrameworks/CoreUtils.framework/Versions/A/CoreUtils
    0x7fffcee57000 -     0x7fffceebcff3  com.apple.framework.CoreWiFi (12.0 - 1200.31) <DF0972EF-F817-3FD3-8C00-2D57B8738D8C> /System/Library/PrivateFrameworks/CoreWiFi.framework/Versions/A/CoreWiFi
    0x7fffceebd000 -     0x7fffceecbff7  com.apple.CrashReporterSupport (10.12 - 827) <14037A71-ECFE-394A-8D6E-2CECE98F02EE> /System/Library/PrivateFrameworks/CrashReporterSupport.framework/Versions/A/CrashReporterSupport
    0x7fffcef3d000 -     0x7fffcef47ffb  com.apple.framework.DFRFoundation (1.0 - 104.25) <7CFF896C-EF22-3941-BB3D-F3615CE4C908> /System/Library/PrivateFrameworks/DFRFoundation.framework/Versions/A/DFRFoundation
    0x7fffcef48000 -     0x7fffcef4cff3  com.apple.DSExternalDisplay (3.1 - 380) <A195C0CE-8E4E-384B-9556-8270E306FE1D> /System/Library/PrivateFrameworks/DSExternalDisplay.framework/Versions/A/DSExternalDisplay
    0x7fffcef4d000 -     0x7fffcef81ff3  com.apple.datadetectors (5.0 - 348.2.1) <CFC96349-7432-3A6B-AB7D-52867DA22809> /System/Library/PrivateFrameworks/DataDetectors.framework/Versions/A/DataDetectors
    0x7fffcef82000 -     0x7fffceff7ffb  com.apple.datadetectorscore (7.0 - 539.1) <9C312AAC-8AEE-3C72-BDE5-7FBF62452525> /System/Library/PrivateFrameworks/DataDetectorsCore.framework/Versions/A/DataDetectorsCore
    0x7fffcf033000 -     0x7fffcf072fff  com.apple.DebugSymbols (137 - 137) <58A70B66-2628-3CFE-B103-2200D95FC5F7> /System/Library/PrivateFrameworks/DebugSymbols.framework/Versions/A/DebugSymbols
    0x7fffcf073000 -     0x7fffcf184fff  com.apple.desktopservices (1.11.5 - 1.11.5) <46A9D4F3-1EF8-373C-98A4-AD48D285E484> /System/Library/PrivateFrameworks/DesktopServicesPriv.framework/Versions/A/DesktopServicesPriv
    0x7fffcf187000 -     0x7fffcf188ff3  com.apple.diagnosticlogcollection (10.0 - 1000) <8FAE46F9-77CF-3652-82F0-872977C5F45C> /System/Library/PrivateFrameworks/DiagnosticLogCollection.framework/Versions/A/DiagnosticLogCollection
    0x7fffcf189000 -     0x7fffcf25efff  com.apple.DiskImagesFramework (444.50.16 - 444.50.16) <F57B7413-6603-390A-B5C3-8AD68708E49B> /System/Library/PrivateFrameworks/DiskImages.framework/Versions/A/DiskImages
    0x7fffcf25f000 -     0x7fffcf2c6ff3  com.apple.DiskManagement (10.1 - 1114) <A0CB7BDC-76F3-31A4-AEC1-4146027C78FF> /System/Library/PrivateFrameworks/DiskManagement.framework/Versions/A/DiskManagement
    0x7fffcf2c7000 -     0x7fffcf2d2fff  com.apple.DisplayServicesFW (3.1 - 380) <83BB7C77-F18D-382D-9023-26132D925F75> /System/Library/PrivateFrameworks/DisplayServices.framework/Versions/A/DisplayServices
    0x7fffcf2d3000 -     0x7fffcf2e0ff7  com.apple.DuetActivityScheduler (1.0 - 1) <1DC22CBD-6C6B-3E8B-9BAE-42B8AE123DA0> /System/Library/PrivateFrameworks/DuetActivityScheduler.framework/Versions/A/DuetActivityScheduler
    0x7fffcf317000 -     0x7fffcf319ffb  com.apple.EFILogin (2.0 - 2) <A74B0065-643F-3BC1-8FE9-E7CEAA29AD9A> /System/Library/PrivateFrameworks/EFILogin.framework/Versions/A/EFILogin
    0x7fffcf327000 -     0x7fffcf32dffb  com.apple.EmbeddedOSSupportHost (1.0 - 1) <A9F574E4-0508-358B-8E79-ED03D011E845> /System/Library/PrivateFrameworks/EmbeddedOSSupportHost.framework/Versions/A/EmbeddedOSSupportHost
    0x7fffcf399000 -     0x7fffcf3b6ff3  com.apple.icloud.FMCore (1.0 - 1) <41A7B19E-0909-3141-874D-AFC451CF862B> /System/Library/PrivateFrameworks/FMCore.framework/Versions/A/FMCore
    0x7fffcf3b7000 -     0x7fffcf3cbff3  com.apple.icloud.FMCoreLite (1.0 - 1) <FB448AD9-5E6D-3C0C-BBB8-162FEAE48D97> /System/Library/PrivateFrameworks/FMCoreLite.framework/Versions/A/FMCoreLite
    0x7fffcf3cc000 -     0x7fffcf3d1ffb  com.apple.icloud.FMCoreUI (1.0 - 1) <5E3522E8-1EF2-3E79-9135-992A9C55C86B> /System/Library/PrivateFrameworks/FMCoreUI.framework/Versions/A/FMCoreUI
    0x7fffcf3d2000 -     0x7fffcf3f8fff  com.apple.icloud.FMF (1.0 - 1) <8D9C9EE6-1175-3128-BBB6-694FB846A48E> /System/Library/PrivateFrameworks/FMF.framework/Versions/A/FMF
    0x7fffcf3f9000 -     0x7fffcf40bff3  com.apple.icloud.FMFUI (1.0 - 1) <F9AB0648-F84F-30FD-9556-9E041D626866> /System/Library/PrivateFrameworks/FMFUI.framework/Versions/A/FMFUI
    0x7fffcf46c000 -     0x7fffcf89dff7  com.apple.vision.FaceCore (3.3.2 - 3.3.2) <9391D5A3-738C-3136-9D07-518CB43DBADA> /System/Library/PrivateFrameworks/FaceCore.framework/Versions/A/FaceCore
    0x7fffcf8a6000 -     0x7fffcf8c3ff3  com.apple.framework.familycontrols (4.1 - 410) <94C6D9DD-919B-3826-8D1A-1EA71C928516> /System/Library/PrivateFrameworks/FamilyControls.framework/Versions/A/FamilyControls
    0x7fffcf8ca000 -     0x7fffcf8d5ff3  com.apple.icloud.FindMyDevice (1.0 - 1) <95AFE8AD-A0AD-3ED4-A4C1-BD144277FE7B> /System/Library/PrivateFrameworks/FindMyDevice.framework/Versions/A/FindMyDevice
    0x7fffd0bf4000 -     0x7fffd0bf4fff  libmetal_timestamp.dylib (600.0.49.9) <E5EED927-1671-3390-BCBB-D76201D63C73> /System/Library/PrivateFrameworks/GPUCompiler.framework/libmetal_timestamp.dylib
    0x7fffd0c01000 -     0x7fffd0c0cff3  libGPUSupportMercury.dylib (14.0.16) <7E99C736-2F48-313E-BEF6-6F8BABFADD9F> /System/Library/PrivateFrameworks/GPUSupport.framework/Versions/A/Libraries/libGPUSupportMercury.dylib
    0x7fffd0ec5000 -     0x7fffd0ee1fff  com.apple.GenerationalStorage (2.0 - 267.1) <3DE1C580-D089-362D-8582-8DE68A3C5F13> /System/Library/PrivateFrameworks/GenerationalStorage.framework/Versions/A/GenerationalStorage
    0x7fffd0efa000 -     0x7fffd15acfff  com.apple.GeoServices (1.0 - 1228.24.9.30.34) <96BF97F6-8FF2-3FC4-A8C1-498CB7B0D9A0> /System/Library/PrivateFrameworks/GeoServices.framework/Versions/A/GeoServices
    0x7fffd15f2000 -     0x7fffd1668ff3  com.apple.Heimdal (4.0 - 2.0) <8F9C9041-66D5-36C9-8A4C-1658035C311D> /System/Library/PrivateFrameworks/Heimdal.framework/Versions/A/Heimdal
    0x7fffd1669000 -     0x7fffd167afff  com.apple.HelpData (2.1.12 - 100.1) <EEB8CC44-9AFF-3005-A25D-18FE46574FD5> /System/Library/PrivateFrameworks/HelpData.framework/Versions/A/HelpData
    0x7fffd167b000 -     0x7fffd169fff7  com.apple.IASUtilities (1.0 - 415) <275605FF-EA22-384A-8002-C429C8524653> /System/Library/PrivateFrameworks/IASUtilities.framework/Versions/A/IASUtilities
    0x7fffd16a0000 -     0x7fffd1760ff7  com.apple.ids (10.0 - 1000) <9FF3119A-D7A1-31AC-9D1B-055B06C386D8> /System/Library/PrivateFrameworks/IDS.framework/Versions/A/IDS
    0x7fffd1761000 -     0x7fffd17a3ffb  com.apple.idsfoundation (10.0 - 1000) <FE13CC87-15A8-3297-9536-CA1A79210274> /System/Library/PrivateFrameworks/IDSFoundation.framework/Versions/A/IDSFoundation
    0x7fffd1bcf000 -     0x7fffd1c32ffb  com.apple.imfoundation (10.0 - 1000) <5D06CD08-8F99-357B-B90B-3F2F8C22D4F8> /System/Library/PrivateFrameworks/IMFoundation.framework/Versions/A/IMFoundation
    0x7fffd1c83000 -     0x7fffd1c8affb  com.apple.IOAccelerator (311.13 - 311.13) <40C04C41-A76A-3687-8D64-F76E8C46AA81> /System/Library/PrivateFrameworks/IOAccelerator.framework/Versions/A/IOAccelerator
    0x7fffd1c8b000 -     0x7fffd1c8bfff  com.apple.IOPlatformPluginFamily (1.0 - 1) <25875BD4-988C-39AB-AA95-21364CAF63A2> /System/Library/PrivateFrameworks/IOPlatformPluginFamily.framework/Versions/A/IOPlatformPluginFamily
    0x7fffd1c8c000 -     0x7fffd1ca0ff7  com.apple.IOPresentment (1.0 - 29.10) <A3F7C1F6-CE50-3804-AAAF-7B75EBC46BE4> /System/Library/PrivateFrameworks/IOPresentment.framework/Versions/A/IOPresentment
    0x7fffd1ca1000 -     0x7fffd1cc3fff  com.apple.IconServices (74.4 - 74.4) <218DDD05-35F4-3833-B98D-471ED0EBC031> /System/Library/PrivateFrameworks/IconServices.framework/Versions/A/IconServices
    0x7fffd1cc4000 -     0x7fffd1cc9ffb  com.apple.incomingcallfilter (10.0 - 1000) <4CEF7644-A1E3-3397-8C3C-409DEC0E6ABF> /System/Library/PrivateFrameworks/IncomingCallFilter.framework/Versions/A/IncomingCallFilter
    0x7fffd1cca000 -     0x7fffd1ce7ff7  com.apple.DistributionKit (700 - 1000) <C5CC2359-8E3B-3919-8C87-E0B208F10A46> /System/Library/PrivateFrameworks/Install.framework/Frameworks/DistributionKit.framework/Versions/A/DistributionKit
    0x7fffd1ce8000 -     0x7fffd1cefffb  com.apple.InstallerDiagnostics (1.0 - 1) <4C7E8591-A2B9-3498-966E-FC8040B3AAB8> /System/Library/PrivateFrameworks/InstallerDiagnostics.framework/Versions/A/InstallerDiagnostics
    0x7fffd1cf0000 -     0x7fffd1cf0fff  com.apple.IntentsFoundation (1.0 - 1) <CBA39427-EFB6-38CF-9F6B-E68D416A272B> /System/Library/PrivateFrameworks/IntentsFoundation.framework/Versions/A/IntentsFoundation
    0x7fffd1d5f000 -     0x7fffd1d6fff3  com.apple.IntlPreferences (2.0 - 216) <47681AE8-4539-3525-890C-206B301CEC77> /System/Library/PrivateFrameworks/IntlPreferences.framework/Versions/A/IntlPreferences
    0x7fffd1d8e000 -     0x7fffd1d9bfff  com.apple.KerberosHelper (4.0 - 1.0) <D89B0B37-932D-3EF6-BF70-F6C822F4163B> /System/Library/PrivateFrameworks/KerberosHelper.framework/Versions/A/KerberosHelper
    0x7fffd1d9c000 -     0x7fffd1da9fff  com.apple.security.KeychainCircle.KeychainCircle (1.0 - 1) <0E64E4D8-8C2F-3374-957C-6E7D975C71F0> /System/Library/PrivateFrameworks/KeychainCircle.framework/Versions/A/KeychainCircle
    0x7fffd1daa000 -     0x7fffd1f61fff  com.apple.LanguageModeling (1.0 - 123.2.5) <A8CA965F-0399-310D-91C3-B93DDDE9A442> /System/Library/PrivateFrameworks/LanguageModeling.framework/Versions/A/LanguageModeling
    0x7fffd1f62000 -     0x7fffd1f71ff7  com.apple.LocalAuthenticationUI (1.0 - 240.61.1) <2DE1C14F-81C8-3E63-B239-0BDC3C7EFDDD> /System/Library/PrivateFrameworks/LocalAuthenticationUI.framework/Versions/A/LocalAuthenticationUI
    0x7fffd1fad000 -     0x7fffd1fb1ff7  com.apple.LoginUICore (4.0 - 4.0) <7ADA40B1-995C-3947-8163-2257E7FB9440> /System/Library/PrivateFrameworks/LoginUIKit.framework/Versions/A/Frameworks/LoginUICore.framework/Versions/A/LoginUICore
    0x7fffd205d000 -     0x7fffd211fff3  com.apple.MMCS (1.3 - 385.4) <D3D76CE0-DE05-373E-B757-9E4B4920565D> /System/Library/PrivateFrameworks/MMCS.framework/Versions/A/MMCS
    0x7fffd25d1000 -     0x7fffd25d4fff  com.apple.Mangrove (1.0 - 1) <98814966-FD65-302B-B47E-00928DC34E5C> /System/Library/PrivateFrameworks/Mangrove.framework/Versions/A/Mangrove
    0x7fffd2613000 -     0x7fffd2615ffb  com.apple.marco (10.0 - 1000) <A4D35D48-6020-3FF7-BB4F-8193534A4B8F> /System/Library/PrivateFrameworks/Marco.framework/Versions/A/Marco
    0x7fffd26ad000 -     0x7fffd26e1ff3  com.apple.MediaKit (16 - 845) <883DC63F-F90F-3FB9-8C23-9CECD72EBCDE> /System/Library/PrivateFrameworks/MediaKit.framework/Versions/A/MediaKit
    0x7fffd26e2000 -     0x7fffd2842ffb  com.apple.MediaRemote (1.0 - 1) <E1DB72EE-2BA2-34B4-A406-B94955B15B69> /System/Library/PrivateFrameworks/MediaRemote.framework/Versions/A/MediaRemote
    0x7fffd2843000 -     0x7fffd285effb  com.apple.MediaServices (1.0 - 1) <C7097932-E6BF-396A-B838-785000FBF58D> /System/Library/PrivateFrameworks/MediaServices.framework/Versions/A/MediaServices
    0x7fffd2882000 -     0x7fffd28fbff7  com.apple.MetalPerformanceShaders.MetalPerformanceShaders (1.0 - 1) <C323FC94-FFA5-3EE6-B2AC-7E61EA92F304> /System/Library/PrivateFrameworks/MetalPerformanceShaders.framework/Versions/A/MetalPerformanceShaders
    0x7fffd290d000 -     0x7fffd2a56ff7  com.apple.mobiledevice (905.60.2 - 905.60.2) <AD965297-4DB4-3BBD-949F-26AEFEA7CE3C> /System/Library/PrivateFrameworks/MobileDevice.framework/Versions/A/MobileDevice
    0x7fffd2a57000 -     0x7fffd2a64ff3  com.apple.MobileKeyBag (2.0 - 1.0) <F42EB8B1-BA68-3769-98BE-26A18AED902F> /System/Library/PrivateFrameworks/MobileKeyBag.framework/Versions/A/MobileKeyBag
    0x7fffd2a75000 -     0x7fffd2a9dff7  com.apple.MultitouchSupport.framework (368.16 - 368.16) <512ADEC6-D694-3D73-A48A-6BE79CD39539> /System/Library/PrivateFrameworks/MultitouchSupport.framework/Versions/A/MultitouchSupport
    0x7fffd2a9e000 -     0x7fffd2b4eff7  com.apple.Navigation (1.0 - 1) <FFF54736-6C48-39A8-9268-1F27C794EF33> /System/Library/PrivateFrameworks/Navigation.framework/Versions/A/Navigation
    0x7fffd2b4f000 -     0x7fffd2b5afff  com.apple.NetAuth (6.2 - 6.2) <97F487D6-8089-31A8-B68C-6C1EAC6ED1B5> /System/Library/PrivateFrameworks/NetAuth.framework/Versions/A/NetAuth
    0x7fffd2b67000 -     0x7fffd2be4fff  com.apple.Network (1.0 - 1) <1B93BA06-3544-370F-8349-471826F5B24C> /System/Library/PrivateFrameworks/Network.framework/Versions/A/Network
    0x7fffd2fa7000 -     0x7fffd2fa9fff  com.apple.OAuth (25 - 25) <D6E5F36D-71B8-3E12-9601-CE2A1D6ED60B> /System/Library/PrivateFrameworks/OAuth.framework/Versions/A/OAuth
    0x7fffd2fc2000 -     0x7fffd2fcaffb  com.apple.PackageKit.PackageUIKit (3.0 - 629) <739D41E7-387B-3F98-876B-7961DF9924C0> /System/Library/PrivateFrameworks/PackageKit.framework/Frameworks/PackageUIKit.framework/Versions/A/PackageUIKit
    0x7fffd2fcb000 -     0x7fffd30cefef  com.apple.PackageKit (3.0 - 629) <6852D890-F4A8-37A1-BF8D-87763616A117> /System/Library/PrivateFrameworks/PackageKit.framework/Versions/A/PackageKit
    0x7fffd3110000 -     0x7fffd3111fff  com.apple.ParsecSubscriptionServiceSupport (1.0 - 977) <9AD2AA32-3418-36FC-9D58-4D513257156A> /System/Library/PrivateFrameworks/ParsecSubscriptionServiceSupport.framework/Versions/A/ParsecSubscriptionServiceSupport
    0x7fffd3432000 -     0x7fffd3473ff3  com.apple.PerformanceAnalysis (1.148.3 - 148.3) <6A21AB41-3AAA-32F3-9D46-2555A143A8B9> /System/Library/PrivateFrameworks/PerformanceAnalysis.framework/Versions/A/PerformanceAnalysis
    0x7fffd3496000 -     0x7fffd34a7ffb  com.apple.PersonaKit (1.0 - 1) <E04707DB-FA97-3429-87D2-7DD6BE9518BE> /System/Library/PrivateFrameworks/PersonaKit.framework/Versions/A/PersonaKit
    0x7fffd34a8000 -     0x7fffd34b5ff3  com.apple.PersonaUI (1.0 - 1) <1EB4FD4A-D59C-3897-B35B-3291F405F816> /System/Library/PrivateFrameworks/PersonaUI.framework/Versions/A/PersonaUI
    0x7fffd34b6000 -     0x7fffd34bdff3  com.apple.phonenumbers (1.1.1 - 105) <B8EFDDD3-BA26-39B8-9EA0-3649184BF527> /System/Library/PrivateFrameworks/PhoneNumbers.framework/Versions/A/PhoneNumbers
    0x7fffd3aab000 -     0x7fffd3acdfff  com.apple.pluginkit.framework (1.0 - 1) <775E1168-9A28-34EC-AACD-B73803B9DDD4> /System/Library/PrivateFrameworks/PlugInKit.framework/Versions/A/PlugInKit
    0x7fffd3b20000 -     0x7fffd3b5aff7  com.apple.ProtectedCloudStorage (1.0 - 1) <1C6083B7-F020-3634-8F53-CC9E07F27EC5> /System/Library/PrivateFrameworks/ProtectedCloudStorage.framework/Versions/A/ProtectedCloudStorage
    0x7fffd3b5b000 -     0x7fffd3b75fff  com.apple.ProtocolBuffer (1 - 249.1) <A1F1B0F3-078F-378F-A9A9-0DEEA70E816A> /System/Library/PrivateFrameworks/ProtocolBuffer.framework/Versions/A/ProtocolBuffer
    0x7fffd3b76000 -     0x7fffd3b85ff7  com.apple.QuickLookThumbnailing (1.0 - 1) <173EE873-1700-3FCA-9782-C060FBB5BCAD> /System/Library/PrivateFrameworks/QuickLookThumbnailing.framework/Versions/A/QuickLookThumbnailing
    0x7fffd3b8e000 -     0x7fffd3bb1ff3  com.apple.RemoteViewServices (2.0 - 124) <6B967FDA-6591-302C-BA0A-76C4856E584E> /System/Library/PrivateFrameworks/RemoteViewServices.framework/Versions/A/RemoteViewServices
    0x7fffd3c75000 -     0x7fffd44cdfff  com.apple.Safari.framework (12603 - 12603.2.4) <0852DA6C-F351-365A-A281-01825A5764E5> /System/Library/PrivateFrameworks/Safari.framework/Versions/A/Safari
    0x7fffd44ce000 -     0x7fffd44e9ff7  com.apple.Safari.Core (12603 - 12603.2.4) <BEB937BC-DD99-3875-BB1A-C338652D0CCD> /System/Library/PrivateFrameworks/SafariCore.framework/Versions/A/SafariCore
    0x7fffd44ea000 -     0x7fffd4519ff7  com.apple.Safari.SafeBrowsing (12603 - 12603.2.4) <6DEF93E4-4779-3D99-83AC-54625265F093> /System/Library/PrivateFrameworks/SafariSafeBrowsing.framework/Versions/A/SafariSafeBrowsing
    0x7fffd451a000 -     0x7fffd485aff7  com.apple.Safari.Shared (12603 - 12603.2.4) <773656DB-1DAA-397F-A063-85968CEC15F7> /System/Library/PrivateFrameworks/SafariShared.framework/Versions/A/SafariShared
    0x7fffd485b000 -     0x7fffd4877ff3  com.apple.SearchFoundation (1.0 - 1) <742EF0CB-336A-3086-8E79-8E3EE848F302> /System/Library/PrivateFrameworks/SearchFoundation.framework/Versions/A/SearchFoundation
    0x7fffd4878000 -     0x7fffd487bfff  com.apple.SecCodeWrapper (4.0 - 307.50.21) <F8E957B2-D3F0-3B73-B38C-AE8868F00939> /System/Library/PrivateFrameworks/SecCodeWrapper.framework/Versions/A/SecCodeWrapper
    0x7fffd487c000 -     0x7fffd4881fff  com.apple.ServerInformation (2.0 - 1) <E403A1EE-2D62-3340-800C-C5FF24D8F352> /System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/ServerInformation
    0x7fffd488a000 -     0x7fffd4909ff7  com.apple.ShareKit (1.0 - 500) <C92D2122-229C-3FF6-B894-C4E8729AAB3A> /System/Library/PrivateFrameworks/ShareKit.framework/Versions/A/ShareKit
    0x7fffd490a000 -     0x7fffd4997fff  com.apple.Sharing (696.2.67 - 696.2.67) <F681EE28-153F-3216-97A6-6F5E4148AB2E> /System/Library/PrivateFrameworks/Sharing.framework/Versions/A/Sharing
    0x7fffd4998000 -     0x7fffd49b7ff7  com.apple.shortcut (2.16 - 98) <6C0435B1-83DD-3254-B0D3-3B86C6CE606A> /System/Library/PrivateFrameworks/Shortcut.framework/Versions/A/Shortcut
    0x7fffd49b8000 -     0x7fffd4c1efef  com.apple.SkyLight (1.600.0 - 170.3) <83AB220F-48C0-3063-8ED3-ACDB69243B4D> /System/Library/PrivateFrameworks/SkyLight.framework/Versions/A/SkyLight
    0x7fffd4d4a000 -     0x7fffd4dfcff7  com.apple.SoftwareUpdate.framework (6 - 977.5) <B809AD35-7498-3302-BE5A-BF3AB787154D> /System/Library/PrivateFrameworks/SoftwareUpdate.framework/Versions/A/SoftwareUpdate
    0x7fffd4dfd000 -     0x7fffd4e09ff7  com.apple.SpeechRecognitionCore (3.3.2 - 3.3.2) <684BD1EA-8268-331C-A5A9-080EB375C658> /System/Library/PrivateFrameworks/SpeechRecognitionCore.framework/Versions/A/SpeechRecognitionCore
    0x7fffd50bf000 -     0x7fffd50ceffb  com.apple.StorageManagement (1.0 - 1) <43D966BE-C053-3D1A-9FD6-63737A88C323> /System/Library/PrivateFrameworks/StorageManagement.framework/Versions/A/StorageManagement
    0x7fffd50cf000 -     0x7fffd513bffb  com.apple.StoreFoundation (1.0 - 583.17) <40E1B3D5-E30F-34E3-87BC-88008ADB714E> /System/Library/PrivateFrameworks/StoreFoundation.framework/Versions/A/StoreFoundation
    0x7fffd54f5000 -     0x7fffd5569fdf  com.apple.Symbolication (62048.1) <1A30ED19-7532-3F46-9DD3-9879A973D0CF> /System/Library/PrivateFrameworks/Symbolication.framework/Versions/A/Symbolication
    0x7fffd5789000 -     0x7fffd57b5ff3  com.apple.framework.SystemAdministration (1.0 - 1.0) <CD5B74B1-01ED-369E-AB11-1DA59F2C2A24> /System/Library/PrivateFrameworks/SystemAdministration.framework/Versions/A/SystemAdministration
    0x7fffd59a8000 -     0x7fffd59aeff7  com.apple.TCC (1.0 - 1) <911B534B-4AC7-34E4-935E-E42ECD008CBC> /System/Library/PrivateFrameworks/TCC.framework/Versions/A/TCC
    0x7fffd59af000 -     0x7fffd5a39ffb  com.apple.TelephonyUtilities (1.0 - 1.0) <A455F2EB-85C3-3601-A899-2F7544E5DCC6> /System/Library/PrivateFrameworks/TelephonyUtilities.framework/Versions/A/TelephonyUtilities
    0x7fffd5a3a000 -     0x7fffd5b00ff7  com.apple.TextureIO (2.8 - 2.8) <3D61E533-4156-3B21-B7ED-CB823E680DFC> /System/Library/PrivateFrameworks/TextureIO.framework/Versions/A/TextureIO
    0x7fffd5b49000 -     0x7fffd5b5eff3  com.apple.ToneKit (1.0 - 1) <B709293D-0A79-398A-8AA9-50F6340C227C> /System/Library/PrivateFrameworks/ToneKit.framework/Versions/A/ToneKit
    0x7fffd5b5f000 -     0x7fffd5b6dffb  com.apple.ToneLibrary (1.0 - 1) <F2ED5DFC-5F11-3012-BCD7-17753413141F> /System/Library/PrivateFrameworks/ToneLibrary.framework/Versions/A/ToneLibrary
    0x7fffd5b74000 -     0x7fffd5b75fff  com.apple.TrustEvaluationAgent (2.0 - 28.50.1) <EBE65DD5-1732-3747-8C6C-7BECEBF089A4> /System/Library/PrivateFrameworks/TrustEvaluationAgent.framework/Versions/A/TrustEvaluationAgent
    0x7fffd5b76000 -     0x7fffd5d06ff3  com.apple.UIFoundation (1.0 - 490.7) <2A3063FE-1790-3510-8A0E-AEC581D42B7E> /System/Library/PrivateFrameworks/UIFoundation.framework/Versions/A/UIFoundation
    0x7fffd5d07000 -     0x7fffd5d0bfff  com.apple.Uninstall (1.0.1 - 211) <52821911-2390-3AA3-B270-3916A9FC9A1C> /System/Library/PrivateFrameworks/Uninstall.framework/Versions/A/Uninstall
    0x7fffd5d18000 -     0x7fffd5d7fff7  com.apple.UserActivity (63.25 - 63.25) <0B13EFA3-2005-331B-91F4-AB6C95463697> /System/Library/PrivateFrameworks/UserActivity.framework/Versions/A/UserActivity
    0x7fffd5d80000 -     0x7fffd6414ff3  com.apple.VectorKit (1.0 - 1230.24.9.30.26) <0BF80D55-4E82-3E64-8465-5F22E4BC68E2> /System/Library/PrivateFrameworks/VectorKit.framework/Versions/A/VectorKit
    0x7fffd6772000 -     0x7fffd67d4fff  com.apple.VideoSubscriberAccount.VideoSubscriberAccountFramework (1.0 - 110.45) <1C9C41CE-B7AF-3F82-8EA3-D42BB1E8A46A> /System/Library/PrivateFrameworks/VideoSubscriberAccount.framework/Versions/A/VideoSubscriberAccount
    0x7fffd67d5000 -     0x7fffd6895fff  com.apple.ViewBridge (283 - 283) <25A635B3-C87C-3D3A-ADF3-539713FA1048> /System/Library/PrivateFrameworks/ViewBridge.framework/Versions/A/ViewBridge
    0x7fffd68e5000 -     0x7fffd6978fff  com.apple.WebInspector (12603 - 12603.2.4) <7065B454-FFD2-355D-B0EA-12303C3CE3FD> /System/Library/PrivateFrameworks/WebInspector.framework/Versions/A/WebInspector
    0x7fffd6a1c000 -     0x7fffd6ba0ff7  libAWDSupportFramework.dylib (600.46) <41F6C770-FB01-3948-84E0-2763C4F15EFB> /System/Library/PrivateFrameworks/WirelessDiagnostics.framework/Versions/A/Libraries/libAWDSupportFramework.dylib
    0x7fffd6ba1000 -     0x7fffd6c10fff  libprotobuf.dylib (600.46) <6D75ECC9-1470-3076-8ADF-BAD0857FA001> /System/Library/PrivateFrameworks/WirelessDiagnostics.framework/Versions/A/Libraries/libprotobuf.dylib
    0x7fffd6c11000 -     0x7fffd6c50fff  com.apple.awd (1.0 - 869) <D7EA38DE-E876-3B1C-B667-A218D4215DD6> /System/Library/PrivateFrameworks/WirelessDiagnostics.framework/Versions/A/WirelessDiagnostics
    0x7fffd6ce0000 -     0x7fffd6ce6fff  com.apple.XPCService (2.0 - 1) <4B28B225-2105-33F4-9ED0-F04288FF4FB1> /System/Library/PrivateFrameworks/XPCService.framework/Versions/A/XPCService
    0x7fffd6cfc000 -     0x7fffd6d32fff  com.apple.iCalendar (7.0 - 262.3) <74E2011A-C84A-3CC6-8C3B-C9DC5B4D9CBD> /System/Library/PrivateFrameworks/iCalendar.framework/Versions/A/iCalendar
    0x7fffd6db7000 -     0x7fffd6db9ffb  com.apple.loginsupport (1.0 - 1) <F3140B97-12C3-35A7-9D3D-43DA2D13C113> /System/Library/PrivateFrameworks/login.framework/Versions/A/Frameworks/loginsupport.framework/Versions/A/loginsupport
    0x7fffd6dba000 -     0x7fffd6dd2ffb  com.apple.login (3.0 - 3.0) <97E8B7E1-6CA9-3486-A8D6-5BDCE01A68C2> /System/Library/PrivateFrameworks/login.framework/Versions/A/login
    0x7fffd6de5000 -     0x7fffd6e0cff7  com.apple.contacts.vCard (1.0 - 2250.10) <19E37E68-E945-3534-8658-87AA411D0AD4> /System/Library/PrivateFrameworks/vCard.framework/Versions/A/vCard
    0x7fffd6e0e000 -     0x7fffd6e29ff7  libCRFSuite.dylib (34) <F78B7F5F-0B4F-35C6-AA2F-84EE9CB22137> /usr/lib/libCRFSuite.dylib
    0x7fffd6e2a000 -     0x7fffd6e35fff  libChineseTokenizer.dylib (21) <0886E908-A825-36AF-B94B-2361FD8BC2A1> /usr/lib/libChineseTokenizer.dylib
    0x7fffd6e36000 -     0x7fffd6ec6ff7  libCoreStorage.dylib (540.30.1) <85C0A366-F901-36E3-854A-FE8A14A04A72> /usr/lib/libCoreStorage.dylib
    0x7fffd6ec7000 -     0x7fffd6ec8ff3  libDiagnosticMessagesClient.dylib (102) <84A04D24-0E60-3810-A8C0-90A65E2DF61A> /usr/lib/libDiagnosticMessagesClient.dylib
    0x7fffd6ec9000 -     0x7fffd70dcfff  libFosl_dynamic.dylib (16.39) <E22A4243-D148-3C74-BA15-2D906A3D1F9E> /usr/lib/libFosl_dynamic.dylib
    0x7fffd70dd000 -     0x7fffd70eefff  libIASAuthReboot.dylib (1114) <4D256BE9-4757-3F18-8B9A-C3AE42DB7395> /usr/lib/libIASAuthReboot.dylib
    0x7fffd70f8000 -     0x7fffd70fffff  libMatch.1.dylib (27) <70D4BD2A-9383-37F2-B0D6-9B592D236601> /usr/lib/libMatch.1.dylib
    0x7fffd7100000 -     0x7fffd7100fff  libOpenScriptingUtil.dylib (172) <90743888-C1E8-34E3-924E-1A754B2B63B9> /usr/lib/libOpenScriptingUtil.dylib
    0x7fffd7101000 -     0x7fffd7105ffb  libScreenReader.dylib (477.40.6) <CBE6420C-EF60-3ACD-A0B6-7CBE936BA3B8> /usr/lib/libScreenReader.dylib
    0x7fffd7106000 -     0x7fffd7107ffb  libSystem.B.dylib (1238.60.2) <FC9E9F13-3B18-305C-BE0A-97C7843652B0> /usr/lib/libSystem.B.dylib
    0x7fffd7108000 -     0x7fffd716ffff  libTelephonyUtilDynamic.dylib (2024) <276571ED-5A8B-3FA4-AC04-4FA8A059CC82> /usr/lib/libTelephonyUtilDynamic.dylib
    0x7fffd7173000 -     0x7fffd719eff3  libarchive.2.dylib (41.50.2) <B4F507BC-B24E-3BE7-B658-94D798E2CD81> /usr/lib/libarchive.2.dylib
    0x7fffd719f000 -     0x7fffd721bfc7  libate.dylib (1.12.13) <D0767875-D02E-3377-84D8-5F174C27BEA9> /usr/lib/libate.dylib
    0x7fffd721f000 -     0x7fffd721fff3  libauto.dylib (187) <34388D0B-C539-3C1B-9408-2BC152162E43> /usr/lib/libauto.dylib
    0x7fffd7220000 -     0x7fffd7230ff3  libbsm.0.dylib (34) <20084796-B04D-3B35-A003-EA11459557A9> /usr/lib/libbsm.0.dylib
    0x7fffd7231000 -     0x7fffd723fff7  libbz2.1.0.dylib (38) <ADFA329A-DCE7-356D-8F09-A3168DFC6610> /usr/lib/libbz2.1.0.dylib
    0x7fffd7240000 -     0x7fffd7296ff7  libc++.1.dylib (307.5) <0B43BB5D-E6EB-3464-8DE9-B41AC8ED9D1C> /usr/lib/libc++.1.dylib
    0x7fffd7297000 -     0x7fffd72c1fff  libc++abi.dylib (307.3) <30199352-88BF-30BD-8CFF-2A4FBE247523> /usr/lib/libc++abi.dylib
    0x7fffd72c2000 -     0x7fffd72d2ffb  libcmph.dylib (6) <2B5D405E-2D0B-3320-ABD6-622934C86ABE> /usr/lib/libcmph.dylib
    0x7fffd72d3000 -     0x7fffd72e9fcf  libcompression.dylib (39) <F2726F95-F54E-3B21-BCB5-F7151DEFDC2F> /usr/lib/libcompression.dylib
    0x7fffd72ea000 -     0x7fffd72eaff7  libcoretls.dylib (121.50.4) <64B1001E-10F6-3542-A3B2-C4B49F51817F> /usr/lib/libcoretls.dylib
    0x7fffd72eb000 -     0x7fffd72ecff3  libcoretls_cfhelpers.dylib (121.50.4) <1A10303E-5EB0-3C7C-9165-021FCDFD934D> /usr/lib/libcoretls_cfhelpers.dylib
    0x7fffd73a6000 -     0x7fffd748bff7  libcrypto.0.9.8.dylib (64.50.6) <D34E16A7-990A-37A9-933A-DFAA46554EAA> /usr/lib/libcrypto.0.9.8.dylib
    0x7fffd761d000 -     0x7fffd7628fff  libcsfde.dylib (540.30.1) <0C2B183B-16D9-3D5F-962D-0A09C7063211> /usr/lib/libcsfde.dylib
    0x7fffd7629000 -     0x7fffd767cff7  libcups.2.dylib (450) <9950BFCB-7882-33C9-9ECF-CE66773C5657> /usr/lib/libcups.2.dylib
    0x7fffd767d000 -     0x7fffd76cdffb  libcurl.4.dylib (95.50.2) <2E3E82EE-3710-3340-8B07-A285BDA385B1> /usr/lib/libcurl.4.dylib
    0x7fffd76ce000 -     0x7fffd76d5ff3  libdscsym.dylib (148.3) <63492BDA-33A8-31DE-90E8-A3D44F07EB9C> /usr/lib/libdscsym.dylib
    0x7fffd76f7000 -     0x7fffd76f7fff  libenergytrace.dylib (15) <A1B040A2-7977-3097-9ADF-34FF181EB970> /usr/lib/libenergytrace.dylib
    0x7fffd7707000 -     0x7fffd770cff7  libheimdal-asn1.dylib (498.50.8) <A40E3196-235E-34CE-AD9A-8D1AFC5DE004> /usr/lib/libheimdal-asn1.dylib
    0x7fffd770d000 -     0x7fffd77ffff7  libiconv.2.dylib (50) <42125B35-81D7-3FC4-9475-A26DBE10884D> /usr/lib/libiconv.2.dylib
    0x7fffd7800000 -     0x7fffd7a25ffb  libicucore.A.dylib (57165.0.1) <2931B842-2946-3576-AD1D-1CDA22FA1388> /usr/lib/libicucore.A.dylib
    0x7fffd7a2b000 -     0x7fffd7a2cfff  liblangid.dylib (126) <2085E7A7-9A34-3735-87F4-F174EF8EABF0> /usr/lib/liblangid.dylib
    0x7fffd7a2d000 -     0x7fffd7a46ffb  liblzma.5.dylib (10) <44BD0279-99DD-36B5-8A6E-C11432E2098D> /usr/lib/liblzma.5.dylib
    0x7fffd7a47000 -     0x7fffd7a5dff7  libmarisa.dylib (5) <9030D214-5D0F-30CB-AC03-902C63909362> /usr/lib/libmarisa.dylib
    0x7fffd7a5e000 -     0x7fffd7d06ff7  libmecabra.dylib (744.8) <D429FCC9-42A4-38B3-8784-44024BC859EF> /usr/lib/libmecabra.dylib
    0x7fffd7d39000 -     0x7fffd7db3ff3  libnetwork.dylib (856.60.1) <191E99F5-4723-3180-8013-02AF2F9AE4B8> /usr/lib/libnetwork.dylib
    0x7fffd7db4000 -     0x7fffd8186047  libobjc.A.dylib (709) <DC77AA6E-A4E4-326D-8D7F-82D63AA88F99> /usr/lib/libobjc.A.dylib
    0x7fffd8187000 -     0x7fffd8188fff  libodfde.dylib (23.50.1) <744F1E66-11EB-3A4D-8944-722F39C55278> /usr/lib/libodfde.dylib
    0x7fffd8189000 -     0x7fffd818dfff  libpam.2.dylib (21.30.1) <71EB0D88-DE84-3C8D-A2C5-58AA282BC5BC> /usr/lib/libpam.2.dylib
    0x7fffd818e000 -     0x7fffd81bffff  libpcap.A.dylib (67.60.1) <F6BC6ED6-AEE4-3520-B248-0C342636E2B0> /usr/lib/libpcap.A.dylib
    0x7fffd81da000 -     0x7fffd81dbff3  libquit.dylib (231.3) <CFB08111-84D7-3B33-BE90-CB2EB295597C> /usr/lib/libquit.dylib
    0x7fffd81dc000 -     0x7fffd81f8ffb  libresolv.9.dylib (64) <A244AE4C-00B0-396C-98FF-97FE4DB3DA30> /usr/lib/libresolv.9.dylib
    0x7fffd81f9000 -     0x7fffd8232fff  libsandbox.1.dylib (592.60.1) <B3A1C3BD-084C-389B-9AFD-4BCFDBE9B5B6> /usr/lib/libsandbox.1.dylib
    0x7fffd8233000 -     0x7fffd8245ffb  libsasl2.2.dylib (209) <32107C59-22C6-3049-B86E-9C2F85FF549B> /usr/lib/libsasl2.2.dylib
    0x7fffd8246000 -     0x7fffd8247ff3  libspindump.dylib (231.3) <C7CEEB64-06F4-3ACA-AAC1-30ECA909501A> /usr/lib/libspindump.dylib
    0x7fffd8248000 -     0x7fffd8395ff7  libsqlite3.dylib (254.7) <07CD6DE3-394D-3C6A-A4B4-4CAB1054A041> /usr/lib/libsqlite3.dylib
    0x7fffd83b8000 -     0x7fffd83f0ff3  libssl.0.9.8.dylib (64.50.6) <9A9C9D9A-7948-3412-ABE4-01FCC4A72CD2> /usr/lib/libssl.0.9.8.dylib
    0x7fffd83f1000 -     0x7fffd8441fff  libstdc++.6.dylib (104.1) <A980E08C-A511-3D19-9881-1D79B7CFF2BA> /usr/lib/libstdc++.6.dylib
    0x7fffd8442000 -     0x7fffd8443ff7  libsysmon.dylib (92.50.5) <D6AA1F2A-7675-3003-BAB3-7BD2BB027376> /usr/lib/libsysmon.dylib
    0x7fffd8453000 -     0x7fffd8485fff  libtidy.A.dylib (15.18.1) <513B2676-8EE0-3A4C-845C-CACDD25280CA> /usr/lib/libtidy.A.dylib
    0x7fffd8486000 -     0x7fffd8489ff7  libutil.dylib (47.30.1) <88CC63B3-0EDF-306E-9AB5-D87EBE0F3F16> /usr/lib/libutil.dylib
    0x7fffd848a000 -     0x7fffd8497fff  libxar.1.dylib (357) <69547C64-E811-326F-BBED-490C6361BDCB> /usr/lib/libxar.1.dylib
    0x7fffd8498000 -     0x7fffd8587ffb  libxml2.2.dylib (30.16) <D2A6861B-D9FA-3BFC-B664-830C3FCE6065> /usr/lib/libxml2.2.dylib
    0x7fffd8588000 -     0x7fffd85b1fff  libxslt.1.dylib (15.9) <00735AD5-B62D-3E83-86AC-5533E4E2B102> /usr/lib/libxslt.1.dylib
    0x7fffd85b2000 -     0x7fffd85c3ff3  libz.1.dylib (67) <46E3FFA2-4328-327A-8D34-A03E20BFFB8E> /usr/lib/libz.1.dylib
    0x7fffd85d2000 -     0x7fffd85d6ff7  libcache.dylib (79) <093A4DAB-8385-3D47-A350-E20CB7CCF7BF> /usr/lib/system/libcache.dylib
    0x7fffd85d7000 -     0x7fffd85e1fff  libcommonCrypto.dylib (60092.50.5) <8A64D1B0-C70E-385C-92F0-E669079FDA90> /usr/lib/system/libcommonCrypto.dylib
    0x7fffd85e2000 -     0x7fffd85e9fff  libcompiler_rt.dylib (62) <55D47421-772A-32AB-B529-1A46C2F43B4D> /usr/lib/system/libcompiler_rt.dylib
    0x7fffd85ea000 -     0x7fffd85f2fff  libcopyfile.dylib (138) <819BEA3C-DF11-3E3D-A1A1-5A51C5BF1961> /usr/lib/system/libcopyfile.dylib
    0x7fffd85f3000 -     0x7fffd8676fdf  libcorecrypto.dylib (442.50.19) <65D7165E-2E71-335D-A2D6-33F78E2DF0C1> /usr/lib/system/libcorecrypto.dylib
    0x7fffd8677000 -     0x7fffd86a8fff  libdispatch.dylib (703.50.37) <6582BAD6-ED27-3B30-B620-90B1C5A4AE3C> /usr/lib/system/libdispatch.dylib
    0x7fffd86a9000 -     0x7fffd86aeffb  libdyld.dylib (433.5) <EC3D88D2-3D40-3274-8E26-362C2D7352C8> /usr/lib/system/libdyld.dylib
    0x7fffd86af000 -     0x7fffd86afffb  libkeymgr.dylib (28) <7AA011A9-DC21-3488-BF73-3B5B14D1FDD6> /usr/lib/system/libkeymgr.dylib
    0x7fffd86b0000 -     0x7fffd86bcffb  libkxld.dylib (3789.60.24) <5DFCDC05-6CBC-35A6-8B92-DF6803492E12> /usr/lib/system/libkxld.dylib
    0x7fffd86bd000 -     0x7fffd86bdfff  liblaunch.dylib (972.60.2) <D3306CFF-58AA-3C90-B06C-B70E80E60C5B> /usr/lib/system/liblaunch.dylib
    0x7fffd86be000 -     0x7fffd86c3ff3  libmacho.dylib (898) <17D5D855-F6C3-3B04-B680-E9BF02EF8AED> /usr/lib/system/libmacho.dylib
    0x7fffd86c4000 -     0x7fffd86c6ff3  libquarantine.dylib (85.50.1) <12448CC2-378E-35F3-BE33-9DC395A5B970> /usr/lib/system/libquarantine.dylib
    0x7fffd86c7000 -     0x7fffd86c8ffb  libremovefile.dylib (45) <38D4CB9C-10CD-30D3-8B7B-A515EC75FE85> /usr/lib/system/libremovefile.dylib
    0x7fffd86c9000 -     0x7fffd86e1ff7  libsystem_asl.dylib (349.50.5) <096E4228-3B7C-30A6-8B13-EC909A64499A> /usr/lib/system/libsystem_asl.dylib
    0x7fffd86e2000 -     0x7fffd86e2ff7  libsystem_blocks.dylib (67) <10DC5404-73AB-35B3-A277-A8AFECB476EB> /usr/lib/system/libsystem_blocks.dylib
    0x7fffd86e3000 -     0x7fffd8770fef  libsystem_c.dylib (1158.50.2) <E5AE5244-7D0C-36AC-8BB6-C7AE7EA52A4B> /usr/lib/system/libsystem_c.dylib
    0x7fffd8771000 -     0x7fffd8774ffb  libsystem_configuration.dylib (888.60.2) <BECC01A2-CA8D-31E6-BCDF-D452965FA976> /usr/lib/system/libsystem_configuration.dylib
    0x7fffd8775000 -     0x7fffd8778fff  libsystem_coreservices.dylib (41.4) <7D26DE79-B424-3450-85E1-F7FAB32714AB> /usr/lib/system/libsystem_coreservices.dylib
    0x7fffd8779000 -     0x7fffd8791fff  libsystem_coretls.dylib (121.50.4) <EC6FCF07-DCFB-3A03-9CC9-6DD3709974C6> /usr/lib/system/libsystem_coretls.dylib
    0x7fffd8792000 -     0x7fffd8798fff  libsystem_dnssd.dylib (765.50.9) <CC960215-0B1B-3822-A13A-3DDE96FA796F> /usr/lib/system/libsystem_dnssd.dylib
    0x7fffd8799000 -     0x7fffd87c2ff7  libsystem_info.dylib (503.50.4) <611DB84C-BF70-3F92-8702-B9F28A900920> /usr/lib/system/libsystem_info.dylib
    0x7fffd87c3000 -     0x7fffd87e5ff7  libsystem_kernel.dylib (3789.60.24) <6E9E485F-91F6-36B7-A125-AE91DC978BCC> /usr/lib/system/libsystem_kernel.dylib
    0x7fffd87e6000 -     0x7fffd882dfe7  libsystem_m.dylib (3121.6) <86D499B5-BBDC-3D3B-8A4E-97AE8E6672A4> /usr/lib/system/libsystem_m.dylib
    0x7fffd882e000 -     0x7fffd884cff7  libsystem_malloc.dylib (116.50.8) <A3D15F17-99A6-3367-8C7E-4280E8619C95> /usr/lib/system/libsystem_malloc.dylib
    0x7fffd884d000 -     0x7fffd88a6ffb  libsystem_network.dylib (856.60.1) <369D0221-56CA-3C3E-9EDE-94B41CAE77B7> /usr/lib/system/libsystem_network.dylib
    0x7fffd88a7000 -     0x7fffd88b0ff3  libsystem_networkextension.dylib (563.60.2) <B021F2B3-8A75-3633-ABB0-FC012B8E9B0C> /usr/lib/system/libsystem_networkextension.dylib
    0x7fffd88b1000 -     0x7fffd88baff3  libsystem_notify.dylib (165.20.1) <B8160190-A069-3B3A-BDF6-2AA408221FAE> /usr/lib/system/libsystem_notify.dylib
    0x7fffd88bb000 -     0x7fffd88c3fe7  libsystem_platform.dylib (126.50.8) <897462FD-B318-321B-A554-E61982630F7E> /usr/lib/system/libsystem_platform.dylib
    0x7fffd88c4000 -     0x7fffd88ceff7  libsystem_pthread.dylib (218.60.3) <B8FB5E20-3295-39E2-B5EB-B464D1D4B104> /usr/lib/system/libsystem_pthread.dylib
    0x7fffd88cf000 -     0x7fffd88d2ff7  libsystem_sandbox.dylib (592.60.1) <DC780631-BD23-36B1-9376-668619E18D25> /usr/lib/system/libsystem_sandbox.dylib
    0x7fffd88d3000 -     0x7fffd88d4ff3  libsystem_secinit.dylib (24.50.4) <F78B847B-3565-3E4B-98A6-F7AD40392E2D> /usr/lib/system/libsystem_secinit.dylib
    0x7fffd88d5000 -     0x7fffd88dcffb  libsystem_symptoms.dylib (532.50.47) <3390E07C-C1CE-348F-ADBD-2C5440B45EAA> /usr/lib/system/libsystem_symptoms.dylib
    0x7fffd88dd000 -     0x7fffd88f0ff7  libsystem_trace.dylib (518.60.2) <6B145B10-5874-3E89-90CD-D370DB475BA1> /usr/lib/system/libsystem_trace.dylib
    0x7fffd88f1000 -     0x7fffd88f6ffb  libunwind.dylib (35.3) <3D50D8A8-C460-334D-A519-2DA841102C6B> /usr/lib/system/libunwind.dylib
    0x7fffd88f7000 -     0x7fffd8920ff7  libxpc.dylib (972.60.2) <1C9AF716-69DF-359F-85E9-7DFDE362F9A2> /usr/lib/system/libxpc.dylib

External Modification Summary:
  Calls made by other processes targeting this process:
    task_for_pid: 18961
    thread_create: 0
    thread_set_state: 0
  Calls made by this process:
    task_for_pid: 0
    thread_create: 0
    thread_set_state: 0
  Calls made by all processes on this machine:
    task_for_pid: 11983309
    thread_create: 0
    thread_set_state: 0

VM Region Summary:
ReadOnly portion of Libraries: Total=391.6M resident=0K(0%) swapped_out_or_unallocated=391.6M(100%)
Writable regions: Total=1.6G written=0K(0%) resident=0K(0%) swapped_out=0K(0%) unallocated=1.6G(100%)
 
                                  VIRTUAL   REGION 
REGION TYPE                          SIZE    COUNT (non-coalesced) 
===========                       =======  ======= 
Accelerate framework                 768K        7 
Activity Tracing                     256K        2 
CG backing stores                   8692K       11 
CG image                            64.3M      480 
CG raster data                       168K        3 
CoreAnimation                       95.6M      635 
CoreData Object IDs                 4100K        3 
CoreUI image data                   4556K       39 
CoreUI image file                    340K       11 
Foundation                            28K        3 
IOKit                               7940K        2 
Image IO                            6604K      104 
JS JIT generated code              128.0M        5 
JS JIT generated code (reserved)   896.0M        2         reserved VM address space (unallocated)
Kernel Alloc Once                      8K        2 
MALLOC                             333.5M      113 
MALLOC guard page                     48K       10 
Memory Tag 242                        12K        2 
Memory Tag 251                       120K        5 
OpenCL                                16K        3 
SQLite page cache                   6400K       56 
STACK GUARD                         56.1M       19 
Stack                               16.6M       19 
VM_ALLOCATE                          892K       64 
WebKit Malloc                       36.2M       84 
__DATA                              43.5M      409 
__GLSLBUILTINS                      2588K        2 
__IMAGE                              528K        2 
__LINKEDIT                         116.7M       21 
__TEXT                             274.9M      412 
__UNICODE                            556K        2 
mapped file                        112.8M       79 
shared memory                       16.4M       15 
===========                       =======  ======= 
TOTAL                                2.2G     2593 
TOTAL, minus reserved VM space       1.3G     2593 

Model: MacBookPro12,1, BootROM MBP121.0167.B24, 2 processors, Intel Core i7, 3.1 GHz, 16 GB, SMC 2.28f7
Graphics: Intel Iris Graphics 6100, Intel Iris Graphics 6100, Built-In
Memory Module: BANK 0/DIMM0, 8 GB, DDR3, 1867 MHz, 0x02FE, 0x4544464232333241314D412D4A442D460000
Memory Module: BANK 1/DIMM0, 8 GB, DDR3, 1867 MHz, 0x02FE, 0x4544464232333241314D412D4A442D460000
AirPort: spairport_wireless_card_type_airport_extreme (0x14E4, 0x133), Broadcom BCM43xx 1.0 (7.21.171.126.1a2)
Bluetooth: Version 5.0.4f18, 3 services, 18 devices, 1 incoming serial ports
Network Service: Wi-Fi, AirPort, en0
PCI Card: Apple 57762-A0, Ethernet Controller, Thunderbolt@195,0,0
Serial ATA Device: APPLE SSD SM1024G, 1 TB
USB Device: USB 3.0 Bus
USB Device: Bluetooth USB Host Controller
Thunderbolt Bus: MacBook Pro, Apple Inc., 27.1
Thunderbolt Device: Thunderbolt to Gigabit Ethernet Adapter, Apple Inc., 3, 5.5

