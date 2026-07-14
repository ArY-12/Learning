# DevOps → MLOps/AI Infra Roadmap (v2)
### Topic-Wise Study Guide with Do's, Don'ts, and Mandatory Projects
GCC-Focused | 14-Month Plan | 10–12 hrs/week

**How to use this guide:** Work through each phase in order, don't skip ahead. Every topic has a subtopic checklist, do's, don'ts, a mandatory project, free resources, and a "Done when" checkpoint. Only move to the next topic when you can pass the checkpoint without looking anything up. No certifications, no DSA grind, no SQL detour — your projects are your proof.

---

## PHASE 1 — FOUNDATIONS (Months 1–4)
Goal: build the base everything else sits on.

---

### Topic 1: Linux (Month 1)

**Why first:** Every tool in this roadmap runs on Linux. Without real Linux fluency, Kubernetes and Docker are just GUIs you click without understanding.

**Subtopic Checklist**
- Filesystem & navigation (`/etc`, `/var`, `/usr`, `/proc`, `/sys`, `/tmp`; `ls/cd/pwd/find/locate/tree`; file types; hard vs symbolic links)
- Permissions & ownership (`chmod`, `chown`/`chgrp`, setuid/setgid/sticky bit, `umask`)
- Users & groups (`useradd/usermod/userdel`, `/etc/passwd` & `/etc/shadow`, `sudo` vs `su`)
- Process management (`ps aux`, `top`/`htop`, foreground/background jobs, `kill`/signals, process states, `nice`/`renice`, `/proc`)
- systemd (`systemctl`, `journalctl`, writing a `.service` unit file)
- Package management (`apt`, `dpkg`)
- Text processing (`grep`, `awk`, `sed`, `cut/sort/uniq/wc`, piping, redirection)
- Shell scripting (shebang, variables/quoting, conditionals, loops, functions, exit codes, `$1/$2/$@`, cron)
- Storage & disk (`df/du`, `lsblk/fdisk`, `mount`/`fstab`, inodes)
- Networking basics (`ip addr/route`, `ss -tuln`, `ping/traceroute/dig`, `curl/wget`, `/etc/hosts`)
- SSH (`ssh-keygen`, `~/.ssh/config`, `scp/rsync`, tunneling)

**Do's**
- Do type every command yourself on a real VM/WSL2 — never just read about `chmod`, actually break a permission and fix it.
- Do keep a personal "cheat sheet" file of commands you had to look up twice — that's your real weak-spot list, more useful than any course outline.
- Do commit your scripts to GitHub from day one, with real incremental commits.

**Don'ts**
- Don't try to master every flag of every tool (e.g., every `find` option) — depth on the common 20% matters far more than breadth on the rare 80%.
- Don't skip writing scripts "because you understand the concept" — reading is not the same skill as writing under time pressure, and that's what gets tested in interviews.
- Don't over-invest here. This is the widest checklist in the guide relative to its 1-month slot; hit the "Done when" bar and move on rather than chasing kernel-level depth.

**Mandatory Project — 5 Bash Scripts (non-negotiable, all pushed to GitHub):**
1. `log-monitor.sh` — scans `/var/log/syslog` for "error" (case-insensitive), timestamps, saves to a dated file in `/tmp`
2. `disk-alert.sh` — checks `/` disk usage, warns above 80%, cron-ready
3. `user-setup.sh` — takes a username, creates user + temp password + group + home dir structure
4. `service-health.sh` — takes a list of services, checks each via `systemctl`, prints OK/FAILED
5. `backup.sh` — timestamped `.tar.gz` backup, keeps only last 5, deletes older ones

**Free Resources:** Linux Journey (linuxjourney.com) · freeCodeCamp Linux Full Course (YouTube) · The Linux Command Line book (linuxcommand.org/tlcl.php) · OverTheWire: Bandit (overthewire.org/wargames/bandit) · ExplainShell (explainshell.com)

**Done When…**
- [ ] You can explain what happens, step by step, running `curl https://example.com` — DNS, processes, file descriptors, network stack — without looking it up
- [ ] You can write a bash script from scratch solving a real problem (no copy-paste)
- [ ] You can debug "permission denied," "service failed to start," and "disk full" without Googling the commands

---

### Topic 2: Networking (Month 2 — first half)

**Why here:** You'll spend real time debugging "pod can't reach service," "DNS not resolving," "connection refused vs timed out" — all needing real networking intuition, not memorized commands.

**Subtopic Checklist**
- OSI & TCP/IP model, encapsulation
- IP addressing: IPv4 structure, CIDR & subnetting, private ranges, loopback, IPv6 basics
- DNS: resolution chain, record types (A/AAAA/CNAME/MX/TXT/NS/PTR/SRV), TTL, reading `dig`/`nslookup` output
- TCP vs UDP: 3-way handshake, teardown, refused vs timed-out, port ranges
- HTTP/HTTPS: methods, status code families, headers, HTTP/1.1 vs HTTP/2, TLS handshake (high level), reading `curl -v`
- Load balancing: L4 vs L7, algorithms, health checks, sticky sessions
- Firewalls & security groups: stateful vs stateless, `iptables` basics, AWS security groups, DROP vs REJECT, NAT
- Reverse proxies: forward vs reverse, nginx basics, why production sits behind one
- VPNs & bastions: conceptual tunnel, bastion/jump host, VPC concept preview

