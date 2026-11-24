# Milestones and backlog

Estimates are planning ranges for initial investigations. Feature delivery estimates depend on what those investigations find. Pick one ready work item per branch and record implementation commits and evidence here or in a linked GitHub issue.

| Milestone | Exit gate |
|---|---|
| M0 Reproducible foundation | Two clean hosts or runners build the same pinned revision, image hashes and tool versions recorded, isolated install and reboot documented |
| M1 x64 foundation | x64 Debug boot and test baseline, repeatable SMP and memory checks |
| M2 Compatibility slice | x86 on x64 feasibility and first versioned x64/x86 application workflows |
| M3 Storage and servicing | UEFI/GPT and virtual storage matrix, filesystem integrity and rollback evidence |
| M4 Desktop and enterprise | Versioned compatibility for selected runtimes, enterprise services and graphics features |
| M5 Release candidate | Approved performance and security thresholds, compatibility matrix and reproducible release procedure |

| ID | Priority / state | Depends on | Owner role and first workload | Done when |
|---|---|---|---|---|
| BASE-01 | P0 Ready | — | Build, 1–2 days. Reproduce i386 debug bootcd on clean lab host and second host or CI | Commit, toolchain, ISO hash and build logs recorded |
| BASE-02 | P0 Waiting | BASE-01 | Test, 1–2 days. Install, reboot and log VM smoke tests | Complete profile and results for two runs, including known failures |
| BASE-03 | P0 Ready | — | Release, half day. Rehearse upstream sync and review flow on a scratch branch | Verified ancestry and reviewed integration checklist |
| BASE-04 | P1 Waiting | BASE-02 | Test, 2–4 days. Automate isolated QEMU install and boot assertion | Timeouts, success assertion and logs exercised against pass and fail cases |
| BASE-05 | P1 Waiting | BASE-02 | Performance, 1–2 days. Establish idle and workload measurements | Raw data and repeatable procedure for agreed measures |
| KERN-01 | P0 Waiting | BASE-02 | Kernel, 2–4 days. Compare x64 and i386 boot and inventory failures | Debug results and prioritized blockers for R1/R2 |
| KERN-02 | P1 Waiting | KERN-01 | Kernel, 2–4 days. Baseline SMP and memory behavior | Repeatable per-vCPU and soak results |
| API-01 | P1 Waiting | KERN-01 | Compatibility, 2–4 days. Map loader/ABI constraints for WoW64 | Approved plan and minimal independent test fixtures |
| API-02 | P1 Waiting | BASE-02 | Compatibility, 1–3 days. Pin first three apps and classify failures | Versioned results and one API contract task per accepted gap |
| HW-01 | P1 Waiting | KERN-01 | Hardware, 2–4 days. Trace UEFI, NVMe and NTFS dependencies | Virtual device coverage and data integrity test design |
| SEC-01 | P0 Ready | — | Security, 1–2 days. Define supported threat model and servicing gates | Reviewed isolation, mitigation and rollback test plan |
| ENT-01 | P2 Waiting | M2 | Networking, 2–4 days. Define SMB3, AD/GPO and RDP interoperability lab | Versioned topology and protocol success cases |
| GFX-01 | P2 Waiting | M2 | Graphics, 2–4 days. Determine display and rendering prerequisites | Approved staged feature plan and fixtures |
| DESK-01 | P2 Waiting | M2 | Desktop, 1–2 days. Inventory startup services and desktop workload | Offline administration scenarios and initial resource budgets |

First month sequence. Establish the pinned build and VM environment, record compatibility and performance samples, investigate x64 and SMP blockers, then select one small evidence-backed implementation task. Reorder based on the baseline. No production release date is assumed.
