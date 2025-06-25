# SwiftMC

<a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-6.0+-F05138?style=&logo=swift" alt="Requires at least Swift 6.0"></a> <img src="https://img.shields.io/badge/Platforms-Any-gold"> <a href="https://discord.com/invite/VyuFQUpcUz"><img src="https://img.shields.io/badge/Chat-Discord-7289DA?style=&logo=discord"></a> <a href="https://github.com/RandomHashTags/swift-mc/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-Apache_2.0-blue" alt="Apache 2.0 License"></a>

## Table of Contents

- [Why](#why)
  - [Why Swift](#why-swift)
- [Philosophy](#philosophy)
- [Current Features](#current-features)
  - [API](#api)
  - [Implementation](#implementation)
- [Contributing](#contributing)
- [Funding](#funding)

## Why

Minecraft performance is laughably poor. I also disagree with some of the changes Mojang has done to the game (chat reporting, server banning, EULA, etc).

### Why Swift

I considered using C or Rust initially. The problem with those languages is that they don't offer the best developer experience when writing mods/plugins. I want this project to offer the easiest entry for mods/plugins, while not compromising security, performance or syntax.

## Philosophy

This server is to mimic the vanilla Minecraft experience in all aspects, supporting all versions and the same world generation. The only logic added that doesn't adhere to vanilla Minecraft should be performance and memory improvements OR third-party additions.

## Current Features

### API

#### Legend

- ✅: feature complete
- 🚧: active development
- ⚠️: halted development (due to other features being needed first)
- ❌: not started

_Progress as of Nov 28, 2024_

| Feature | Protocol | Java | Bedrock |
| :---: | :---: | :---: | :---: |
| Advancements | ✅ | ❌ | ❌ |
| Attributes | ✅ | ❌ | ❌ |
| Biomes | ✅ | ❌ | ❌ |
| Biome Generation | ❌ | ❌ | ❌ |
| Blocks | 🚧 | ❌ | ❌ |
| Chat | ✅ | ❌ | ❌ |
| Commands | 🚧 | ❌ | ❌ |
| Chunks | 🚧 | ❌ | ❌ |
| Chunk Generation | ❌ | ❌ | ❌ |
| Collision | ⚠️ | ❌ | ❌ |
| Difficulties | ✅ | ❌ | ❌ |
| Enchantments | ✅ | ❌ | ❌ |
| Ender Dragon Battle | ✅ | ❌ | ❌ |
| Entities | 🚧 | ❌ | ❌ |
| Events | ⚠️ | ❌ | ❌ |
| Game Modes | ✅ | ❌ | ❌ |
| Game Rules | ✅ | ❌ | ❌ |
| Inventories | 🚧 | ❌ | ❌ |
| Items | 🚧 | ❌ | ❌ |
| Item Meta | ✅ | ❌ | ❌ |
| Item Flags | ✅ | ❌ | ❌ |
| Location | 🚧 | ❌ | ❌ |
| Loot | 🚧 | ❌ | ❌ |
| Materials | ✅ | ❌ | ❌ |
| Merchant/Villager Trading | ✅ | ❌ | ❌ |
| NBT | ⚠️ | ❌ | ❌ |
| Packets | ✅ | ⚠️ | ❌ |
| Particles | 🚧 | ❌ | ❌ |
| Permissions | 🚧 | ❌ | ❌ |
| Plugins/Mods | ❌ | ❌ | ❌ |
| Potions | ✅ | ❌ | ❌ |
| Raids | ⚠️ | ❌ | ❌ |
| Scoreboards | ✅ | ❌ | ❌ |
| Server | 🚧 | ❌ | ❌ |
| Server-Client communication | ⚠️ | ❌ | ❌ |
| Structures | ✅ | ❌ | ❌ |
| Sounds | ✅ | ❌ | ❌ |
| Spawners | ⚠️ | ❌ | ❌ |
| Statistics | ✅ | ❌ | ❌ |
| Ticks | ✅ | ❌ | ❌ |
| Vibrations | ❌ | ❌ | ❌ |
| Weather | ✅ | ❌ | ❌ |
| Worlds | 🚧 | ❌ | ❌ |
| World Border | ✅ | ❌ | ❌ |
| World Generation | ❌ | ❌ | ❌ |

### Implementation

I want to get the Blueprint finalized before I work on implementions.

### ❌ Java

### ❌ Bedrock

## Contributing

Adding/improving functionality is always welcome, just make a PR. 

## Funding

Support the development of this project by sponsoring the developers.
- [RandomHashTags](https://github.com/sponsors/RandomHashTags)