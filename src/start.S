@This is the startup code for the Cortex-M3 core.

.syntax unified
.cpu cortex-m3
.thumb

.extern main

@The initial value for the MSP
.word 0x20001000
.word main

.global _start
_start:
	bl main;
	b . ; @forever stuck in this point
