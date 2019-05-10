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
* 10th of May 2019, at 9:30am – Duration ~1h30m
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
* Memory cache that is used to reduce the time taken to access a user memory location
* Part of the chip's MMU

##### Multilevel Page Tables
* 2 levels of page tables
* Memory addresses include two page table identifiers and then an offset
  * E.g. `0x11aa1234` = page table entry `11` -> page table entry `aa` -> address at offset `1234`

---

### Page Replacement Algorithms
**When memory is full - what page to evict when we need to load a new one?**
* Ideally minimize the amount of replacements
* To test algo performance:
  * Input: List of memory address references, size of memory, size of pages
  * Output: Ammount of page faults

#### Optimal Algorithm
* **Idea:** The best that can possibly be done, knowing about all future references
* **Algo:** Replace the page used furthest in the future
  * Impractical - can't be done in any real system

#### Not Recently Used
* **Idea:** Use bits to track when pages are used, better to remove a page that hasn't been used recently than one that has been
* **Algo:**
  * R and M bits for all pages initially set to 0 by OS
  * Periodically R bit is cleared
  * When a fault occurs the following order is used to select a page
    * Class 0: not referenced or modified
    * Class 1: not referenced, modified
    * Class 2: referenced, not modified
    * Class 3: referenced and modified

#### First In First Out
* **Idea:** Every page gets a turn for the same amount of faults
* **Algo:**
  * Linked list of pages in the order they come into memory

##### Second Chance FIFO
* **Idea:** FIFO, but also track usage
* **Algo:**
  * If a page isn't referenced recently remove it
  * If it is, it get's another chance by getting moved to the end of the list

#### Clock
* **Idea:** Second chance FIFO requires moving pages around on the list, so instead we using a ring buffer
* **Algo:**
  * If the page is recently used the head of the list moves to the next item, putting the initial page at the end of the list

#### Least Recently Used
* **Idea:** The page that hasn't been used the longest is the safest to remove
* **Algo:**
  * Track the last time a page was used
  * Remove the page used the longest time ago

##### Aging
* N-bit counter for each page
* Periodically shift counter to the right and add 1 to the leftmost bit
* Replace the page with the lowest counter

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
* **Hard links** point to a file
  * If it gets deleted the other references stop working
* **Soft links** point to the address of a file
  * Main owner can control the file

---

### I/O Devices

#### Comunication Mechanisms

#### I/O Ports

#### Memory-mapped I/O

##### Hybrid

#### Software and I/O interaction

##### Programmed I/O
CPU does all the work

##### Interrupt-driven I/O
CPU does the work, but interrupts say when

##### I/O using DMA
DMA does the work, programmed by the CPU, which reacts to interrupts

---

### RAID
* **RAID 0** - Striping
* **RAID 1** - Mirroring
* **RAID 2** - Bit-level striping with Hamming code for error checking
* **RAID 3** - Bit-level striping with parity bit
* **RAID 4** - Striping with parity
* **RAID 5** - Striping with distributed parity
* **RAID 6** - Striping with double distributed parity

---

## Practice problems
> Only second half

* Calculate the size of page tables
* Calculate aging values for LRU given usage at each clock cycle
* Calculate amount of page faults for an algorithm, input string, and page frame count
* Calculate file size given disk block and block pointer sizes, and amount/type of nodes
* Explain the best allocation scheme for a file given a usage pattern
* Explain the best I/O pattern for a device - e.g. for a printer that prints at a certain rate
* Calculate probability of RAID failure

| Course Grade | Minimum Final Grade |
| :-: | :-: |
| 60 | 7.5 |
| 65 | 27.5 |
| 70 | 47.5 |
| 75 | 67.5 |
| 80 | 87.5 |
| 83 | 99.5 |

## TODO:
* Work on page table size calculation
  * And multilevel page tables
* Work on RAID failure calculation