**Do's**
- Do actually subnet on paper (or in your head) until it's automatic — this is a classic interview filter question.
- Do install Wireshark once and just look at real traffic on your own machine — seeing a TCP handshake happen once beats reading about it ten times.
- Do treat "connection refused vs timed out" as a real diagnostic tool you'll use for the rest of your career, not trivia.

**Don'ts**
- Don't go deep on IPv6 — conceptual awareness is enough for now, it's explicitly low priority.
- Don't skip the "browser to GitHub" writeup thinking it's just an exercise — it is one of the most commonly asked infra interview questions, verbatim.

**Mandatory Project — Network Flow Documentation:**
Write a detailed, own-words explanation (as if teaching a junior) of "what happens, at every layer, when you type `https://github.com` and hit Enter" — DNS, TCP handshake, TLS negotiation, HTTP request/response, rendering. Turn it into a document with a diagram. Keep this — you will use it almost verbatim in interviews.

**Free Resources:** Practical Networking (YouTube) · freeCodeCamp Networking Full Course · Julia Evans' networking zines (wizardzines.com) · Wireshark (wireshark.org)

**Done When…**
- [ ] You can subnet a /24 into four /26 networks in your head
- [ ] You can explain "connection refused" vs "connection timed out" and what each implies
- [ ] You can read `curl -v` output and explain every line
- [ ] You've completed the "browser to GitHub" flow document

---

### Topic 3: Git (Month 2 — second half)

**Why here:** You need Git to manage every project in this roadmap, and CI/CD triggers on Git events. Basic commit/push isn't enough.

**Subtopic Checklist**
- Core concepts: blobs/trees/commits/refs, HEAD/working dir/staging area, `.git` structure
- Daily ops: `init/clone/status/add/commit/push/pull/fetch`, `diff`, `log --oneline --graph`, `.gitignore`
- Branching & merging: `branch/checkout/switch`, fast-forward vs 3-way merge, conflict resolution, `rebase`, `cherry-pick`
- Undoing things: `restore`, `reset --soft/--mixed/--hard`, `revert` vs `reset`, `stash`
- Remote workflows: origin/upstream, forking vs feature-branch workflow, PRs, `fetch` vs `pull`
- Tags & releases: lightweight vs annotated, semantic versioning
- GitHub-specific: Actions triggers preview, branch protection rules, writing a real README

**Do's**
- Do practice recovering from real mistakes on purpose — commit to the wrong branch, commit a secret, then fix both properly. This is exactly what gets asked in interviews.
- Do give every project a proper Git history from day one — this is one of the cheapest, highest-signal things a recruiter looks at.

**Don'ts**
- Don't dump "initial commit with everything" on any repo going forward — it's an instant tell that the history isn't real.
- Don't over-focus on rare commands (`filter-branch`, submodules) — daily-driver fluency plus recovering from mistakes matters far more.

**Mandatory Project:** No standalone project — instead, retroactively clean up your Month 1–2 script repos so they have proper commit history, and practice the "wrong branch" and "committed a secret" recovery scenarios once each, documented.

**Free Resources:** Pro Git Book (git-scm.com/book) · Oh My Git! (ohmygit.org) · Visualizing Git (gitschool.github.io/visualizing-git) · freeCodeCamp Git & GitHub course

**Done When…**
- [ ] You can explain merge vs rebase, with a diagram, and when to use each
- [ ] You've recovered from a wrong-branch commit and an accidentally-committed-secret using correct commands
- [ ] All future projects have clean Git history from day one

---

### Topic 4: Docker (Month 3)

**Why here:** You've used BuildPiper to build images. Now understand what's actually happening underneath — this comes up in every interview and every K8s debugging session.

**Subtopic Checklist**
- Core concepts: container vs VM (namespaces/cgroups, not virtualization), container lifecycle
- Images: layers & caching, image IDs vs tags, `docker image inspect/history`
- Dockerfiles: `FROM` (distroless/alpine/ubuntu tradeoffs), `RUN`/`COPY` vs `ADD`/`WORKDIR`/`ENV` vs `ARG`/`EXPOSE`/`CMD` vs `ENTRYPOINT`/`USER`, multi-stage builds, `.dockerignore`
- Containers: `run` flags, `exec -it`, `logs`, `inspect`, `stats`, `cp`
- Networking: bridge/host/none, custom bridge networks
- Volumes: named volumes vs bind mounts vs tmpfs
- Docker Compose: file structure, `depends_on` limitations, `.env`, profiles, overrides
- Security: non-root, read-only root fs, capability dropping, socket exposure danger, `trivy` scanning
- Registry ops: `pull/push/tag`, tagging strategy (never just `latest`)

**Do's**
- Do actually run `trivy` against your own images and fix findings — don't just read that you should.
- Do build the multi-stage Dockerfile yourself from a blank file at least once — this is the single most common "explain a decision you made" interview question in this whole roadmap.
- Do use `dive` once to visually see your image layers — it makes layer caching click instantly.

**Don'ts**
- Don't default to `latest` tags anywhere in your projects — tag with semantic versions or git SHAs, always, it's a visible tell to any reviewer.
- Don't run containers as root "just to get it working" and mean to fix it later — fix it now, it's a recurring security-basics interview question.

