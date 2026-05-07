# LEO - Log Entry Organizer

A tiny Unix shell utility for quickly logging daily work activity throughout the day.

LEO was written after the all-too-common Friday afternoon request:

> "Send me a summary of everything you worked on this week."

Instead of trying to remember an entire week of tasks, LEO lets you rapidly append timestamped notes during the day from the command line. At the end of the week, your logs are already organized and ready to send as a report.

Originally written in 1993 for Linux/Unix systems.

---

## Features

- Extremely lightweight POSIX shell script
- Fast single-line logging from the terminal
- Supports piped input from standard input
- Creates one log file per day automatically
- Timestamped entries
- Simple review and editing modes
- No dependencies beyond standard Unix tools

---

## Example Output

```text
05/07/26, 08:05 --

Created account for John Doe in finance

05/07/26, 11:45 --

Validated last night's backups

05/07/26, 13:00 --

Team meeting
```

---

# Installation

Clone the repository:

```bash
git clone https://github.com/wkrik/leo.git
```

Make the script executable:

```bash
chmod +x leo
```

Optionally place it somewhere in your PATH:

```bash
sudo cp leo /usr/local/bin/
```

---

# Usage

## Single Line Entry

```bash
leo Replaced failed SSD in virtualization host
```

## Pipe Standard Input

```bash
cat meeting-notes.txt | leo
```

or

```bash
echo "Discussed quarterly infrastructure upgrades" | leo
```

## List Current Daily Log

```bash
leo -l
```

## Edit Current Daily Log

```bash
leo -e
```

---

# Log Storage

By default, logs are stored in:

```text
~/leo
```

Each day receives its own logfile using the format:

```text
YYMMDD-DayName
```

Example:

```text
260507-Thursday
```

---

# Example Workflow

Throughout the day:

```bash
leo Reset password for accounting user
leo Installed security updates on web server
leo Team meeting regarding backup retention policy
```

At the end of the week:

```bash
cat ~/leo/*
```

or combine specific days:

```bash
cat ~/leo/260505-* ~/leo/260506-* ~/leo/260507-*
```

Then paste the results directly into an email or report.

---

# Script Overview

| Option | Description |
|---|---|
| `leo text here` | Append single line entry |
| `leo -l` | List current daily log |
| `leo -e` | Edit current daily log |
| `stdin \| leo` | Append piped input |

---

# History

Written by Kirk Waingrow on 11/10/1993.

Inspired by Hal Pomeranz at QMS Inc., creator of:

```text
PLOD - Personal LOgging Device
```

---

# Why LEO?

Because nobody remembers what they worked on by Friday afternoon.

LEO keeps a running timestamped journal of daily work activity with almost zero friction.

Open a terminal, type one line, continue working.

---

# License

MIT License

Use it, modify it, improve it, and share it freely.


