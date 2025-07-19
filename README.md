
## 🚀 APB-Based GPIO Controller with UVM Verification

This repository contains the **SystemVerilog RTL**, **UVM-based verification environment**, and documentation for a **General-Purpose Input/Output (GPIO) Controller** using an **APB (Advanced Peripheral Bus) interface**.

Designed for **educational, research, or SoC integration** purposes, this project demonstrates both hardware design and functional verification best practices using **UVM, RAL model, functional coverage, and assertions**.

---

### 📂 Repository Contents

* `rtl/` – SystemVerilog RTL for GPIO + APB interface
* `uvm_tb/` – UVM testbench with:

  * APB Agent (Active)
  * GPIO IO Agent (Passive)
  * AUX Agent (Interrupt support)
* `pkg/gpio_pkg.sv` – Package with register offsets, parameters, and macros
* `docs/` – Block diagrams, protocol descriptions, and presentation
* `coverage/` – Functional coverage reports and assertion results

---

### 📌 Key Features

* 🔁 **Bidirectional GPIO** support with tri-state logic
* 🛠️ **APB3-compliant** slave interface
* 📊 **UVM testbench** with RAL model, scoreboarding, and monitors
* 🔎 **Functional coverage** for GPIO ops, protocol, and interrupts
* 🧠 **Assertions** to catch illegal accesses and timing issues
* 🧰 **Register access** via configurable memory-mapped interface:

  * `GPIO_DIR` – Direction control (input/output)
  * `GPIO_DATA_OUT` – Write to GPIO pins
  * `GPIO_DATA_IN` – Read GPIO input states
  * `GPIO_INTR_EN` – Enable interrupts per pin
  * `GPIO_INTR_STATUS` – Status of interrupt events

---

### 🧪 Verification Plan

* ✅ RAL model used for mirrored register checking
* ✅ Scoreboard compares DUT vs expected results
* ✅ Cross-coverage between direction, data, and interrupts
* ✅ Assertions validate protocol phases (`PSEL`, `PENABLE`, `PREADY`)
* ✅ Test scenarios:

  * Direction configuration
  * GPIO read/write
  * Interrupt triggering and clearing
  * Edge case tests (reset, illegal access)

---

### 📈 Results

* ✅ Achieved **100% functional and code coverage** in QuestaSim
* ✅ Detected and fixed signal timing mismatches (e.g., `PSEL`/`PENABLE` sync)
* ✅ Modular and reusable UVM components across designs

---

### 🎓 Takeaways & Challenges

* Hands-on experience with:

  * APB protocol design
  * UVM agent structuring
  * RAL and functional coverage
  * Debugging scoreboard mismatches
* Learned to build scalable, protocol-compliant testbenches