**Mandatory Project — Containerize 3 Apps (this becomes your reused base app for the rest of the roadmap):**
1. **FastAPI service** (`GET /health`, `GET /items`, `POST /items` in-memory) — multi-stage Dockerfile, non-root, <100MB, clean trivy scan
2. **Node/React frontend** — multi-stage build served via `nginx:alpine`, <30MB
3. **Full stack via Docker Compose** — FastAPI + Postgres + frontend wired together, talking by container name, config via `.env`

**Free Resources:** Docker "Get Started" docs · freeCodeCamp Docker Full Course · Play with Docker (labs.play-with-docker.com) · Trivy (github.com/aquasecurity/trivy) · Dive (github.com/wagoodman/dive)

**Done When…**
- [ ] You can explain layer caching and structure a Dockerfile to maximize cache hits
- [ ] You can build a multi-stage Dockerfile producing a <100MB Python image
- [ ] You can debug a failing container (no shell) using `logs`, `inspect`, and a debug sidecar
- [ ] You can explain every field in a `docker-compose.yml` without docs

---

### Topic 5: Kubernetes (Months 4–5)

**Why here:** Your OpenShift experience is a genuine head start — OpenShift is Red Hat's Kubernetes distribution. Your job is to strip away the OpenShift abstractions and understand vanilla K8s underneath, since that's what transfers everywhere else.

**Your unfair advantage — bring this table to every interview:**

| What you know in OpenShift | Maps to in vanilla K8s |
|---|---|
| Route | Ingress (+ IngressController) |
| BuildConfig | Dockerfile + external CI/CD |
| ImageStream | Image reference in Deployment spec |
| DeploymentConfig | Deployment |
| Project | Namespace |
| Security Context Constraints (SCCs) | PodSecurityAdmission / SecurityContext |
| `oc` CLI | `kubectl` CLI (nearly identical) |

**Subtopic Checklist**
- Architecture: control plane (`kube-apiserver`, `etcd`, scheduler, controller-manager), node components (`kubelet`, `kube-proxy`, containerd), what happens on `kubectl apply`
- Core workloads: Pod, ReplicaSet, Deployment (rolling updates, rollback), StatefulSet, DaemonSet, Job/CronJob
- Networking: Service types, Endpoints, CoreDNS + FQDN format, Ingress vs IngressController, NetworkPolicies
- Config & secrets: ConfigMap, Secret (base64 ≠ encryption), env vars, projected volumes
- Storage: PV/PVC, StorageClass, access modes, volume types
- Security: RBAC (Role/ClusterRole/bindings), ServiceAccounts, SecurityContext, Pod Security Admission
- Scheduling: requests vs limits, LimitRange/ResourceQuota, affinity/anti-affinity, taints/tolerations
- Autoscaling: HPA (and VPA conceptually)
- Helm: chart structure, templating, install/upgrade/rollback, writing your own chart from scratch
- Troubleshooting: `describe`/Events, `logs`/`--previous`, CrashLoopBackOff/ImagePullBackOff/OOMKilled/Pending/Evicted, debug pods (`netshoot`), `kubectl top`

**Do's**
- Do write a Helm chart completely from scratch at least once — don't just `helm install` someone else's chart and call it learned.
- Do deliberately break things in your own cluster and time yourself debugging them — this is literally what the job interview will simulate.
- Do lead with the OpenShift mapping table in interviews — it's genuine signal that you understand the abstraction layer, not just the surface commands.

**Don'ts**
- Don't treat `oc` and `kubectl` fluency as the same as understanding — knowing the command isn't the same as knowing why `CrashLoopBackOff` happens.
- Don't skip writing manifests by hand "because Helm/Kompose can generate them" — hand-writing them once is what makes debugging fluent later.
- Don't let this topic bleed past 2 months — if you're behind, this is one you can tighten, not extend.

**Mandatory Project:** Take the 3-service app from Topic 4 and deploy it to Kubernetes:
1. Hand-written manifests (no Kompose conversion): Deployments, Services, ConfigMap, Secret, PVC for Postgres, Ingress
2. RBAC: ServiceAccount + Role (read ConfigMaps) + RoleBinding
3. Resource requests/limits on every container
4. NetworkPolicy allowing API→Postgres, blocking external access to Postgres
5. Package as a Helm chart with dev/prod value overrides
6. Deliberately break 3 things (wrong image tag, missing secret key, wrong Service port) and document the debugging process for each — **these three writeups become your "tell me about a production issue" interview answers**

**Free Resources:** Kubernetes official docs (concepts section) · Kubernetes the Hard Way (Kelsey Hightower) · killer.sh (free tier) · KodeKloud free labs · CNCF K8s curriculum (github.com/cncf/curriculum) · kind docs

**Done When…**
- [ ] You can draw the full control plane + node architecture from memory
- [ ] You can explain what happens step-by-step during a Deployment update
- [ ] You've debugged CrashLoopBackOff, ImagePullBackOff, and a Pending pod without Googling the commands
- [ ] You've written a Helm chart from scratch and can explain every file in it

---

## PHASE 2 — ENGINEERING DEPTH (Months 5–8)

---

### Topic 6: Python for Infrastructure (Month 6)

