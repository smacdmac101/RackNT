# Charter and system design

Build an open-source operating system on ReactOS that pairs a small resource footprint and local administration with the stability expected from a server OS and a growing set of Windows application capabilities. Measure each compatibility claim against exact application versions and tasks. Preserve security servicing and avoid mandatory cloud accounts, ads, consumer bundles, mandatory telemetry and forced feature upgrades.

| Requirement | Target | Acceptance evidence |
|---|---|---|
| R1 | Native x64, then x86 applications on x64 through WoW64 | x64 cold boot, install and repeatable x64 and x86 console, COM and GUI fixtures |
| R2 | SMP, memory management and durable operation | 1/2/4 vCPU stress, allocation and I/O soak tests, bounded resource growth and clean shutdown |
| R3 | Windows 11 application compatibility | Versioned application install, launch and named workflows with reference OS outcomes |
| R4 | UEFI/GPT, NVMe and NTFS read/write | Install, reboot and I/O matrix on disposable images with integrity and interruption recovery checks |
| R5 | Driver compatibility and modern hardware | Versioned storage, PCIe and USB matrix and documented driver model coverage |
| R6 | Security and servicing | Isolation and access-control tests, mitigation configuration checks, update and rollback tests |
| R7 | Enterprise networking and administration | SMB3 interoperability, AD join and Group Policy application, RDP and RemoteApp sessions against a lab domain |
| R8 | Modern graphics and runtime support | Staged WDDM, graphics API (DX12 and Vulkan), HDR, DPI and multi-monitor fixtures, .NET and PowerShell smoke suite |
| R9 | Lightweight local desktop and modular services | Resource budgets and restart or disable tests for optional services, offline account and administration scenarios |
| R10 | Hypervisor compatibility and possible host support | Guest support matrix first, separate feasibility decision for host virtualization |
| R11 | Independent servicing and atomic updates | Signed staged updates, rollback after failed boot or interrupted update, retained security fix history |
| R12 | ARM64 | Future feasibility and VM boot study after x64 foundations |

Retain ReactOS boundaries. Map work onto FreeLoader and setup for boot and installation, ntoskrnl and HAL for kernel and SMP, drivers for storage and hardware, dll and subsystem code for user-mode contracts, and base and win32ss for desktop behavior. Confirm the owning component before editing. Keep platform differences behind existing architecture boundaries where practical. Add API contract tests at the exported interface, exercise real applications separately and record fallback behavior. Analyze driver and graphics ABI feasibility before committing to broad binary coverage.

Use Windows 11 as the primary behavior reference, Server 2025 as an additional stability and enterprise reference, and Server 2003 as a historical compatibility reference where lawfully available. Record edition, build, configuration and relevant licensing provenance. Evaluate scope and target revisions through brief decision records with alternatives, dependencies and test implications.
