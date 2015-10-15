	@echo off
	pushd %~dp0
echo This example Build Script will create WinPE 10 x86 and x64
echo This script will not pause at milestones
pause
	
::	Run MakePE.cmd to load the Defaults and MySettings
	call .\Scripts\MakePE.cmd

::	Now you can make changes to the default Variables
	set DoPause=No

::	You can change the WinPE Version and Architecture
	set WinPEVersion=10
	set PLATFORM=x86
	call .\Scripts\MakePE.cmd
	
::	And change it again
	set WinPEVersion=10
	set PLATFORM=x64
	call .\Scripts\MakePE.cmd
	
::	You can pause at the end
	pause