**What kind of Python:** Not data science, not Flask tutorials. Automation Python — scripting, gluing APIs together, tools that replace manual work.

**Subtopic Checklist**
- Foundations: data types, f-strings, comprehensions, functions, error handling, file I/O, JSON/YAML, virtual envs
- Scripting patterns: `argparse` (always over raw `sys.argv`), `os`/`os.path`, `subprocess`, `shutil`, `logging` (proper levels), env vars for secrets (never hardcoded)
- APIs: `requests` (GET/POST/PUT/DELETE), error handling (`raise_for_status`), auth headers, pagination, retry/backoff, writing a REST client class
- Cloud SDK (boto3): session/client vs resource, S3 read/write, EC2 describe/start/stop, IAM roles over access keys, paginators, `ClientError` handling
- Basic web service: FastAPI routing, Pydantic models, response models, basic dependency injection, lifespan events, `uvicorn`
- Testing: `pytest` functions/assertions, fixtures, `unittest.mock.patch`, `pytest-cov`

**Do's**
- Do write every script with an `argparse` CLI, proper logging, and at least one test — treat this as the professional baseline, not extra credit.
- Do practice writing a clean script from a blank file, no reference open — this is closer to what a live GCC infra interview will actually ask ("write a script to parse this log") than any algorithmic prep would be.
- Do prefer IAM roles over access keys in every boto3 example you write — it's a real security-maturity signal.

**Don'ts**
- Don't hardcode any secret, anywhere, even in a "just testing" script — build the habit now, it's checked in interviews and in real code review.
- Don't skip the testing section because "it's just automation scripts" — being able to say "yes, my scripts have tests" is a genuine differentiator at your level.

**Mandatory Project — 3 Infrastructure Tools:**
1. **K8s namespace reporter** — Kubernetes Python client against your local `kind` cluster, lists pods across namespaces, flags non-Running pods, formatted table output
2. **S3 cleanup tool** (against LocalStack) — lists objects older than N days, dry-run report, `--confirm` flag to actually delete, proper logging/error handling
3. **Health check poller** — YAML config of URLs, polls every 30s, tracks uptime %, writes JSON report on exit, using threading or asyncio

**Free Resources:** Automate the Boring Stuff with Python (automatetheboringstuff.com) · FastAPI official docs · Real Python (realpython.com) · boto3 docs

**Done When…**
- [ ] You can write a script that reads YAML config, calls an API, handles errors/retries, logs to a file, and cron-runs — in under 2 hours
- [ ] Your scripts have argparse interfaces, proper error handling, and basic tests
- [ ] You understand script vs package, and have structured at least one project as a proper package

---

### Topic 7: CI/CD + GitOps (Month 7)

**Why this is your highest-impact project month:** A working CI/CD pipeline you built yourself — real code, real tests, real deployment — is the single most differentiating project at your experience level.

**Subtopic Checklist**
- Core concepts: CI vs CD vs Continuous Deployment, pipeline-as-code, artifact management, pipeline stages, fail-fast ordering, idempotency
- GitHub Actions: workflow structure, triggers, GitHub-hosted & self-hosted runners, marketplace actions, secrets, matrix builds, caching, artifacts, conditional steps, reusable workflows
- Pipeline design patterns: PR pipeline vs main-branch pipeline, promotion/approval gates, semantic-version automation, rollback strategy
- Security in pipelines: never print secrets, image signing concept (cosign), Trivy gating, SAST (bandit/semgrep), least-privilege service accounts
- GitOps with ArgoCD: GitOps principles, architecture, Application manifests, sync policies, App of Apps, health/sync status

**Do's**
- Do build the full loop yourself end to end — push → CI → registry → GitOps repo update → ArgoCD sync → running pods — even though it's slower than following a tutorial.
- Do practice narrating this pipeline out loud, unscripted, timed to ~15 minutes — this is one of the single highest-value things you can rehearse for GCC interviews.
- Do include a manual approval gate before "production" — it shows you understand real deployment discipline, not just automation for its own sake.

**Don'ts**
- Don't skip the "make the pipeline fail loudly" step — being able to show a failed run next to a successful one in your Actions history is a concrete, checkable artifact interviewers respond well to.
- Don't conflate CI and GitOps-based CD in your own head — this distinction is asked directly, and vague answers here are an easy tell of surface-level understanding.

**Mandatory Project — Full CI/CD Pipeline (your portfolio centerpiece):**
- **CI** (GitHub-hosted runner): on PR — lint (ruff/eslint), unit tests (pytest), build Docker images, Trivy scan; fail PR on any step failing
- **CD** (self-hosted runner + ArgoCD on local `kind`): on merge to main — build/push images to Docker Hub, update image tag in a separate GitOps repo (Helm values), ArgoCD detects and syncs; manual approval step before "production" namespace sync
- **Diagram** the complete flow — this goes in your portfolio README and gets referenced in every interview

**Free Resources:** GitHub Actions official docs · TechWorld with Nana (YouTube) · ArgoCD official docs & install guide

**Done When…**
- [ ] A `git push` to main triggers a pipeline ending in updated running pods — automatically
- [ ] You can clearly explain CI vs GitOps-based CD
- [ ] Your pipeline fails loudly on test failure, and you can show both a failed and successful run
- [ ] You've set up ArgoCD, can show the UI, and explain "OutOfSync" and how to investigate it

