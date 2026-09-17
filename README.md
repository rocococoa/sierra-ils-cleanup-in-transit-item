# Sierra ILS Cleanup - In Transit Item Automated Report
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![Python](https://img.shields.io/badge/python-%233670A0.svg?style=for-the-badge&logo=python&logoColor=ffdd54)

## Summary
**What it does:** This weekly automated report captures items that have been in-transit for over a week.

**Impact:** Optimizes database management within the Sierra ILS by scheduling and automating a cleanup task, previously a manual process. The resulting automated report supports accuracy of the collection inventory.

## Data Pipeline Architecture
This repository features an automated data pipeline that generates, formats, and distributes Excel reports via email. The system integrates Windows Task Scheduler, a Batch script, SQL, and Python to handle the end-to-end workflow without manual intervention. The automated process is fully productionized within a Windows environment.

**Workflow Overview:**

[Windows Task Scheduler] ──> [orchestrator.bat] ──> [main.py] ──> [Sub-modules & SQL] ──> [Report delivered to Email Inbox]

**Repository Contents & Security Note:**

To comply with data security policies, the core Python automation scripts have been omitted from this public repository. Instead, this repository provides:
- The SQL Data-Extraction Script: The exact logic used to pull and aggregate Sierra ILS production data.
- Manual Alternative: If you do not have an automated environment, you can run the provided SQL script manually in pgAdmin and export the results directly to a spreadsheet.

## Acknowledgments
The automated pipeline is built off the brilliant work of Gem Stone-Logan. For more information on implementing the automated system, please see her IUG presentations, [Automating Reports with Python.](https://www.gemstonelogan.com/presentations.html)


