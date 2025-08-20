# Synchronous-FIFO
This project implements a Verilog-based *Synchronous FIFO (First-In-First-Out)* memory buffer. It supports simultaneous read and write operations on the same clock and prevents data overflow/underflow using status flags. A testbench is included to simulate and verify its behavior.

# 📥 Synchronous FIFO in Verilog

A *FIFO* (First-In-First-Out) is a type of memory buffer where data is read in the same order as it was written.  
This project demonstrates the design of a *synchronous FIFO* using Verilog HDL, where both read and write operations are synchronized with the same clock.

---

## 📌 Description

The FIFO works on the following principle:

- Data is written into the memory when wr_en is asserted and the FIFO is not full.  
- Data is read out when rd_en is asserted and the FIFO is not empty.  
- Two pointers are used:
  - *Write Pointer (wr_ptr)* → Points to the next free location for data.  
  - *Read Pointer (rd_ptr)* → Points to the next data to be read.  
- Status Flags:
  - *Full* → Indicates FIFO cannot accept more data.  
  - *Empty* → Indicates FIFO has no data to read.  

---

## 🧠 Features

- Fully synchronous design (single clock for read & write)  
- Parameterized data width and depth  
- Uses *wr_ptr* and *rd_ptr* for addressing  
- Generates *full* and *empty* status signals  
- Includes testbench for verification  

---

## 📁 Project Structure
```
bash
Synchronous-FIFO-Verilog/
├── synchronous_fifo.v        # Main Verilog module
├── synchronous_fifo_tb.v     # Testbench for simulation
├── Images
│   ├──Schematic.png     # RTL schematic of the FIFO
│   └──Simulation.png        # Simulation waveform output
├── README.md                 # Project documentation
└── LICENSE                   # MIT License
```
---

## 📦 Module Overview

### 🔧 synchronous_fifo.v

This is the main FIFO design file. It consists of:

- *Inputs*  
  - clk → Clock signal (synchronizes read and write operations)  
  - rst → Active high reset (clears FIFO)  
  - wr_en → Write enable  
  - rd_en → Read enable  
  - din [DATA_WIDTH-1:0] → Data input  

- *Outputs*  
  - dout [DATA_WIDTH-1:0] → Data output  
  - full → High when FIFO is full  
  - empty → High when FIFO is empty  

- *Internal Signals*  
  - wr_ptr → Write pointer  
  - rd_ptr → Read pointer  
  - count → Keeps track of number of stored elements  

---

### 📐 synchronous_fifo_tb.v

The testbench validates the FIFO by:

- Initializing signals (clk, rst, wr_en, rd_en)  
- Writing multiple values into the FIFO  
- Reading values from the FIFO  
- Checking correct assertion of *full* and *empty* flags  
- Displaying results in simulation waveform  

---

## ▶ Simulation

### 📷 Simulation Waveform
The waveform verifies correct FIFO operation:
- Data written and read on same clock  
- Full and Empty flags asserted at correct times  
- Order of data preserved (FIFO principle)  

<img width="1480" height="579" alt="Simulation" src="https://github.com/user-attachments/assets/165445a8-1778-49c7-9ee8-79d2cb335380" />


### 📷 RTL Schematic
The synthesized RTL schematic shows:
- Memory array for data storage  
- Read & Write pointers  
- Full/Empty flag logic  

<img width="1466" height="666" alt="Schematics" src="https://github.com/user-attachments/assets/3916e458-a3a4-4ee5-8721-090911fed635" />


## 💻 Requirements

- *Vivado / ModelSim / Any Verilog simulator*  
- Basic understanding of digital design & FIFO memory  
- Git installed (to clone and manage repo)  

---

---

## 📝 License  

This project is licensed under the **MIT License**.  

---

## 👩‍💻 Author  

**Isha Rani** 

---
