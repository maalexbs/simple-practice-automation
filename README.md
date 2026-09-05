# SimplePractice UI Automation Test Suite

[![Ruby](https://img.shields.io/badge/Ruby-3.x-red.svg)](https://www.ruby-lang.org/)
[![RSpec](https://img.shields.io/badge/RSpec-3.x-green.svg)](https://rspec.info/)
[![Capybara](https://img.shields.io/badge/Capybara-3.x-blue.svg)](https://github.com/teamcapybara/capybara)
[![Pattern](https://img.shields.io/badge/Design_Pattern-Page_Object_Model-purple.svg)]()

An automated end-to-end (E2E) UI testing suite for SimplePractice using **Ruby**, **RSpec**, **Capybara**, and **Selenium WebDriver**. This project adheres to software quality engineering best practices, including the **Page Object Model (POM)** pattern, component-based abstractions, **YARD** standardized code documentation, and secure environment variable management.

---

## 📋 Table of Contents
1. [Test Walkthrough & Logic](#-test-walkthrough--logic)
2. [Tech Stack & Architecture](#-tech-stack--architecture)
3. [Prerequisites](#-prerequisites)
4. [Repository Setup Guide](#-repository-setup-guide)
5. [Environment Variables Configuration](#-environment-variables-configuration)
6. [Executing Tests](#-executing-tests)
---

## 🧪 Test Walkthrough & Logic

The automated test suite validates the **"Create Client"** workflow across multiple client statuses (`Active` and `Prospective`) to verify UI feedback and data persistence in the main client index.

### Step-by-Step Test Execution Flow:
1. **Authentication (`LoginPage`):**
   - Navigates to the login landing page.
   - Securely inputs user credentials from environment variables (`SIMPLEPRACTICE_USER`, `SIMPLEPRACTICE_PASSWORD`).
   - Asserts that login succeeded by verifying redirection away from `/login`.

2. **Client Creation (`ClientModalComponent`):**
   - Triggers the creation flow by clicking the navigation action button and opening the "Create Client" modal overlay.
   - Generates randomized, realistic client names using `Faker`.
   - Selects the target status category from the dropdown menu (iterating over `Active` and `Prospective`).
   - Submits the form and asserts the immediate appearance of the `"Client created"` toast notification.

3. **Index Search & Verification (`ClientIndexPage`):**
   - Navigates to the primary **Clients Index** page (`/clients`) via the sidebar menu.
   - Applies conditional status filters (e.g., filtering for `Prospective` status when required).
   - Searches for the generated full name in the search bar.
   - Asserts that the created client entry is present in the filtered result list.

---

## 🛠️ Tech Stack & Architecture

- **Language:** Ruby 3.x
- **Testing Framework:** RSpec 3.x
- **Browser Automation DSL:** Capybara 3.x
- **Browser Driver:** Selenium WebDriver (Chrome)
- **Data Generation:** Faker
- **Documentation Standard:** YARD
- **Design Pattern:** Page Object Model (POM) with Component Abstraction

---

## ⚙️ Prerequisites

Before running the test suite, ensure the following are installed on your environment:

- **Ruby** (`>= 3.0.0`)
- **Bundler** (`gem install bundler`)
- **Google Chrome** (latest version)
- **ChromeDriver** (managed automatically via Selenium WebDriver)

---

## 🚀 Repository Setup Guide

Follow these steps to clone and initialize the local environment:

### 1. Clone the Repository
```bash
git clone https://github.com/maalexbs/simple-practice-automation.git
cd simple-practice-automation
```

### 2. Install Gem Dependencies
```bash
bundle install
```

---

## 🔐 Environment Variables Configuration

To keep credentials secure, the test suite reads user credentials from environment variables rather than hardcoding them into spec files.

### Setting Up Credentials

#### On macOS / Linux:
```bash
export SIMPLEPRACTICE_USER="your_email@example.com"
export SIMPLEPRACTICE_PASSWORD="your_secure_password"
```

#### On Windows (PowerShell):
```powershell
$env:SIMPLEPRACTICE_USER="your_email@example.com"
$env:SIMPLEPRACTICE_PASSWORD="your_secure_password"
```

*Alternatively, you can create a `.env` file in the root directory (make sure it is listed in `.gitignore`):*
```env
SIMPLEPRACTICE_USER=your_email@example.com
SIMPLEPRACTICE_PASSWORD=your_secure_password
```

---

## ▶️ Executing Tests

### Run All Tests (Standard Output)
```bash
bundle exec rspec
```

### Run Tests with Detailed Documentation Format (Recommended for Evaluation)
```bash
bundle exec rspec --format documentation
```

### Expected Execution Output:
```text
SimplePractice Client Creation Test
  creates a new client with 'Active' status and verifies presence in the client list
  creates a new client with 'Prospective' status and verifies presence in the client list

Finished in 32.14 seconds (files took 1.2 seconds to load)
2 examples, 0 failures
```

---

## 📂 Project Structure & YARD Docs
```
.
├── pages/
│   ├── base_page.rb            # Core parent object with Capybara helper extensions
│   ├── login_page.rb           # Authentication page object
│   ├── client_index_page.rb    # Client index list, filtering, & search page object
│   └── components/
│       └── client_modal.rb     # Component object for the client creation modal
├── spec/
│   ├── spec_helper.rb          # RSpec and Capybara global configuration
│   └── create_client_spec.rb   # Feature spec covering the client creation flow
├── .env.example                # Template for environment configuration
├── Gemfile                     # Project gem dependencies
├── Gemfile.lock                # Frozen dependency tree
└── README.md                   # Evaluator and setup guide
```