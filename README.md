# Cadence

*A haptic-first breathing companion designed for moments of overwhelm.*

------------------------------------------------------------------------

## Overview

Cadence is a minimal, adaptive breathing experience built to provide
grounding during moments of anxiety, stress, or emotional overload.

In overwhelming moments, reading instructions, navigating complex
interfaces, or processing too much information can increase stress.
Cadence removes cognitive friction and replaces it with rhythm.

Instead of asking the user to think more, it offers:

-   Subtle motion\
-   Calm color transitions\
-   Synchronized haptic guidance\
-   Gentle emotional reflection

The goal is not to "fix" anxiety --- but to provide presence through
cadence.

------------------------------------------------------------------------

## The Empathy Behind Cadence

When someone feels overwhelmed:

-   Visual clutter increases stress\
-   Instructions feel heavy\
-   Audio can feel overstimulating\
-   Too many choices create paralysis

Cadence was designed around one principle:

> In moments of anxiety, reduce complexity. Increase rhythm.

Rather than tracking performance or asking users to analyze their
emotions, Cadence provides a structured breathing experience supported
by tactile feedback and calm visuals.

------------------------------------------------------------------------

## Core Experience

### 1. Start

The experience begins with a simple invitation:

**"Take a Moment."**

No complex setup. No onboarding flow. Immediate entry into the breathing
session.

------------------------------------------------------------------------

### 2. Breathing Session

The breathing session includes:

-   A softly expanding and contracting orb\
-   Background color transitions synchronized with inhale and exhale\
-   Core Haptics guiding the rhythm\
-   A focused 60-second breathing cycle

The entire interface "breathes" together --- background, orb, and haptic
pulse.

There are no timers or metrics shown during the session. The experience
centers on rhythm, not performance.

------------------------------------------------------------------------

### 3. Reflection

After each session, users are asked:

**"How are you feeling now?"**

Options:

-   Lighter\
-   About the Same\
-   Still Overwhelmed

Reflection is optional and pressure-free.

Once selected:

-   A gentle supportive message appears\
-   The next breathing session adapts subtly

There is no forced journaling, analysis, or emotional labeling beyond
this simple check-in.

------------------------------------------------------------------------

## Adaptive Rhythm System

Cadence includes a lightweight adaptive breathing model.

Based on user reflection:

-   **Lighter** → Standard rhythm (4s inhale / 4s exhale)\
-   **About the Same** → Slightly longer exhale\
-   **Still Overwhelmed** → Slower inhale and longer exhale

The adaptation is subtle and not visually emphasized. It quietly
personalizes the next session.

Technically, this is implemented using a Swift `actor`
(`AdaptiveRhythmManager`) to ensure concurrency-safe state management.

------------------------------------------------------------------------

## Technical Highlights

Cadence is built using:

-   SwiftUI\
-   Core Haptics\
-   Actor-based state management\
-   Clean view separation\
-   No external dependencies\
-   Fully offline functionality

Key components:

-   `StartView`
-   `BreathingView`
-   `ReflectionView`
-   `AdaptiveRhythmManager`
-   `HapticsManager`
-   `SessionStore`

The architecture follows single-responsibility principles and keeps UI,
logic, and haptic control clearly separated.

------------------------------------------------------------------------

## Design Philosophy

Cadence follows three core principles:

### 1. Minimal Cognitive Load

No dashboards, analytics, or complex navigation.

### 2. Emotional Neutrality

The app does not diagnose or interpret feelings. It offers space, not
judgment.

### 3. Physical Grounding

Haptic feedback provides a body-based anchor, supporting regulation
through breath rhythm rather than cognitive effort.

------------------------------------------------------------------------

## Accessibility Considerations

-   No required reading during the breathing session\
-   High-contrast breathing text\
-   No reliance on audio\
-   Reflection is optional\
-   Fully usable without entering personal data

------------------------------------------------------------------------

## What Makes Cadence Different

Many breathing apps include:

-   Progress rings\
-   Voice instructions\
-   Streak tracking\
-   Performance analytics

Cadence removes these elements and focuses on:

Presence.\
Rhythm.\
Subtle adaptation.

It is intentionally minimal and private.

------------------------------------------------------------------------

## Future Directions

Potential expansions:

-   Time-of-day rhythm adjustments\
-   Optional mood trend insights (stored locally only)\
-   Apple Watch haptic-only mode\
-   Custom rhythm presets

All while preserving simplicity and privacy.

------------------------------------------------------------------------

## Closing

Cadence is not a productivity tool.\
It is not a medical device.

It is a small digital pause --- guided by rhythm.

Sometimes, that is enough.
