Cadence

A haptic-first breathing companion for moments of overwhelm.

Overview

Cadence is a minimal, adaptive breathing experience designed to provide grounding during moments of anxiety, stress, or emotional overload.

In overwhelming moments, reading instructions or navigating complex interfaces can feel exhausting. Cadence removes cognitive friction and replaces it with:

Rhythmic motion

Subtle color transitions

Haptic guidance

Gentle reflection

The goal is not to “solve” anxiety — but to provide a calm, structured rhythm that supports the body and mind.

The Empathy Behind Cadence

When people feel anxious:

Visual noise increases stress

Instructions feel demanding

Sound can become overstimulating

Too many choices create paralysis

Cadence was built around a simple principle:

In moments of overwhelm, reduce thinking. Increase rhythm.

Instead of asking users to analyze, plan, or track progress, Cadence:

Guides breathing visually

Uses haptics to provide grounding

Offers a soft emotional check-in

Adapts subtly over time

No accounts.
No dashboards.
No performance metrics.

Just presence.

Core Experience
1. Start

The experience begins with a simple invitation:

“Take a Moment.”

No clutter. One action. Immediate entry into a breathing session.

2. Breathing Session

The breathing session is immersive and minimal:

A softly expanding and contracting orb

Background colors that shift with inhale and exhale

Core Haptics synchronized with breath rhythm

A 60-second guided cycle

The entire screen “breathes” together — background, orb, and haptic pulse.

There are no visible timers or performance indicators. The experience focuses entirely on rhythm and presence.

3. Reflection

After the session, users are asked:

“How are you feeling now?”

They can choose:

Lighter

About the Same

Still Overwhelmed

Reflection is optional and pressure-free.

Once selected:

A gentle supportive message appears

The breathing rhythm adapts subtly for the next session

Users can immediately return to the start screen.

No forced journaling.
No emotional analysis.
No judgment.

Adaptive Rhythm System

Cadence includes a lightweight adaptive breathing model.

Based on reflection:

Lighter → Standard rhythm (4s inhale / 4s exhale)

About the Same → Slightly longer exhale

Still Overwhelmed → Slower inhale + longer exhale

The adaptation is subtle and intentional. It does not announce itself or dramatize change.

Technically, this is implemented using a Swift actor (AdaptiveRhythmManager) to ensure safe state management in a concurrent environment.

This creates a quiet feedback loop:

Reflection → Rhythm Adjustment → Personalized Next Session

Technical Highlights

Cadence is built entirely in Swift using:

SwiftUI

Core Haptics

Actor-based state management

Clean, modular architecture

No external dependencies

Fully offline operation

Key components:

StartView

BreathingView

ReflectionView

AdaptiveRhythmManager

HapticsManager

SessionStore

Each component follows single-responsibility principles and is separated for clarity and maintainability.

Design Philosophy

Cadence follows three guiding principles:

1. Minimal Cognitive Load

No dashboards, statistics, or unnecessary UI elements.

2. Emotional Neutrality

The app does not diagnose, interpret, or advise.
It simply offers rhythm.

3. Physical Grounding

Haptic feedback provides a body-based anchor.
Anxiety is often physical before it is cognitive — rhythm helps regulate that response.

Why Haptics?

Breathing exercises are traditionally visual or auditory.

Cadence introduces tactile guidance:

Reinforces rhythm without requiring visual focus

Supports grounding when screen interaction feels overwhelming

Aligns with parasympathetic nervous system activation through slower exhale cycles

Haptics are not decorative — they are central to the experience.

Accessibility Considerations

No required reading during breathing

High-contrast breathing text

No reliance on audio

Reflection is optional

Fully usable without providing any personal data

What Makes Cadence Different

Many breathing apps include:

Timers

Progress rings

Voice instruction

Analytics dashboards

Cadence removes those elements and focuses on:

Presence.
Rhythm.
Subtle adaptation.

It is intentionally small and intentional.

Future Directions

If expanded further:

Time-of-day adaptive rhythm

Mood trend insights (optional and local only)

Apple Watch haptic-only mode

Personalized rhythm presets

All while preserving minimalism and privacy.

Closing

Cadence is not a productivity tool.
It is not a diagnostic tool.

It is a small digital pause — guided by rhythm.

Sometimes, that is enough.
