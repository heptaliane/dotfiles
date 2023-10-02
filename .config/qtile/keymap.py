# -*- coding: utf-8 -*-
from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.core.manager import Qtile

import consts


ALT = "mod1"
SUPER = "mod4"
SHIFT = "shift"
CONTROL = "control"

MOD = ALT


@lazy.function
def move_next_group(qtile: Qtile):
    current_group = qtile.current_group
    groups = qtile.groups
    idx = (groups.index(current_group) + 1) % len(groups)
    if (current_window := qtile.current_window) is not None:
        current_window.togroup(groups[idx].name)
        qtile.current_screen.set_group(groups[idx])


@lazy.function
def move_prev_group(qtile: Qtile):
    current_group = qtile.current_group
    groups = qtile.groups
    idx = (groups.index(current_group) - 1) % len(groups)
    if (current_window := qtile.current_window) is not None:
        current_window.togroup(groups[idx].name)
        qtile.current_screen.set_group(groups[idx])


@lazy.function
def swap_next_window(qtile: Qtile):
    current_group = qtile.current_group
    windows = current_group.windows

    if (current_window := qtile.current_window) is not None:
        current_idx = windows.index(current_window)
        next_idx = (current_idx + 1) % len(windows)
        windows[current_idx], windows[next_idx] = (
            windows[next_idx],
            windows[current_idx],
        )
        current_group.layout.cmd_swap(current_window, windows[next_idx])


@lazy.function
def swap_prev_window(qtile: Qtile):
    current_group = qtile.current_group
    windows = current_group.windows

    if (current_window := qtile.current_window) is not None:
        current_idx = windows.index(current_window)
        prev_idx = (current_idx - 1) % len(windows)
        windows[current_idx], windows[prev_idx] = (
            windows[prev_idx],
            windows[current_idx],
        )


keys = [
    Key([MOD], "k", lazy.group.prev_window()),
    Key([MOD], "j", lazy.group.next_window()),
    Key([MOD, SHIFT], "k", swap_prev_window()),
    Key([MOD, SHIFT], "j", swap_next_window()),

    Key([MOD], "h", lazy.screen.prev_group()),
    Key([MOD], "l", lazy.screen.next_group()),
    Key([MOD, SHIFT], "h", move_prev_group),
    Key([MOD, SHIFT], "l", move_next_group),

    Key([MOD], "o", lazy.spawn(guess_terminal())),
    Key([MOD], "b", lazy.spawn(consts.BROWSER)),
    Key([MOD], "f", lazy.spawn(consts.FILE_MANAGER)),

    Key([MOD, SHIFT], "r", lazy.reload_config()),
    Key([ALT], "F4", lazy.window.kill()),
]
