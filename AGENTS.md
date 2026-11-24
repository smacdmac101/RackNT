# RackNT development instructions

Read [the roadmap](modernization/ROADMAP.md), [baseline](modernization/BASELINE.md) and [contribution policy](modernization/CONTRIBUTING.md) before starting. Pick a ready task and identify its acceptance checks. End each task with the commit, commands and measured outcomes, and update its backlog status.

Keep upstream branches clean. Base feature branches on develop and keep changes small enough to review and upstream where appropriate. Preserve the licenses and notices in each affected component. Prefer upstream test harnesses and record distinct results for configure, compile, ISO generation, boot, install and test execution.

Use public documentation, independently observed behavior approved for use, and license-compatible source. Follow the clean-room policy before using REA. Keep restricted evidence, credentials, binaries and private lab details outside the repo and shared Codex context. Use defensive verification for security changes. Run experimental images in disposable VMs. Mark skipped or blocked checks explicitly.
