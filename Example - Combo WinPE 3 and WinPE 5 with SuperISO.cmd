	@echo off
	pushd %~dp0
echo This example Build Script will create WinPE 3 and WinPE 5 and combine them in a SuperISO
echo This script will not pause at milestones
pause
	
::	Run MakePE.cmd to load the Defaults and MySettings
	call .\Scripts\MakePE.cmd

::	Now you can make changes to the default Variables
	set DoPause=No

::	Rebuild BasePE instead of using the BasePE.wim
	rem set RebuildBasePE=Yes

::	Build a WinPE 3 x86
	set WinPEVersion=3
	set PLATFORM=x86
	call .\Scripts\MakePE.cmd

::	Followed by a WinPE 3 x64
	set WinPEVersion=3
	set PLATFORM=x64
	call .\Scripts\MakePE.cmd
	
::	Jumping next to WinPE 5 x86
	set WinPEVersion=5
	set PLATFORM=x86
	call .\Scripts\MakePE.cmd
	
::	And ending with WinPE 5 x64
	set WinPEVersion=5
	set PLATFORM=x64
	call .\Scripts\MakePE.cmd
	
::	Set the default WinPE for BIOS
	set defaultbios={aaaaaaaa-0532-aaaa-aaaa-aaaaaaaaaaaa}
	
::	Set the default WinPE for UEFI
	set defaultuefi={aaaaaaaa-0564-aaaa-aaaa-aaaaaaaaaaaa}
	
::	Create a SuperISO
	call .\Scripts\SuperISO.cmd
	
::	You can pause at the end
	pause

