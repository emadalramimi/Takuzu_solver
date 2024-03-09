# SAE University Project: Takuzu Solver

Welcome to the SAE project on Takuzu solver. This repository offers an Ada-based solution for automating Takuzu (binary puzzles) resolutions, featuring modules for grid representation, coordinates management, rules validation, and systematic puzzle solving.

## Project Overview

Takuzu, a logic-based binary puzzle, requires filling a grid with zeros and ones under specific rules. Our project aims to develop an automated solver in Ada, focusing on algorithmic efficiency, code readability, and modular design.

### Features

- **Grid Representation**: Custom data types for accurate Takuzu grids modeling.
- **Coordinate System**: Manages cell positions for easy manipulation.
- **Rule Validation**: Checks adherence to Takuzu rules for row/column uniqueness and balance of zeros and ones.
- **Solver Algorithm**: Logical approach to systematically fill the grid, applying possible moves until completion.

## Getting Started

### Prerequisites

Ensure the GNAT programming environment is set up for Ada program compilation.

### Compilation

Navigate to the root directory with `.adb` and `.ads` files and compile using:

```bash
gnatmake resolution_takuzu.adb
```

This generates resolution_takuzu executable for solving puzzles.

### Running the Solver
To run:

```bash
./resolution_takuzu
```
Follow instructions for inputting or loading a Takuzu puzzle.

Project Structure
chiffre.ads & chiffre.adb: Defines puzzle digits (0 and 1).
coordonnee.ads & coordonnee.adb: Manages puzzle grid coordinates.
grille.ads & grille.adb: Represents the Takuzu grid.
rangee.ads & rangee.adb: Handles grid rows and columns.
resolution_takuzu.ads & resolution_takuzu.adb: Main program logic for puzzle solving.
Contributing
Contributions to improve the Takuzu solver are welcome. Fork the repository, make your changes, and submit a pull request with your enhancements.

### License
This Takuzu Solver is provided under the MIT License. See the LICENSE file for more details.
