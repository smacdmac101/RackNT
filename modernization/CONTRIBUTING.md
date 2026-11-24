# Clean-room development and Codex workloads

Use public interface documentation and standards, compatible upstream or third-party source with recorded licenses, and approved black-box observations. Avoid leaked source, unauthorized materials and proprietary implementation artifacts. Do not commit proprietary binaries, decompiled output, disassembly, implementation pseudocode, credentials or restricted logs. Use lawful test copies and respect applicable terms. For ambiguous sources, pause that investigation and ask the maintainer for a provenance decision.

1. Research owns the reference environment. Record the version, source and permissions, probe inputs and externally visible outputs. Include reproduction steps and uncertainty. Use synthetic or open fixtures first.
2. A reviewer approves a behavior-only specification with source references, allowed inputs, outputs and error semantics. Record exposure and review. Keep restricted material in access-controlled storage outside the repo and away from implementation sessions.
3. The implementation role starts from the approved spec in an independent session and receives only approved material. Change the smallest owning component and add a behavior test. If exposed to restricted implementation material, stop and ask the maintainer to reassign the implementation.
4. Verification reruns independent behavior tests and records the machine profile, commit, results and limitations. A reviewer checks provenance, component notices and the patch before merge.

## Using REA and Codex

Install or connect [REA](https://github.com/morluto/rea) using its current setup instructions on the research machine. Verify availability with an open fixture first. REA is an optional research tool for permitted compatibility investigations. For proprietary reference systems, use authorized black-box probes and retain only approved interface-level findings. Do not share restricted captures or configure agents to export them. Public specifications go in the task issue or a reviewed Markdown file. Builds work independently of REA and Codex.

| Role | Input | Output |
|---|---|---|
| Architect | Backlog item and evidence | Owning subsystem, interface decision and acceptance checks |
| Research | Approved reference and test question | Provenance and independent behavior specification |
| Kernel, compatibility, hardware, graphics, networking or desktop | Approved spec and subsystem tests | Small implementation patch and focused tests |
| Security | Design and test plan | Threat model, mitigation and isolation checks |
| Verification and performance | Commit, VM profile and cases | Reproducible results, baseline comparison and failure classification |
| Reviewer and release | Patch, provenance and results | Reviewed merge decision, artifact manifest and servicing notes |

Roles describe responsibilities. Use one bounded Codex task with a named owner and acceptance check. Keep research and implementation context separate where required. Request human review before publishing results, changing release branches or making compatibility claims.