---

### Topic 8: Terraform / IaC (Month 8)

**Why here and not earlier:** IaC without understanding what you're provisioning is just YAML in a different language. After Linux/Networking/Docker/K8s, you'll actually understand what each resource does.

**Subtopic Checklist**
- Core concepts: declarative vs imperative, desired vs actual state, idempotency, mutable vs immutable infra
- HCL fundamentals: providers, resources, data sources, variables (with validation), outputs, locals, `for_each`/`count`, `dynamic` blocks, `depends_on`
- State management: `terraform.tfstate` (never commit it), remote backends (S3 + DynamoDB locking), state manipulation commands, `terraform import`
- Workflow: `init/validate/fmt/plan/apply/destroy`, reading plan output, `-target` (code smell), `-auto-approve` danger, workspaces
- Modules: structure, root vs child, local vs registry, versioning, writing a reusable module yourself
- LocalStack: free AWS emulation for testing without a real account/bill
- Real AWS (free-tier-safe only): IAM, S3 with versioning, VPC/subnets/routing, EC2 — avoid EKS/NAT Gateway/RDS (not free-tier)
- Security: never hardcode credentials, IAM roles for pipeline auth, tfsec/checkov

**Do's**
- Do test everything against LocalStack first, and only validate once against real free-tier-safe AWS resources — protects you from surprise bills.
- Do write your own reusable module rather than just consuming Terraform Registry modules — "I wrote a module" is a real interview answer, "I used one" is not.
- Do run `terraform destroy` after every practice session, without exception.

**Don'ts**
- Don't provision EKS, NAT Gateway, or RDS while practicing — they are not free-tier and can generate real charges quickly.
- Don't skip the deliberate state-issue recovery exercise — "what happens if two people run `apply` at once" is a very standard interview question, and having actually broken and fixed a state issue makes the answer real instead of textbook.

**Mandatory Project — Infrastructure Module:**
1. VPC module (variables for CIDR, subnet counts, AZs; outputs for VPC ID, subnet IDs, route table IDs)
2. Compute module (takes VPC outputs, provisions EC2 in a public subnet, security group for SSH-from-your-IP-only + HTTP)
3. Root module wiring both together with dev/prod `.tfvars`
4. Remote state in a separately provisioned S3 bucket
5. Run `tfsec`, fix every finding
6. Add a Terraform plan step to your GitHub Actions pipeline (plan on PR, apply on merge)

**Free Resources:** Terraform official docs (Learn section) · freeCodeCamp Terraform course · LocalStack docs · TechWorld with Nana Terraform series · tfsec (github.com/aquasecurity/tfsec)

**Done When…**
- [ ] You can explain what `terraform plan` does internally
- [ ] You've written a reusable module with proper variables, validation, and outputs
- [ ] You've recovered from a state file issue (`state rm` + re-import, or workspace corruption)
- [ ] Your Terraform code is in CI and you can show plan output as a PR comment

---

## PHASE 3 — CLOUD + MLOPS (Months 9–12)

---

### Topic 9: AWS Core (Month 9)

**Approach:** Go deep only on services that connect to what you've already learned. Don't try to learn all of AWS — that's a job description, not a study plan.

**Subtopic Checklist**
- IAM: users/groups/roles/policies, trust vs permission policies, IRSA, least privilege, STS
- VPC: subnets (public/private), IGW/NAT (concept only), route tables, security groups vs NACLs, VPC peering (concept), endpoints
- EC2: instance type naming, AMIs, user data scripts, key pairs, Elastic IPs, Auto Scaling Groups
- S3: buckets/objects/keys, storage classes, bucket policies vs ACLs, versioning/lifecycle/replication, presigned URLs, Terraform state backend use
- EKS: control plane vs worker nodes, managed/self-managed/Fargate node groups, VPC CNI, IRSA, ECR, `aws eks update-kubeconfig`
- CloudWatch: metrics/logs/alarms, Logs Insights, Container Insights, SNS alarm notifications, log retention & cost
- Cost management: Free Tier limits, billing dashboard, budget alarms at $1–5

**Do's**
- Do set a $1–5 budget alarm before doing anything else in a real AWS account — non-negotiable safety net.
- Do understand IRSA deeply enough to debug "pod can't access S3" by isolating whether it's the trust policy, the permission policy, or the pod annotation — this exact scenario is a common real interview question.
- Do provision everything via Terraform, never the console, to reinforce Topic 8.

**Don'ts**
- Don't try to "learn all of AWS" — stick to the services above; breadth outside this list has low ROI for your specific target roles.
- Don't provision EKS/NAT Gateway for practice — same free-tier warning as Topic 8, EKS control plane has an hourly cost.

**Mandatory Project:** Provision a VPC + EC2 + S3 Terraform-state backend using Terraform (not console), actually use it, then destroy it cleanly. Document the architecture with a diagram — this becomes part of your portfolio README set.

**Free Resources:** AWS Skill Builder (skillbuilder.aws) · AWS Free Tier page · freeCodeCamp AWS course · AWS Well-Architected Framework (docs.aws.amazon.com/wellarchitected)

