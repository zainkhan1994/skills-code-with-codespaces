# 🚀 Code with Codespaces — Skill Lab Report

> **Who is this for?** High school students learning GitHub Codespaces for the first time. This guide walks through every single step of the lab with explanations, screenshots, and key takeaways. No prior experience required!

---

## 🧠 What Is This Lab About?

Imagine being able to code *from anywhere* — your school Chromebook, your phone's browser, even a shared library computer — without ever installing anything. That's what **GitHub Codespaces** makes possible.

In this lab, you'll learn how to:
1. Launch a fully working coding environment in the cloud
2. Customize it with specific programming languages and tools
3. Add helpful extensions and setup scripts
4. Test it like a brand new developer joining a team

Let's dive in! 🏊

---

## 📋 Step 1: Start a Codespace and Push Some Code

### 🤔 What's the Big Deal About Codespaces?

Before we start clicking buttons, let's understand *why* this matters.

Have you ever helped a friend set up a game or app on their computer, and it works perfectly on yours but totally breaks on theirs? Developers call this the **"It works on my machine!"** problem. It's one of the most frustrating things in software development.

**GitHub Codespaces** solves this by giving every developer the exact same environment in the cloud. It runs inside something called a **Docker container** — think of it like a mini virtual computer that always starts in the exact same state, no matter whose machine is being used.

> 💡 **Real-world analogy**: Think of a Codespace like a locker at school. Every student gets the same kind of locker, and you can set it up exactly how you want. When you're done, you close it. Next time you open it, everything is still there exactly as you left it.

### 📸 Step 1a — Opening a Codespace

**What you do**: Go to your repository on GitHub, click the green **<> Code** button, select the **Codespaces** tab, and click **Create codespace on main**.

