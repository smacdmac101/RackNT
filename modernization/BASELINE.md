# Build, VM and test baseline

The upstream reference tag is `baseline/reactos-2026-11-24` at `a3772c9df2a1a6f486cf957721956b18ebb19776`. The i386 Debug profile uses BIOS, one vCPU, 512 MiB RAM and an 8 GiB disposable IDE disk. The baseline is an engineering checkpoint, with compatibility and release eligibility determined by subsequent tests.

| Check | Initial status |
|---|---|
| Fork ancestry and unchanged upstream licensing | Verified during setup |
| i386 Debug ISO on a second machine | Pending BASE-01 |
| QEMU install, reboot and test cases | Pending BASE-02 |
| AMD64 baseline | Pending KERN-01 |
| App compatibility and performance | Pending API-02 and BASE-05 |

The manual **RackNT i386 baseline** Actions workflow uses MSVC and uploads the ISO and its hash after a successful build. RosBE is the local comparison lane. Exact ISO hashes identify artifacts. Toolchain and metadata differences can produce different hashes for equivalent source.

## VM protocol

In a fresh lab folder outside the repo, replace the ISO path and run the commands below with QEMU on PATH. Use a new lab folder for each run. Keep VM networking off and use only virtual disks.

```text
qemu-img create -f qcow2 racknt.qcow2 8G
qemu-system-i386 -machine pc -m 512 -smp 1 -nic none -drive file=racknt.qcow2,format=qcow2,if=ide -cdrom "C:/path/to/bootcd.iso" -boot once=d -serial file:install-serial.log
qemu-system-i386 -machine pc -m 512 -smp 1 -nic none -drive file=racknt.qcow2,format=qcow2,if=ide -boot c -serial file:reboot-serial.log
```

Record setup reachability, successful disk installation, desktop reachability and the next clean reboot as separate results. Try opening and saving a file in Notepad, confirm it survives a reboot, and record shutdown and any bugchecks. Use a serial debug boot option where available. Record the commit, ISO hash, compiler, CMake/Ninja and QEMU versions, machine type, run duration, and relevant sanitized logs. For upstream test cases, record the exact suite, command and pass/fail/skip counts. See [ReactOS Testman](https://reactos.org/testman/). Automation of install and assertion is tracked in BASE-04.

## Application coverage

All entries start untested. Record exact installer/version, OS build and architecture, reference outcome, install, launch, workflow and uninstall outcomes. Group later entries by prerequisites.

| Candidate | First workflow |
|---|---|
| 7-Zip, Notepad++, VLC | Archive round trip, text save/reopen, local media playback |
| VB6 IDE and legacy business apps | Project load and compile; open a synthetic business record |
| Firefox, Chrome | Local test page rendering and isolated browser startup |
| Office, Visual Studio, SQL Server | Edit/save document, compile fixture, create/query database |
| AutoCAD, Q-SYS Designer, Crestron Toolbox | Open and save a sample project or exercise offline discovery |
| Cisco AnyConnect | Install and connect to an authorized isolated lab endpoint |
| Steam and DX12 applications | Client start and repeatable rendering fixture |

## Performance and stability

Use the same machine profile and input data for comparisons. Run five cold boots and collect desktop-ready time, settled idle memory and CPU, archive throughput, and file I/O with integrity hashes. Report median and range alongside raw timing results. Record crashes and resource growth in a two-hour mixed-workload soak. Set reviewable budgets only after collecting a baseline. Expand the soak and failure recovery criteria before any production release.
