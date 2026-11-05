# Save Games Rw6

[Version française → README.md](README.md)

A small desktop app (Windows) that **copies your games' save files**, by hand or automatically, and **verifies** that the copy is good.

A single file: `save_games_rw6.pyw`. No terminal window. Dark theme, in **English** and **Français** (menu at the top of the window).

## Installing

1. Install [Python 3](https://www.python.org/downloads/) (tkinter is included on Windows). During the installation, tick **Add python.exe to PATH**.
2. Download this repository and unzip it.
3. **Double-click `installer_dependances.bat`**: it installs `tkinterdnd2` and `pystray` for you (only once; it also offers to install Python if it is missing).
4. Double-click `save_games_rw6.pyw` (or run `creer_raccourci.bat` to get a shortcut on the Desktop).

Without the `.bat`, it is the same thing by hand, in the Windows command prompt:

```
py -m pip install tkinterdnd2 pystray
```

- `tkinterdnd2`: drag and drop to the file explorer.
- `pystray`: tray icon next to the clock. **Required for the close button to hide the app instead of closing it** (see “Hiding”). Also installs Pillow.

> On Linux? There is a dedicated zip with an `install.sh`: `save-games-rw6-linux.zip`.

## Language

The dropdown in the middle, at the very top of the window, is labelled **“Language / Langue:”** followed by the current language. Click it: **Français** and **English** appear on top of the window. When you pick one, the app restarts by itself in that language (your choice is remembered in `reglages.json`). On the very first launch, the app uses your system language if it knows it (French or English), otherwise English.

To add a language: add it to `LANGUAGES` and create its dictionary `TRANSLATIONS["code"]` at the very bottom of the file (the French text is the key; a text without a translation stays in French).

## Using it

- **List of games on the left**, sheet of the selected game on the right. Add your games with the button provided.
- **Backups folder**: the line under the top buttons shows where everything is stored (next to the app by default). **Change…** lets you put it elsewhere (another disk, for example), with the option to move the existing backups: everything is copied and verified before the old one is deleted, and nothing changes at the slightest problem. **Open** goes straight there.
- **Go to folder**, to the right of a game's path, opens the folder where it keeps its save. The **Folder…** and **Files…** buttons also open at that location.
- For each game, choose what to back up: **Folder…** or **Files…** (several specific files, copied flat).
- **Back up** copies to `Sauvegardes/<game>/<game>_DD-MM-YYYY_HH-MM-SS`.
- **SHA-256 verification** after every copy (2 attempts, a faulty copy is deleted).
- **Back up everything** (“All” view), rename a game (notes, favorites and settings follow).
- **Two lists visible at the same time**: manual and automatic backups. Next to each title, a small text reminds you of the chosen limit (“limit of 5”, “no limit”). The bar between the two lists can be moved.
- **Before injection/manual-auto** (at the top) opens another page, in place of the two lists: the safety copies made before each injection, with their own setting. **← Back** (or the same button) returns to the usual lists (manual and automatic). The bottom buttons (Note, Favorite, Delete, Inject…) act on the page being displayed; nothing ever acts on a hidden list.
- **Notes** per backup (also written to `Note.txt` in the backup's folder).
- **Favorites ★**: protect from any deletion, automatic included.
- 0-byte backups are shown in red.
- Multiple selection (Ctrl, Shift, rectangle from the empty area), right-click menu, Delete key, Copy to…, Open folder.
- Selections in the two lists add up: **Ctrl + click** in the other list keeps the first selection, **Ctrl+A** takes everything (manual and automatic). A simple click starts again from a single selection.
- In the list of games, each game shows its counters: manual, automatic, favorites ★.
- Limit on manual backups (off by default) and limit on automatic ones (5 by default). Favorites do not count.
- **For all…** (at the top, next to “Before injection/manual-auto”) opens a window that changes the **number** for all games without touching the checkboxes, and **ticks** or **unticks** the limit for all. The same for manual and automatic backups.
- On the **Before injection** page: how many safety copies to keep per game, from 1 to 99 (5 by default), excluding favorites ★.
- The mouse wheel never changes a number or a dropdown by mistake: it only scrolls.
- The bottom buttons always stay visible: when the window runs out of room (enlarged text), the lists shrink, and the window cannot become smaller than the top bar and the bottom buttons.
- **Limit reminder**: next to the title of each list, a small text reminds you of the selected game's limit (“limit of 5”, “no limit”). In the “All” view, it shows the common limit, or “limit depends on the game”.
- Adjustable text size: A−/A+ buttons or Ctrl +, Ctrl −, Ctrl 0.
- The window's size and position are remembered (`reinitialiser_fenetre.bat` to reset them).

## Automatic backup

**Automatic…** button on the game's sheet. Three modes, which you can **tick together** (none ticked = off). Only one backup is made per pass, even if several modes agree, and nothing is copied if the content has not changed:

- **Interval**: every N hours, days or weeks.
- **Fixed time**: at a precise time (HH:MM), on the ticked days. If the computer was off, the backup is caught up at startup.
- **End of session**: when the game closes (about 5 s later).

Rules:

- The **game's program (.exe) is required**, for all modes. The app **never** backs up while the game is running: it waits until it is closed.
- Several games can share the same program (an emulator, for example). Each game is checked separately and is only backed up if its content has changed.
- To set the program: type its name, click **Browse…** (file explorer) or **Pick from the list…** (running programs).
- Backs up only if the content has changed.
- On failure: a message in `erreurs.log`, then a 10-minute pause.
- Automatic backups are stored in `Sauvegardes/<game>/Auto/`.

## Cloud (Google Drive, OneDrive, Dropbox…)

Everything is **off by default**. The app does not talk to any online service: it **copies** your backups into a folder on your computer that Google Drive, OneDrive or Dropbox synchronizes (or any folder, even on an external disk). No key, no account to create.

**Cloud…** button (at the top, or on a game's sheet): a **Settings** tab and a **Preview** tab.

- **Cloud folders**: add one or several with the file explorer, or none. The app creates a “Save Games Rw6” folder in each. Removing a folder from the list deletes nothing.
- **Cloud for all games** / **No game**: tick or untick all games at once.
- **Per game**: send automatic backups or not, to which folders, and how many to keep in the cloud (6 by default; 10 for one game, 5 for another, none for a third…).
- **Keep at most, for all**: a number applied to all games without touching the checkboxes, plus **Tick for all** / **Untick for all** for the “Keep at most” checkbox.
- **Manual upload**: select backups (Ctrl + click, manual or automatic), then **Send to cloud** (bottom button or right click). The `Note.txt` note goes with them. Editing a note also updates the copy already sent.
- **Retry**: delay (minutes, hours or days) and number of attempts, useful if the cloud folder cannot be found (Drive not running, disk unplugged). After the last failed attempt, a message is shown: it is the only cloud pop-up. Without internet, the cloud program keeps the file and sends it later by itself.
- **Space limit** in GB (per cloud folder), your choice: delete the oldest backups from the cloud (excluding favorites ★, this is the default), or stop sending. A discreet warning is shown next to the gauge and on the game's sheet, without a pop-up. The app only measures its own folder, not the rest of your Drive.
- **Preview**: space used and gauge, detail per cloud folder, per game and per backup (type, date, size, note, favorites ★).

Good to know:

- The cloud keeps its own copy. Deleting a backup in the app does **not** touch its copy in the cloud. Only the app's maximum / space limit, or you in the cloud folder, delete copies (the cloud program then deletes them online too, often into its trash).
- The app verifies its copy in the folder (SHA-256). It cannot know whether the cloud program has finished uploading online.

## Injecting a backup

Select a backup, then **Inject backup** (bottom button or right click): it **replaces** the game's current save.

- A confirmation is asked. If the chosen backup is **identical** to the game's current save (same content, SHA-256), the app says so and asks whether you want to continue anyway (default answer: no). The app refuses if the game's program (set in **Automatic…**) is running.
- The current state is first copied to the **“Before injection”** list (automatic note “Before injection (1) MyGame”, then (2), (3)…: the number goes up with every injection on that game, even when older ones are deleted; you can write after it with **Note…**, the text goes into the `Note.txt` of that folder and is never put back into the game): you can go back. The oldest ones beyond the number set on the **Before injection** page are deleted (excluding favorites ★).
- For a folder, its content is replaced. For specific files, each one goes back to its place.
- Every file is verified (SHA-256). `Note.txt` is never put back into the game.

## Hiding, tray icon and starting with Windows

- **Hide** hides the window, the app keeps running (automatic backups too).
- With `pystray` installed: an icon appears next to the clock. Click = reopen. Right-click menu: Open / Quit.
- Windows often puts new icons in the **^** menu (hidden icons). Drag it onto the taskbar to keep it visible.
- Without `pystray`: a warning is shown. Launching the app again shows the window again.
- **Only one copy** of the app runs at a time.
- The close button (**X**) **never closes** the app: it hides it, like **Hide**. To really quit: right-click the icon next to the clock, then **Quit** (or the Task Manager).
- Without `pystray`, there is no icon: the close button then offers to close the app (explaining how to install `pystray`), for lack of another way to reopen or quit it.
- **Start with Windows** checkbox: the app starts with your session, minimized.

## Files created next to the script

`config.json`, `notes.json`, `favoris.json`, `limites.json`, `auto.json`, `cloud.json`, `reglages.json`, `fenetre.json`, `affichage.json`, `erreurs.log` and the `Sauvegardes/` folder (these names stay in French).

An `icone.ico` next to the script is used if it exists. `creer_raccourci.bat` creates a shortcut on the Desktop. `installer_dependances.bat` installs `tkinterdnd2` and `pystray`.

## License

MIT, Copyright (c) 2026 Rw6. You may use and modify the app freely, as long as you keep the copyright and license notice.
