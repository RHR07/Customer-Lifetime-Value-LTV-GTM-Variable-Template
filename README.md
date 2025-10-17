# Customer Lifetime Value (LTV) – GTM Web Variable Template

## Overview
The **Customer Lifetime Value (LTV) Variable** is a **Google Tag Manager (GTM) Web Variable Template** designed to track and calculate the lifetime value of a customer.  
This variable reads transaction values from the DataLayer and accumulates them to provide a **persistent LTV metric** that can be used in GA4, analytics reports, or marketing automation tools.

---

## Features
- Tracks **Customer Lifetime Value (LTV)** based on transaction events.  
- Reads DataLayer variables: `purchase` event and transaction value (`ecommerce.value`).  
- Compatible with GA4, Google Ads, and other analytics platforms.  
- Fully configurable via GTM Variable Template interface.  
- Uses **cookie or DataLayer storage** to persist cumulative value across sessions.  

---

## Variable Configuration

| Setting                   | Value / Description                                      |
|----------------------------|----------------------------------------------------------|
| **Variable Type**          | Customer Lifetime Value (LTV)                            |
| **Variable Permissions**   | 1. Read Built-in Event Name <br> 2. Read DataLayer Total Value |
| **Built-in Event Name**    | `{{Event}}` – GTM built-in event variable               |
| **DataLayer Event Name**   | `purchase` – Event that triggers LTV calculation        |
| **DataLayer Total Value**  | `{{ecommerce.value}}` – Value of the current transaction |

---

## How It Works

1. When a **DataLayer event** occurs (e.g., `purchase`), the variable checks if the current event matches the configured event name (`purchase`).  
2. The variable reads the **transaction value** from `{{ecommerce.value}}`.  
3. It retrieves the **existing lifetime value** from a cookie (`lifetime_value`) if available.  
4. Updates the cumulative value:
