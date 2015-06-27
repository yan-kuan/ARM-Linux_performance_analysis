Prerequisites
============================
Before using this tools, we should set up Beaglebone Black(BBB) Environment first.

And Beaglebone Black needs Network environment.

+ [Building for BeagleBone](http://elinux.org/Building_for_BeagleBone)

+ [Building BBB Kernel](http://elinux.org/Building_BBB_Kernel)

+ Python

	$ opkg install python

+ Gnuplot
	
	+ Toolchain
	
		$ opkg install gcc

		And you can use `arm-angstrom-linux-gnueabi-gcc` on BBB

	+ Gnuplot Source Code
	
		[gnuplot ver. 4.4.0](http://sourceforge.net/projects/gnuplot/?source=typ_redirect)

	+ Compile Gnuplot on BBB
	
		Change path to Gnuplot directory.

		./configure CC=arm-angstrom-linux-gnueabi-gcc

		make
		
		make install
		
	
		
		
	
+ lmbench

 
+ Network file system or SSH

You can use NFS or SSH to comunicate with Beaglebone black

IO-bound test environment
=========================

Please go to the following link to download the dblp.xml.

This file is used to test the IO-bound process about the context switch's timeslices.

http://dblp.uni-trier.de/xml/

Please put the file in the AUTO_TEST/IO-bound/ directory.


Building and Verification
=========================

	

Steps
=====



