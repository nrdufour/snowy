# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is "Snowy" - Nicolas Dufour's NixOS flake configuration for laptop setup. It's a personal infrastructure-as-code repository that manages system configuration using Nix flakes and modular "personalities".

## Architecture

The codebase follows a modular NixOS configuration structure:

- **Root flake.nix**: Main entry point defining system outputs for the "calypso" host
- **nixos/hosts/**: Host-specific configurations (currently only `calypso`)
- **nixos/personalities/**: Modular feature sets imported by hosts:
  - `base`: Core system configuration
  - `development`: Development tools and environments
  - `laptop`: Laptop-specific settings
  - `ham`: Amateur radio tools
  - `chat`: Communication applications
  - `backups`: Backup configurations
  - `knowledge`: Knowledge management tools

The system uses SOPS for secret management with age encryption keys defined in `.sops.yaml`.

## Common Commands

All development tasks are managed through just (command runner):

### Core NixOS Operations
- `just nix-update` - Update flake lock file (`nix flake update`)
- `just nix-check` - Validate flake configuration (`nix flake check`)
- `just nix-test` - Test deployment without boot changes (`nixos-rebuild test`)
- `just nix-switch` - Deploy and create new boot generation (`nixos-rebuild switch`)

### Secret Management
- `just sops-update` - Update all SOPS secret files with latest keys

### Available Tasks
- `just` or `just --list` - List all available tasks

## Dependencies

- Nix with flakes enabled
- SOPS for secret management
- just command runner for build automation
- Age encryption for secrets

## Host Configuration

The primary host "calypso" is configured for an ASUS ROG Strix G513IM laptop and includes hardware-specific modules from nixos-hardware.