# Set up another Windows machine

Install Git, PowerShell 7, the ReactOS Build Environment (RosBE), and QEMU from their official sources. Use the RosBE i386 environment for the initial local baseline. Record versions before collecting results. Allow space for a full clone, a separate build tree and a disposable VM disk.

```powershell
git clone https://github.com/smacdmac101/RackNT.git
Set-Location RackNT
git remote add upstream https://github.com/reactos/reactos.git
git fetch upstream master
pwsh -NoProfile -File modernization/host-check.ps1
```

Open the checkout in Codex. Ask it to read AGENTS.md and start the first ready task in ROADMAP.md. Store sanitized findings and the status of work in GitHub so a new machine can resume from the same commit. Keep build output, VM disks and unredacted logs outside the checkout. Install REA only on a machine doing approved research.

## Build and test

From an i386 RosBE command prompt, open a new build folder outside the checkout and run the upstream commands below. Replace the source path with your clone's absolute path. Use the baseline tag for a clean upstream comparison and a separate output folder for each source revision, toolchain and architecture.

```bat
C:\dev\RackNT\configure.cmd -DCMAKE_BUILD_TYPE=Debug -DENABLE_ROSTESTS=ON
ninja bootcd
```

Check each exit code. Hash the resulting bootcd.iso and follow [the VM and test protocol](BASELINE.md). [ReactOS build instructions](https://github.com/reactos/reactos#building).

## Keep in sync

- master is the unmodified GitHub fork default-branch mirror. upstream is the corresponding explicit mirror ref.
- main (GitHub default) is the reviewed project branch. develop is the candidate integration branch. Branch feature work from develop and cut release branches only after the relevant gates pass.
- For each synchronization, start with a clean checkout configured with the remotes above. Run this from PowerShell. A non-fast-forward push rejects a contaminated mirror. Investigate any failure before continuing.

```powershell
git fetch upstream master
if ($LASTEXITCODE) { throw 'Upstream fetch failed' }
git push --atomic origin refs/remotes/upstream/master:refs/heads/master refs/remotes/upstream/master:refs/heads/upstream
if ($LASTEXITCODE) { throw 'Mirror update failed' }
git fetch origin
if ($LASTEXITCODE) { throw 'Fork fetch failed' }
git switch -c sync/upstream-YYYYMMDD origin/develop
if ($LASTEXITCODE) { throw 'Could not create the integration branch' }
git merge --no-ff origin/upstream
```

Resolve conflicts on the sync branch, review the diff and run baseline checks before opening a PR against develop. Promote reviewed and verified develop commits to main using a merge that preserves ancestry. Keep upstreamable fixes narrowly scoped. The baseline tag stays on the original commit. Upstream synchronization is maintainer-triggered.