![Green Code Button](https://github.com/zainkhan1994/skills-code-with-codespaces/blob/main/.github/images/green-code-button.png?raw=true)

A new browser tab opens and loads VS Code — that's a free, powerful code editor made by Microsoft. It's now running *in the cloud*, not on your computer!

![Remote Connection Status](https://github.com/zainkhan1994/skills-code-with-codespaces/blob/main/.github/images/remote-connection-status.png?raw=true)

See that indicator in the bottom-left corner of VS Code? That green badge tells you you're connected to a remote Codespace. Super cool! 🟢

### 📸 Step 1b — Running the Application

**What you do**: Open the `src/hello.py` file and run it in the terminal.

![VS Code Explorer Tab](https://github.com/zainkhan1994/skills-code-with-codespaces/blob/main/.github/images/vs-code-explorer-tab.png?raw=true)

On the left sidebar, click the **Explorer** tab (looks like two overlapping pages) to find your project files. Open `src/hello.py` to see:

```python
print("Hello!")
```

Then click the **TERMINAL** tab at the bottom of VS Code:

![VS Code Terminal Tab](https://github.com/zainkhan1994/skills-code-with-codespaces/blob/main/.github/images/vs-code-terminal-tab.png?raw=true)

And type this command to run the program:

```bash
python src/hello.py
```

You'll see: `Hello!` printed in the terminal. Your first program running in the cloud! 🎉

Also try this to see all the tools the default Codespace comes with:

```bash
node --version
dotnet --version
python --version
gh --version
```

You'll see version numbers for **Node.js** (JavaScript runtime), **.NET** (Microsoft's framework), **Python**, and the **GitHub CLI**. These are all pre-installed!

### 📸 Step 1c — Pushing Your First Change

The original `hello.py` just prints `"Hello!"` — that's not very friendly, right? Let's fix it to say the more classic:

**Before:**
```python
print("Hello!")
```

**After:**
```python
print("Hello World!")
```

Edit the file, save it (`Ctrl+S`), and then push it to GitHub using the terminal:

```bash
git add 'src/hello.py'
git commit -m 'fix: incomplete hello message'
git push
```

> 💡 **What just happened?** You edited a file in a cloud computer, saved it, and synced the change back to GitHub — all without installing anything on your own device. That's the power of Codespaces!

### ✅ What I Took Away from Step 1

| Concept | What It Means |
|---------|---------------|
| **Codespace** | A cloud-based coding environment you can access from any browser |
| **Dev Container** | A mini virtual computer (Docker container) that always starts the same way |
| **VS Code in the browser** | A full-featured code editor that runs remotely — no install needed |
| **git push** | Saving your local changes to GitHub so the whole team can see them |

**The big idea**: You can go from zero to coding in minutes, on any device, anywhere in the world.

---

## 📋 Step 2: Use a Custom Image

### 🤔 Why Does This Matter?

The default Codespace GitHub gives you is super powerful — it has tons of tools. But that means it's also *huge* and *slow to start up*. More importantly, **it's not version-controlled**.

Imagine your team uses Python 3.10, but the default image keeps changing. One day it has Python 3.10, next month it upgrades to Python 3.12, and suddenly your code breaks. 😱

By **defining our own container configuration**, we can:
- Lock in exactly which tools and versions we need
- Make it reproducible for every developer on the team
- Store the configuration in the repository so it's tracked in Git

### 📸 Creating the Configuration File

**What you do**: Create a new file called `.devcontainer/devcontainer.json` in your project.

```bash
mkdir -p .devcontainer
touch .devcontainer/devcontainer.json
```

> 💡 **Why the dot prefix?** Files and folders starting with `.` are "hidden" in most operating systems. They're usually configuration files that you don't want cluttering up your project view. Git, VS Code, and other tools use this convention a lot.

Open the new file and add this content:

```json
{
  "name": "Basic Dev Environment",
  "image": "mcr.microsoft.com/devcontainers/base:debian"
}
```

Let's break that down:
- `"name"` — A human-friendly name for your environment (shows up when creating a Codespace)
- `"image"` — The Docker image to use. This is Microsoft's official **Debian Linux** base image. Debian is a popular, stable version of Linux used by many servers and developers.

### 📸 Rebuilding the Container

After saving the file, VS Code shows a notification asking if you want to rebuild. Click **Rebuild** (or use Command Palette → `Codespaces: Rebuild Container`):

![Rebuild Codespace Command](https://github.com/zainkhan1994/skills-code-with-codespaces/blob/main/.github/images/rebuild-codespace-command.png?raw=true)

After rebuilding, try the version check again:

```bash
node --version
dotnet --version
python --version
gh --version
```

This time... **nothing is installed!** 😮 That's expected — the base Debian image is a clean slate. We'll add tools in the next step.

### 📸 Committing the Configuration

```bash
git add '.devcontainer/devcontainer.json'
git commit -m 'feat: Add codespace configuration'
git push
```

### ✅ What I Took Away from Step 2

| Concept | What It Means |
|---------|---------------|
| **devcontainer.json** | The config file that tells GitHub what kind of environment to build |
| **Docker image** | A pre-built template for a computer environment (like a recipe for a computer) |
| **Debian** | A popular flavor of Linux, great for development |
| **Version-controlled environment** | The Codespace setup is stored in Git, so everyone gets the same environment |

**The big idea**: By committing `.devcontainer/devcontainer.json`, your environment is now part of the code. Any teammate who clones this repo and opens a Codespace gets the *exact same setup automatically*.

---

## 📋 Step 3: Add Features, Extensions, and Scripts

### 🤔 Why Customize Further?

Our base Debian image is clean but empty. We need Python for our project, the right VS Code extensions to work efficiently, and maybe some fun extras. The Dev Container spec gives us a clean way to add all of this.

### 📸 Adding Python via Features

**Dev Container Features** are pre-packaged bundles of tools you can add with just one line of config. No need to write your own installation scripts!

The updated `devcontainer.json` after adding the Python feature:

```json
{
  "name": "Basic Dev Environment",
  "image": "mcr.microsoft.com/devcontainers/base:debian",
  "features": {
    "ghcr.io/devcontainers/features/python:1": {
      "installTools": true,
      "version": "3.10"
    }
  }
}
```

> 💡 **What is ghcr.io?** That stands for **GitHub Container Registry** — GitHub's own place to store and share Docker images and dev container features. It's like an app store, but for developer tools!

You can add a feature using VS Code's Command Palette (`Ctrl+Shift+P`) → `Codespaces: Add Dev Container Configuration Files...` → `Modify your active configuration...` → search for Python.

### 📸 Adding VS Code Extensions

Extensions are plugins that add features to VS Code. For Python development, you want:
- **ms-python.python** — Adds Python syntax highlighting, autocomplete, and debugging
- **ms-python.debugpy** — The Python Debugger extension for stepping through code

![Python Extensions](https://github.com/zainkhan1994/skills-code-with-codespaces/blob/main/.github/images/python-extensions.png?raw=true)

To add them, right-click each extension and select **"Add to devcontainer.json"**:

![Add to devcontainer button](https://github.com/zainkhan1994/skills-code-with-codespaces/blob/main/.github/images/add-to-devcontainer-button.png?raw=true)

This adds the `customizations` block:

```json
"customizations": {
  "vscode": {
    "extensions": [
      "ms-python.python",
      "ms-python.debugpy"
    ]
  }
}
```

> 💡 **Why this is awesome**: Every developer who opens this project in a Codespace automatically gets the right extensions installed. No more "oh you need to install the Python extension" during onboarding!

### 📸 Adding a Post-Create Script

After the container is built, you can run a script to do final setup. This is called the `postCreateCommand`. Let's create a fun one that installs `sl` — a terminal animation of a steam locomotive 🚂!

Create the file `.devcontainer/postCreate.sh`:

```bash
#!/bin/bash

sudo apt-get update
sudo apt-get install -y sl
echo "export PATH=\$PATH:/usr/games" >> ~/.bashrc
echo "export PATH=\$PATH:/usr/games" >> ~/.zshrc
```

Make it executable:

```bash
chmod +x .devcontainer/postCreate.sh
```

Then add the `postCreateCommand` to your `devcontainer.json`:

```json
"postCreateCommand": ".devcontainer/postCreate.sh"
```

### The Complete devcontainer.json

Here's what the final file looks like:

```json
{
  "name": "Basic Dev Environment",
  "image": "mcr.microsoft.com/devcontainers/base:debian",
  "features": {
    "ghcr.io/devcontainers/features/python:1": {
      "installTools": true,
      "version": "3.10"
    }
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-python.python",
        "ms-python.debugpy"
      ]
    }
  },
  "postCreateCommand": ".devcontainer/postCreate.sh"
}
```

### 📸 Verifying Everything Works

After committing and rebuilding, check that:
1. Python 3.10 is installed: `python --version` → `Python 3.10.x`
2. The Python extensions are enabled (check Extensions tab in VS Code)
3. The steam locomotive works: `sl` → 🚂💨

You can also use VS Code's **Run and Debug** panel to run your Python code with breakpoints:

![Run and Debug Start Button](https://github.com/zainkhan1994/skills-code-with-codespaces/blob/main/.github/images/run-and-debug-start-button.png?raw=true)

Commit and push all the changes:

```bash
git add '.devcontainer/devcontainer.json'
git add '.devcontainer/postCreate.sh'
git commit -m 'feat: Add features, extensions, and postCreate script'
git push
```

### ✅ What I Took Away from Step 3

| Concept | What It Means |
|---------|---------------|
| **Dev Container Features** | Pre-packaged tools you can add with one line (like Python, Node, Git) |
| **Customizations** | VS Code settings and extensions baked into the environment config |
| **postCreateCommand** | A script that runs once after your Codespace is created |
| **Lifecycle scripts** | Different hooks (onCreate, postCreate, postStart) for different moments in a container's life |

**The big idea**: You can build a fully customized developer environment — specific language version, editor extensions, and setup scripts — all defined in code. Anyone joining your team gets all of this automatically on day one.

---

## 📋 Step 4: Test It Like a New Developer

### 🤔 Why This Step Matters

All of this configuration is pointless if it doesn't actually work for someone fresh! This step simulates what it's like to be a new developer joining a team.

### 📸 Delete the Old Codespace

Go back to GitHub, click the green **<> Code** button, and select the **Codespaces** tab:

![Codespaces List](https://github.com/zainkhan1994/skills-code-with-codespaces/blob/main/.github/images/codespaces-list.png?raw=true)

Find your Codespace, click the **`...`** menu, and select **Delete**:

![Delete Codespace Command](https://github.com/zainkhan1994/skills-code-with-codespaces/blob/main/.github/images/delete-codespace-command.png?raw=true)

> 💡 **Why delete it?** We want to start completely fresh — like a new team member who has never used this project before. This tests whether our configuration is complete and correct.

### 📸 Create a Brand New Codespace

Click the green **<> Code** button again → **Codespaces** tab → **Create codespace on main** (or the `+` icon).

Wait a few minutes while it:
1. Pulls the Debian Docker image
2. Installs the Python 3.10 feature
3. Installs the Python VS Code extensions
4. Runs the `postCreate.sh` script

When it's done, verify everything works:
- `python --version` → Python 3.10
- `sl` → 🚂 Steam locomotive animation!
- Python extensions show as installed in VS Code

### 📸 Final Check-In

Once you've verified everything, post a comment on the exercise issue to let GitHub know you're done:

```
Hey @professortocat, I've finished testing out my new Codespace.
I'm ready to review!
```

### ✅ What I Took Away from Step 4

| Concept | What It Means |
|---------|---------------|
| **Onboarding experience** | What a new developer goes through on their first day with a project |
| **Reproducibility** | Same setup, every time, for everyone |
| **Self-service environment** | Developers don't need to ask IT for help — the config sets itself up |

**The big idea**: A good dev container means zero friction for anyone joining your project. Write the config once, and everyone benefits forever.

---

## 🎓 Overall Summary & Key Takeaways

Congratulations! You just completed a real professional developer workflow! Here's everything you learned:

| Step | What You Did | Key Skill |
|------|-------------|-----------|
| **1** | Started a Codespace, ran Python, pushed code | Cloud development basics |
| **2** | Created `devcontainer.json` with a custom image | Dev container configuration |
| **3** | Added language features, extensions, and a setup script | Advanced environment customization |
| **4** | Deleted and recreated the Codespace from scratch | Validating reproducibility |

### 🌍 Why This Matters in the Real World

- **At big tech companies** (Google, Microsoft, Meta), onboarding a new engineer can take weeks of setup. Companies that use Dev Containers cut that to **minutes**.
- **Open source projects** on GitHub use Codespaces so that *anyone* can contribute without a complicated setup guide.
- **You**, as a student, can now work on your coding projects from any device — school computers, library PCs, tablets — without asking anyone to install anything.

### 🔗 Learn More

- [GitHub Codespaces Documentation](https://docs.github.com/en/codespaces)
- [Dev Container Specification](https://containers.dev/)
- [Available Dev Container Features](https://containers.dev/features)
- [VS Code Extensions Marketplace](https://marketplace.visualstudio.com/VSCode)

---

*This lab was completed as part of the [GitHub Skills: Code with Codespaces](https://github.com/skills/code-with-codespaces) exercise.*
