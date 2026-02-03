# Academic Diagram Generator

**Generate publication-ready academic illustrations from methodology descriptions using Claude Code.**

Inspired by [PaperBanana](https://dwzhu-pku.github.io/PaperBanana/) (Zhu et al., 2026) — an agentic framework that automates NeurIPS-quality diagram generation.

## Features

- **5-Agent Pipeline**: Retriever → Planner → Stylist → Visualizer → Critic
- **3-Round Refinement**: Iterative improvement for publication quality
- **Multiple Output Formats**: SVG, Chart.js, Mermaid, ASCII
- **NeurIPS Aesthetic**: Soft pastels, clean typography, professional layout
- **Full Academic Suite**: Methodology diagrams, statistical plots, tables, pseudocode

---

## Installation

### One-Liner (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/FrancyJGLisboa/academic-diagrams/main/install.sh | bash
```

### Using OpenSkills

```bash
npx openskills install FrancyJGLisboa/academic-diagrams
```

### Manual Installation

```bash
git clone https://github.com/FrancyJGLisboa/academic-diagrams.git
cp -r academic-diagrams/skills/academic-diagram ~/.claude/skills/
```

### Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/FrancyJGLisboa/academic-diagrams/main/uninstall.sh | bash
```

Or manually:
```bash
rm -rf ~/.claude/skills/academic-diagram
```

---

## Verify Installation

Restart Claude Code, then invoke:

```
/academic-diagram
```

---

## Quick Start

After installation, use the skill in Claude Code:

```
/academic-diagram

Methodology: Our model consists of three stages: (1) a BERT encoder that
processes input tokens, (2) a cross-attention layer that fuses visual and
textual features, and (3) a classification head with softmax output.

Caption: Overview of our multimodal fusion architecture.

Type: Framework diagram
Format: SVG
```

---

## Supported Diagram Types

| Type | Format | Best For |
|------|--------|----------|
| **Methodology Diagrams** | SVG | Framework overviews, pipelines, architecture |
| **Statistical Plots** | Chart.js HTML | Bar charts, line charts, heatmaps, scatter plots |
| **Tables** | HTML/Markdown | Results, comparisons, ablations |
| **Pseudocode** | ASCII/Unicode | Algorithms, mathematical notation |
| **Flowcharts** | Mermaid | Simple pipelines (GitHub-native) |

---

## The 5-Agent Pipeline

```
┌─────────────────────────────────────────────────────────────┐
│                    LINEAR PLANNING PHASE                     │
│                                                              │
│   ┌──────────┐     ┌──────────┐     ┌──────────┐           │
│   │ RETRIEVER│ ──► │ PLANNER  │ ──► │ STYLIST  │           │
│   │(examples)│     │(describe)│     │(aesthetic)│           │
│   └──────────┘     └──────────┘     └──────────┘           │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│              ITERATIVE REFINEMENT LOOP (T=3)                │
│                                                              │
│   ┌──────────┐              ┌──────────┐                    │
│   │VISUALIZER│ ◄──────────► │  CRITIC  │                    │
│   │(SVG/code)│    refine    │(evaluate)│                    │
│   └──────────┘              └──────────┘                    │
└─────────────────────────────────────────────────────────────┘
```

---

## NeurIPS 2025 Style Guide

The skill applies the **"Soft Tech & Scientific Pastels"** aesthetic:

| Element | Style |
|---------|-------|
| **Backgrounds** | Light pastels (#F5F5DC, #E6F3FF, #E0F2F1) |
| **Active Modules** | Medium saturation (Blue/Orange, Teal/Pink) |
| **Trainable** | Warm tones (Red, Orange, Pink) |
| **Frozen** | Cool tones (Grey, Ice Blue, Cyan) |
| **Shapes** | Rounded rectangles (8-12px radius) |
| **Typography** | Sans-serif for labels, Serif italic for math |

---

## Examples

See the [examples/](examples/) folder for sample outputs:

- `human_cell.html` — Biological cell diagram with labeled organelles

---

## Requirements

- [Claude Code](https://claude.ai/code) with an active subscription
- Claude Code 2.0+ with Skills support

---

## Credits

This skill is inspired by:

**PaperBanana: Automating Academic Illustration for AI Scientists**
Dawei Zhu, Rui Meng, Yale Song, Xiyu Wei, Sujian Li, Tomas Pfister, Jinsung Yoon
Peking University & Google Cloud AI Research
[Paper](https://dwzhu-pku.github.io/PaperBanana/) | [arXiv:2601.23265](https://arxiv.org/abs/2601.23265)

Key insight from the paper:
> "Randomly selected examples work nearly as well as semantically matched ones. What matters is showing the model what good diagrams look like."

---

## License

MIT License — see [LICENSE](LICENSE)

---

## Contributing

Contributions welcome! Please open an issue or PR.

---

*Generated with Claude Code Skills | v1.0.0*
