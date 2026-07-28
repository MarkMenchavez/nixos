
# Project Overview: Customized NixOS Environment

This repository contains the declarative configuration files (primarily Nix) for a highly customized Linux environment managed via NixOS. It structures system settings into modular components that allow for reproducible and consistent setups, heavily focusing on desktop environments, virtualization, and command-line utilities.

## 🎯 Purpose of the Project
The primary goal of this project is to define, manage, and reproduce a complex, layered operating system configuration using the declarative power of Nix. It aims to provide a reproducible setup that integrates specific desktop environments (e.g., Hyprland), system services, and specialized hardware setups (e.g., QEMU virtualization) via a modular approach.

## 🏗️ Architecture & Components
The project follows a modular architecture where core system capabilities are defined in reusable modules, which are then composed into concrete host configurations.

### Main Components:

1.  **Modules Layer (`modules/`):**
    *   **System Modules:** Define fundamental operating system properties (e.g., networking, storage, power management, boot configuration).
    *   **Desktop Modules:** Define settings for graphical environments and window managers (e.g., Hyprland setup, fonts, graphics).
    *   **CLI Modules:** Provide configurations for command-line tools and utilities (e.g., fzf, zoxide).
    *   **Virtualization Modules:** Handle specific hardware/software setups (e.g., QEMU integration).

2.  **Host Layer (`hosts/`):**
    *   This layer is where the modular system is assembled for specific machines or environments. Each entry in this directory represents a complete, deployable configuration (e.g., `qemu-nixos-hyprland`).
    *   These configurations link the general modules to specific hardware definitions (`hardware-configuration.nix`) to achieve a concrete system state.

3.  **User Layer (`users/home/`):**
    *   Contains user-specific settings and application preferences (e.g., window manager configurations, application settings). These files act as the final layer of customization on top of the Nix base.

## ⚙️ Key Interactions
The system functions by: **Modules $\rightarrow$ Hosts $\rightarrow$ Users**. Modules provide the reusable building blocks; Hosts instantiate these modules onto specific hardware contexts; and User configurations apply final, personalized touches.

## 🚀 Development & Maintenance Notes

*   **Dependency Management:** The project uses Flakes (`flake.nix`) for dependency management. Ensure that all host configurations correctly reference and manage the pinned dependencies defined in the flake to guarantee reproducibility.
*   **Modularity Focus:** Maintain consistency within the `modules/` directory. When adding new features, ensure they follow established interface contracts to prevent breaking existing host configurations.
*   **Review Priority:** Prioritize auditing the interactions between modules and hosts to maintain configuration integrity across all defined systems.