**Done When…**
- [ ] You can draw a 3-tier AWS architecture (VPC/subnets/ALB/EKS/RDS) from memory and explain security & networking for each part
- [ ] You can debug the IRSA "pod can't access S3" scenario by isolating trust policy vs permission policy vs pod annotation
- [ ] You've provisioned, used, and cleanly destroyed a VPC+EC2+S3 backend via Terraform

---

### Topic 10: Monitoring & Observability (Month 9 — parallel with AWS)

**Why here:** Production credibility comes from knowing how systems behave over time, not just at deploy time. Every senior-leaning interview touches this.

**Subtopic Checklist**
- Three pillars: metrics, logs, traces — and monitoring vs observability
- Prometheus: architecture (scrape model, exporters, Alertmanager), PromQL basics (`rate()`, `increase()`, `histogram_quantile()`), metric types (Counter/Gauge/Histogram/Summary), service discovery, alerting rules, `kube-prometheus-stack` install
- Grafana: data sources, dashboard building, variables, alerting, importing community dashboards
- Logging: structured (JSON) vs unstructured, aggregation pattern (app → Fluent Bit → Loki/Elasticsearch → Grafana/Kibana), Loki/LogQL basics

**Do's**
- Do build at least one Grafana dashboard yourself from scratch rather than only importing community ones — "I built this dashboard" is a stronger interview answer than "I imported this dashboard."
- Do learn RED (Rate, Errors, Duration) and USE (Utilization, Saturation, Errors) methods by name — these are standard interview vocabulary.

**Don'ts**
- Don't rely solely on imported dashboards for your portfolio — at minimum, customize one meaningfully so you can explain every panel's query.

**Mandatory Project — Full Observability Stack:** Install `kube-prometheus-stack` via Helm on your local `kind` cluster, instrument your FastAPI app with a `/metrics` endpoint (`prometheus-fastapi-instrumentator`), build a custom Grafana dashboard (request rate, error rate, latency), write one alerting rule (error rate >5% for 2 minutes), install Loki + Fluent Bit for log aggregation.

**Free Resources:** Prometheus official docs · Grafana official docs · kube-prometheus-stack GitHub (prometheus-community/helm-charts)

**Done When…**
- [ ] You can write a PromQL query for p95 latency over the last hour
- [ ] You can explain RED and USE methods in an interview
- [ ] Your monitoring stack is running on your cluster, visible in a dashboard you built yourself

---

### Topic 11: MLOps (Months 10–11) — your flagship

**Important framing:** You are not becoming a machine learning engineer. You're becoming the person who operates ML systems — the infrastructure that trains, versions, serves, and monitors models. ML vocabulary and lifecycle understanding, not deep ML math.

**Subtopic Checklist**
- ML lifecycle vocabulary: data → features → training → evaluation → deployment → monitoring; overfitting/underfitting (concept); training vs inference workloads; batch vs real-time inference; model versioning; data drift vs model drift
- Experiment tracking (MLflow): tracking server, runs/experiments/params/metrics/artifacts, model registry (staging), running locally and on K8s, MLflow Projects, MLflow Models/pyfunc
- Data versioning (DVC): why Git isn't enough for data, remotes, `dvc init/add/push/pull/repro`, DVC pipelines
- Model serving: REST vs gRPC vs batch, your own FastAPI server (simplest, most defensible approach), BentoML basics, ONNX concept, Triton concept, serving considerations (cold start, memory, concurrency)
- Pipeline orchestration: DAG concept, Airflow (DAGs, operators, sensors, XCom, connections), running on K8s, Prefect/Kubeflow (concept overview)
- Feature stores (concept level): why they exist (training-serving skew), online vs offline store, Feast overview
- Model monitoring: what to monitor (prediction/input distribution, business metrics, latency), drift detection concept (KL divergence/PSI), Evidently AI, alerting via Prometheus/Grafana

**Do's**
- Do build the entire pipeline end to end yourself, even at a small/toy-dataset scale — the infrastructure quality matters far more than model accuracy.
- Do connect this project's monitoring back into the Prometheus/Grafana stack you already built in Topic 10 — reusing your own infra, not building a parallel one, is exactly the kind of system-thinking interviewers look for.
- Do protect these two months above everything else in the roadmap — if anything upstream ran long, this is where you claw the time back from Phase 1, never from here.

**Don'ts**
- Don't try to train a "good" model — pick a small, boring open dataset (Titanic, UCI Heart Disease) and spend your effort on the infrastructure around it, not the model itself.
- Don't skip the debugging writeup at the end — "one thing that broke and how you debugged it" is the single most reusable interview anecdote this whole roadmap produces.

