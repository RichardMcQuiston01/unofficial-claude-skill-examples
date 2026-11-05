---
name: ui-design
description: My visual design language, color palette, typography, and accessibility standards for web UI. Use whenever building or reviewing HTML/TypeScript/JavaScript/CSS user interfaces.
---

# UI Design & Accessibility

- **Visual language:** Modern, clean, flat design. Use flat icons (no skeuomorphism, gradients, or drop shadows beyond subtle elevation). Favor whitespace and clear hierarchy.
- **Color:** Use dark green as the primary accent/brand color. Build a small, consistent palette around it via Tailwind theme tokens rather than ad-hoc hex values.
- **Typography:** Sans-serif throughout (e.g. the system sans stack or a single bundled sans-serif family).
- **Contrast:** Meet WCAG 2 contrast requirements — at minimum AA (4.5:1 for normal text, 3:1 for large text and UI/graphical elements). Verify the dark-green accent against its backgrounds and the chosen accent foreground.
- **Accessibility:** Full keyboard navigation (logical tab/focus order, visible focus indicators, no keyboard traps). Provide `title`/`aria-*` attributes and accessible names on interactive controls and icon-only buttons. Use semantic HTML and associate `<label>`s with inputs.
