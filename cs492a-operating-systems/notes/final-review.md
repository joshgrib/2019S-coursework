# Final Review

## Format

* 5 questions (no problems!)
  * First half of the material (up to spring break)
    * No lab questions, only material from the book and non Linux slides
  * ~25% of the grade
* 6 problems and questions
  * Second half of the material (after spring break)
    * No lab questions, only material from the book and non Linux slides
  * ~75% of the grade
* 10th of May 2019, at 9:30am – Duration 1h30m
  *  Section A in P120

## First Half

---

### Operating Systems

#### Structure
* Above OS
  * Applications
  * Compiler and runtime libs
* Operating system
  * User interface
  * Core runtime libs
  * Kernel
* Below OS
  * Hypervisor/VM monitor
  * Hardware

#### Types
* Monolithic kernel - one single exe
* Microkernel - many exes that call each other
* Hybrid - some modules combined with other seperate

#### Virtual Machines/Hypervisor
* **Not** operating systems
  * They interface with hardware and provide a hardware interface
  * They run OSes on top of them

---

### Address Space/Memory Layout
* Stack - 0xffffffff
  * Stack pointer
* Empty space for stack and heap to grow
* Heap
* BSS - uninitialized data
* Data - initialized
* Code - text segment - 0x00000000
  * Program counter

---

## Second Half

---

### Address Space (Memory Abstraction)

#### Motivation
Problems with programs on physical memory
* Protection
* Relocation
* Fitting multiple programs - swapping
* Memory fragmentation - expensive to fix
* App larger than memory - overlay manager is complicated to manage

#### Overview
* Abstract physical memory space from the program's address space
* Each process gets a set of memory addresses independent from the rest
  * This **virtual address** is used inside the process, and is translated into a physical address
* Virtual address is managed in chunks of addresses called **pages**
  * Not all need to be loaded for a program to run, they can be loaded as they are needed
  * The units in physical memory are called **page frames**
  * The **memory management unit (MMU)** maps pages to page frames

> **Example:**
> With a 4kB page size, 64kB virtual address space, and 32kB physical memory
> There would be 16 virtual pages and 8 page frames

#### Paging - Address Translation
* Virtual addresses are composed of a virtual page number and an offset
  * The virtual page # is used to find a page frame # in the page table, which is they used to find the page frame in physical memory and find the value at the offset

##### Page Faults
* When an address is needed from a page that isn't loaded, it needs to get loaded
* If there's not an open spot then at least one page also needs to get removed

##### Translation Lookaside Buffer

##### Multilevel Page Tables

---

### Page Replacement Algorithms

#### Optimal Algorithm

#### Not Recently Used

#### First In First Out

##### Second Chance FIFO

#### Clock

#### Least Recently Used

#### Aging

---

### File System

#### File as an abstraction

#### Disk and File System Layouts

#### Addressing/Allocation

##### Contiguous ALlocation

##### Linked List Allocation

###### With Table

##### Indexed Allocation

###### Indirection
* **i-node**

#### Hard and Soft Links

---

### I/O Devices

#### Comunication Mechanisms

#### I/O Ports

#### Memory-mapped I/O

##### Hybrid

#### Software and I/O interaction

##### Programmed I/O

##### Interrupt-driven I/O

##### I/O using DMA

---

### RAID

---

## Practice problems
> Only second half