**Mandatory Project — End-to-End MLOps Pipeline (your flagship, everything connects to skills you've already built):**
1. **DVC** — version a small open dataset, track changes between two versions
2. **MLflow** — log 3 model runs (vary one hyperparameter each time), compare in the UI, register the best
3. **FastAPI model server** — load the registered MLflow model, expose `/predict`, `/health`, `/metrics`
4. **Docker + Kubernetes** — containerize, deploy to `kind` with resource limits, Ingress, HPA
5. **Airflow on K8s** — 4-stage DAG: data download → preprocessing → inference on a new batch → write results (file or LocalStack S3)
6. **Monitoring** — Prometheus scrapes `/metrics`, Grafana dashboard (prediction count, latency), Evidently AI drift report
7. **CI/CD** — GitHub Actions: on push, run tests, build image, push to Docker Hub, update GitOps repo, ArgoCD deploys

Document it fully: architecture diagram, README per component, and a short writeup of one real thing that broke and how you debugged it.

**Free Resources:** MLflow official docs · Made With ML (madewithml.com) · Full Stack Deep Learning (fullstackdeeplearning.com) · DVC docs · Airflow docs · Evidently AI docs

**Done When…**
- [ ] You can explain feature store vs model registry to a non-ML person
- [ ] You can explain data drift and how you'd detect/alert on it in production
- [ ] Your end-to-end pipeline runs — someone can clone your repo and see the full system working

---

### Topic 12: AI Infrastructure Concepts (Month 12)

**Framing:** No GPU hardware needed. Understand what makes AI infra different from regular infra, speak intelligently about it, and get hands-on with the key open-source tools at small scale.

**Subtopic Checklist**
- GPU scheduling on K8s: NVIDIA device plugin (concept), `nvidia.com/gpu: 1` resource requests, MIG/time-slicing concept, taints/tolerations for GPU nodes, DCGM Exporter + Prometheus (concept)
- LLM serving: inference vs training workload differences, key metrics (tokens/sec, TTFT, latency/token), KV cache concept, static vs dynamic batching, vLLM/PagedAttention, running a small model locally (Phi-2 or similar, CPU-friendly)
- Vector databases: why they exist (semantic similarity, not exact lookup), embeddings concept, ANN algorithms (HNSW/IVF — concept only), pgvector, Qdrant
- Inference cost optimization: quantization (INT8/INT4) concept, distillation concept, semantic/prompt caching, horizontal vs vertical scaling, spot vs on-demand
- AI platform concepts: what an AI/ML platform abstracts (compute/storage/orchestration/registry/monitoring), internal developer platform (IDP) concept, Vertex AI/SageMaker/Databricks — know which layer each provides, not deep usage

**Do's**
- Do actually run a small open model locally via vLLM or Ollama — even a tiny CPU-friendly model makes KV cache and batching concepts concrete instead of abstract.
- Do connect this project's metrics back to your existing Prometheus/Grafana stack — same reasoning as Topic 11, reused infra shows maturity.
- Do keep enough surface awareness of the application layer (what RAG is, roughly how retrieval + generation fits together) even though you're infra-focused — GCC/AI-infra interviewers often probe this lightly even for pure infra roles.

**Don'ts**
- Don't chase GPU hardware or paid cloud GPU time for this — everything here is designed to work conceptually or on CPU-friendly small models; spending money here has poor ROI at your stage.
- Don't go deep into quantization math or ANN algorithm internals — concept-level fluency ("what it is, why it matters, tradeoffs") is the actual bar, not implementation depth.

**Mandatory Project — Mini RAG System:**
1. Run a small open model locally via vLLM (or Ollama as a simpler CPU alternative)
2. Set up Qdrant in Docker
3. Embed 10–20 text documents with `sentence-transformers`, store in Qdrant
4. Write a query function: question → embed → retrieve top-3 → send context+question to local model → return answer
5. Containerize the whole thing, expose a `/query` FastAPI endpoint
6. Add Prometheus metrics for query and retrieval latency

**Free Resources:** vLLM docs (docs.vllm.ai) · Qdrant docs · pgvector GitHub · Databricks blog on LLM inference performance engineering

**Done When…**
- [ ] You can explain KV cache and why it matters for LLM serving cost/performance
- [ ] You can explain why vector databases exist and what ANN search is doing conceptually
- [ ] Your mini RAG system runs end to end and you can walk through the full architecture unscripted

---

## PHASE 4 — JOB-READY SPRINT (Months 13–14)

### Topic 13: Portfolio Polish + Interview Prep

**Portfolio Checklist**
- GitHub profile README with bio, skills, project links
- Every project repo: clear README (Problem → Architecture with diagram → How to run → What I'd do differently at scale), consistent structure across all repos
- Pinned repos: CI/CD + GitOps project, MLOps flagship, mini RAG/AI-infra project
- Continuous, honest commit history across all 14 months — no gaps, no dump commits
- At least one merged PR to a real open-source project (`kubernetes`, `argo-cd`, `mlflow`, `dvc` — even a docs fix counts)

**Resume**
- One page, clean, no graphics that break ATS parsing
- Two honest sections: **Professional Experience** (small, precise — reframe ReBIT work with accurate but senior-sounding verbs: "operated application deployments on OpenShift/Kubernetes in a regulated, high-availability financial data-centre environment") and **Independent Projects** (large, load-bearing — this is where your real credibility lives)
- Skills section honest about level: "Proficient" vs "Familiar" vs "Exposure"
- No "responsible for" — only "built," "automated," "reduced," "deployed," "designed"

**LinkedIn**
- About section: regulated-environment background + self-built portfolio, told as one coherent story
- Featured section links to your GitHub portfolio README
- Post 2–3 short writeups (screenshots + what you learned)
- Connect with DevOps/SRE/Platform/MLOps engineers at target GCCs, comment genuinely on their posts

**Do's**
- Do start applying and interviewing quietly around Month 12–13, not Month 14 — GCC pipelines often run 4–8 weeks across multiple rounds, so starting earlier means offers land closer to when you're actually free to move.
- Do practice narrating your CI/CD pipeline and your MLOps flagship out loud, unscripted, timed — repeatedly, starting as early as Month 9–10, not for the first time in Month 13.
- Do lean explicitly into your RBI/regulated-environment background as a strength for GCC banking/finance tech centres — it's genuinely relevant there, don't undersell it.

**Don'ts**
- Don't wait until the bond fully clears to submit a single application — early soft-applications calibrate your real market value and give you live interview reps against real stakes.
- Don't prepare FAANG-scale system design questions (design Twitter, design a URL shortener) — GCC system design rounds are narrower and more concrete; the questions below match that scale.
- Don't fabricate scope of work on your resume — background/reference checks are common at this level, and a mismatch discovered post-offer is the worst possible timing. Honest reframing (see Resume above) achieves the same goal without that risk.

**Technical Interview Topics (prepare as spoken answers, not just mental notes)**
- "Walk me through your CI/CD pipeline" (should sustain 15 minutes)
- "How does Kubernetes scheduling work?" — from resource request to pod running on a node
- "What happens when a pod goes into CrashLoopBackOff? How do you debug it?"
- "Explain ConfigMap vs Secret"
- "How does Terraform manage state, and what happens if two people run apply simultaneously?"
- "What is data drift and how would you detect it in production?"
- "How would you design infra for a model serving 1000 req/sec?"

**System Design (GCC-scale, start Month 12–13)**
- Design a CI/CD system from scratch
- Design a model-serving platform for a team of 10 data scientists
- Design a monitoring system for a microservices application

**Behavioral**
- "Tell me about a time you debugged a difficult production issue" — use your real writeups from Topics 5, 7, and 11
- "How do you handle working in an environment where you don't have the exposure you need?" — your entire 14 months is the honest answer
- "Why are you leaving after 2 years?" — frame around growth, not complaint

**Target Companies**
- **Primary:** GCCs of banking/finance firms — JPMorgan, Goldman Sachs, Deutsche Bank, Barclays, Morgan Stanley, Wells Fargo, UBS, American Express India, and similar tech centres
- **Secondary:** Well-funded Indian product companies with strong engineering (Flipkart, Swiggy, Razorpay, CRED, Freshworks, Zoho, Postman)
- **Avoid for now:** Pure IT-services companies in services mode (TCS/Infosys/Wipro) — same skills, roughly half the pay, and the work loops back into the deployment-execution role you're trying to leave

---

## QUICK REFERENCE

### Free Tools Summary
| Tool | For | Cost |
|---|---|---|
| WSL2 / Ubuntu VM | Linux environment | Free |
| kind / k3d | Local Kubernetes | Free |
| LocalStack | AWS emulator | Free |
| GitHub Actions | CI/CD | Free (public repos) |
| ArgoCD | GitOps CD | Free |
| Docker Hub | Container registry | Free (public repos) |
| Prometheus + Grafana | Monitoring | Free |
| MLflow | Experiment tracking + registry | Free |
| DVC | Data/model versioning | Free |
| Apache Airflow | Orchestration | Free |
| Qdrant | Vector database | Free |
| Evidently AI | Model monitoring | Free |
| Trivy | Image scanning | Free |
| tfsec / checkov | Terraform scanning | Free |
| draw.io / Excalidraw | Diagrams | Free |

### Monthly Milestone Summary
| Month | Topic | Key Deliverable |
|---|---|---|
| 1 | Linux | 5 bash scripts on GitHub |
| 2 | Networking + Git | Browser-to-server flow doc + clean Git history |
| 3 | Docker | 3 containerized apps + Compose |
| 4–5 | Kubernetes | Full K8s deployment + Helm + 3 debugged failures |
| 6 | Python | 3 infra automation tools with tests |
| 7 | CI/CD + ArgoCD | Working end-to-end pipeline with GitOps |
| 8 | Terraform | IaC module integrated into CI |
| 9 | AWS + Observability | Monitoring stack on K8s + Terraform-provisioned AWS |
| 10–11 | MLOps | End-to-end ML pipeline (flagship) |
| 12 | AI Infra | Mini RAG system with vector DB + local LLM |
| 13–14 | Job search | Resume, portfolio, active applications |

### Global Do's and Don'ts (apply across every topic)

**Do's**
- Do treat the "Done when" checklist as the real bar — not "I read about it," but "I can do it live, unscripted."
- Do write a short field note every week — one paragraph on what you built and one thing that broke. This is unfakeable, free, and doubles as interview rehearsal.
- Do reuse your one running app (FastAPI + Postgres + frontend) across every phase instead of building disconnected toy projects — this is what turns 13 topics into one coherent portfolio story.
- Do start light networking with GCC-based DevOps/SRE/Platform/MLOps people from Month 6 onward.
- Do start mock interview practice from Month 9–10, not Month 13.

**Don'ts**
- Don't chase certifications — your 14 months of real, working, documented projects is stronger and cheaper evidence than any exam.
- Don't grind DSA/competitive coding — GCC infra interviews are scenario- and scripting-based, not algorithmic; Topic 6 already builds the right muscle.
- Don't fabricate job scope or experience — it's fragile against real interview follow-up questions and background checks, and your honest project portfolio is already a stronger answer.
- Don't let Phase 3 (Months 9–12) slip — if you're behind, compress Phase 1 depth first, always.
