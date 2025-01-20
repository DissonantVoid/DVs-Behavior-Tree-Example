(WORK IN PROGRESS)

# Table of Content
- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Project Setup](#project-setup)
- [Making Da Game](#making-da-game)

# Overview
This is a step-by-step guide to making your own boss AI using a behavior tree. It should help you familiarize with the addon and its features and by the end you should be able to use the knowledge to make your own custom AI.

Here's a preview of what we'll be making:
(gif or video)

We will cover:
- The process of creating and iterating a behavior tree.
- The behavior nodes and most common use cases.
- Passing data between behavior nodes.
- Reusing modular behaviors.

# Prerequisites
This guide is designed to be as beginner friendly as possible so a prior experience with Godot as well as a general understanding of behavior trees (see [start here](../docs/(1)%20start%20here.md)) is all you need. Although it helps if you've implemented some form of AI in a game before and have checked [using addon](../docs/(2)%20using%20addon.md).

Here's the source code of what we'll be making if you have problems following along or need a reference.
(source code)

You'll need to download the [project template]() before we start, it's a pre-set project to save us the tedious setup process so we can just get to the fun stuff. It contains:
- Assets (a few textures, sounds and music).
- Scenes (main scene, basic player scene, empty boss scene).
- Project settings (resolution and texture filtering settings for pixel art).
- Basic input actions for player.

You'll also need the latest version of this addon which you can grab from the assets library or from [github](https://github.com/DissonantVoid/DVs-Behavior-Tree/releases). Add the addon to the project, activate it and we're ready to go.

# Making Da Boss
Our game consists of 3 main scenes: game scene, player and boss. For the sake of keeping it to the point we'll mostly focus on the behavior tree design of the boss. The player and game scenes are already setup for you. Feel free to add your own magic and game juice once we're done.

You'll notice the specific way I setup the files, that's just how I like to setup my projects with all resources going into the `resources` folder while scenes and their scripts go into the `scenes` folder. You are free to shuffle things around as you see fit.

## The Game Scene
If you open the main scene you'll notice that it already has everything we need. A small level, some UI and music, the boss and the player. Try to start the scene to get familiar with the controls. The player is a badass square (don't even ask) that can move around and shoot projectiles while the boss, this ancient circle of evil is... well it just is at the moment. This isn't some minecraft block supremacy propaganda I promise.

## The Boss Scene
Alright can we do somethig now? yes deer reader. Please take delight in knowing that this part was originaly burried under +100 lines of text about seting up everything from scratch.


(using Node nodes to prototype tree)
(different approaches: storing all behavior variables in boss class for ease of access)

## Final Touches
(UI and sounds)

## What We Have

# Final Thoughts
(exercices: add one more attack sequence, add death sequence)
(ask for feedback)