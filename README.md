# Save Games Rw6

*Par Rw6.*

Une petite application de bureau pour **sauvegarder les fichiers de sauvegarde de vos jeux en un clic**, les retrouver facilement et ne jamais les perdre par erreur.

Vous indiquez une fois où un jeu range sa sauvegarde, puis un bouton fait une copie datée, vérifiée, dans un dossier à vous. L'appli ne modifie jamais les fichiers du jeu : elle ne fait que les lire.

> L'interface est en français uniquement. Développée et utilisée sur Windows 11 ; les autres systèmes ne sont pas testés.

<!-- Ajoutez ici une capture d'écran : ![Fenêtre principale](capture.png) -->

## Fonctionnalités

**Sauvegarder**
- **Un bouton par jeu.** Un clic copie le dossier (ou le fichier) de sauvegarde du jeu dans `Sauvegardes/<jeu>/`, dans un sous-dossier daté : `MonJeu_01-11-2026_14-30-00`.
- **Chaque copie est vérifiée.** Juste après la copie, l'appli compare la copie à l'original (fichiers présents, tailles, contenu par empreinte SHA-256). En cas d'écart, elle recommence une fois ; si ça échoue encore, elle supprime la copie défectueuse et vous prévient, pour que vous ne gardiez pas une fausse sauvegarde. L'original n'est jamais touché.
- **Autant de jeux que vous voulez.** Bouton **Ajouter un jeu**, puis **Dossier…** ou **Fichier…** pour indiquer où le jeu range sa sauvegarde. Un jeu peut être **renommé** à tout moment : ses sauvegardes, notes, favoris et réglages suivent.

**S'y retrouver**
- **Onglets par jeu**, plus un onglet **Tous**. Les plus récentes sont en haut.
- **Notes.** Sélectionnez une sauvegarde, cliquez sur **Note…** (par exemple « avant le boss final »). La note s'affiche dans la liste et est aussi écrite dans un fichier `Note.txt` à l'intérieur du dossier de la sauvegarde : elle voyage avec lui quand vous le copiez ou le glissez ailleurs.
- **Favoris ★.** Le bouton **★ Favori** marque les sauvegardes à protéger (voir plus bas).
- **Sauvegardes vides en rouge.** Une sauvegarde de 0 octet s'affiche en rouge : c'est le signe qu'il y a un problème.
- **Actualisation automatique.** La liste se met à jour quand vous revenez sur la fenêtre et toutes les 10 secondes, seulement si quelque chose a changé sur le disque. Elle garde votre onglet, votre sélection et votre position dans la liste.

**Gérer**
- **Sélection multiple** : `Ctrl` + clic, `Maj` + clic, `Ctrl` + `A`, ou un **rectangle de sélection** (appuyez dans la zone vide sous les lignes et glissez ; avec `Ctrl`, il s'ajoute à la sélection).
- **Clic droit sur une sauvegarde** : un menu donne accès à toutes les actions des boutons du bas (copier vers, ouvrir le dossier, note, favori, supprimer). Avec plusieurs sauvegardes sélectionnées, « Ouvrir le dossier » et « Note… » sont grisés.
- **Supprimer** (bouton ou touche `Suppr`) : une confirmation indique le nombre et les noms. Si la sélection contient des favoris, une **deuxième confirmation** demande s'il faut les supprimer aussi (« Non » les garde).
- **Copier vers…** copie une ou plusieurs sauvegardes dans un dossier de votre choix, avec la même vérification.
- **Glisser-déposer** d'une sauvegarde de la liste vers un dossier de l'Explorateur (nécessite `tkinterdnd2`, voir Installation). Une sauvegarde à la fois.
- **Ouvrir le dossier** (ou double-clic) ouvre la sauvegarde dans l'Explorateur.

**Limite automatique (optionnelle, par jeu)**
- Pour chaque jeu, cochez **Garder au maximum** et choisissez un nombre (1 à 99). Désactivée par défaut.
- Quand une sauvegarde réussit et est vérifiée, les plus anciennes au-delà du maximum sont supprimées. Avec 6, vous gardez toujours les 6 plus récentes.
- **Les favoris ★ ne sont jamais supprimés automatiquement, et ne comptent pas dans le total.**
- Rien n'est supprimé au moment où vous réglez la limite. Si vous l'activez alors qu'il y a déjà trop de sauvegardes, l'appli vous prévient de ce qui sera supprimé à la prochaine sauvegarde.
- Seuls les dossiers dont le nom se termine par une date de sauvegarde sont concernés : un dossier que vous auriez ajouté vous-même dans `Sauvegardes/` n'est jamais touché.

**Confort**
- **Taille du texte réglable**, pour toute l'application : boutons **A−** / **A+** en haut à droite (de 70 % à 200 %), ou `Ctrl` + `+` / `Ctrl` + `-`, et `Ctrl` + `0` pour revenir à 100 %. Les boîtes de dialogue propres à Windows (confirmations, choix de dossier) gardent la taille choisie dans Windows.
- **Thème sombre**, y compris la barre de titre sous Windows 10/11.
- **La taille et la position de la fenêtre sont retenues.** Si la fenêtre se retrouve hors de l'écran (écran débranché), elle est replacée toute seule ; sinon, double-cliquez sur `reinitialiser_fenetre.bat` (appli fermée).
- **Icône personnalisable** : placez un fichier `icone.ico` (le vôtre) à côté du script, il sert d'icône à la fenêtre et à la barre des tâches (Windows). Le fichier `.pyw` lui-même garde l'icône de Python, c'est Windows qui l'affiche : pour avoir votre icône sur le Bureau, double-cliquez sur `creer_raccourci.bat`, qui crée un raccourci « Save Games Rw6 » avec cette icône. Sans `icone.ico`, l'appli fonctionne normalement avec l'icône par défaut.
- **Sans terminal** : le fichier `.pyw` s'ouvre sans fenêtre noire. S'il y a une erreur, elle est notée dans `erreurs.log`.

## Installation

1. Installez **Python 3** depuis [python.org](https://www.python.org/downloads/) (utilisé avec Python 3.14). La fenêtre utilise `tkinter`, inclus avec Python sous Windows.
2. Téléchargez ce dépôt (bouton **Code → Download ZIP**) et dézippez-le où vous voulez.
3. *(Facultatif)* Pour le glisser-déposer vers l'Explorateur, ouvrez un terminal et tapez :
   ```
   py -m pip install tkinterdnd2
   ```
   (si `pip install tkinterdnd2` seul répond que « pip n'est pas reconnu », la commande ci-dessus fonctionne). Sans cette bibliothèque, tout le reste marche.
4. Double-cliquez sur **`save_games_rw6.pyw`**.

## Premier lancement

1. Cliquez sur **Ajouter un jeu** et donnez-lui un nom.
2. Cliquez sur **Dossier…** (ou **Fichier…** si la sauvegarde est un seul fichier) et choisissez où le jeu range sa sauvegarde. Pour trouver cet emplacement, le site [PCGamingWiki](https://www.pcgamingwiki.com/) indique les dossiers de sauvegarde de nombreux jeux PC.
3. Fermez le jeu, puis cliquez sur **Sauvegarder <jeu>**.

## Fichiers créés par l'appli

Tout est rangé à côté du script. Aucun de ces fichiers ne doit être publié (ils sont dans le `.gitignore`).

| Fichier | Contenu |
|---|---|
| `Sauvegardes/` | Les copies : `Sauvegardes/<jeu>/<jeu>_JJ-MM-AAAA_HH-MM-SS/` |
| `config.json` | Les jeux et leurs chemins |
| `notes.json` | Les notes des sauvegardes |
| `favoris.json` | Les sauvegardes favorites |
| `limites.json` | La limite de sauvegardes de chaque jeu |
| `fenetre.json` | Taille et position de la fenêtre |
| `affichage.json` | Taille du texte |
| `erreurs.log` | Créé seulement en cas d'erreur |

## À savoir

- **Fermez le jeu avant de sauvegarder.** Si le jeu (ou l'émulateur) écrit sa sauvegarde pendant la copie, vous pouvez copier un fichier à moitié écrit. La vérification le détecte dans la plupart des cas, mais mieux vaut l'éviter.
- Ce que l'appli écrit ou supprime : elle ne supprime que dans son dossier `Sauvegardes/` (et la copie défectueuse qu'elle vient de créer ailleurs si une vérification échoue). Elle ne modifie jamais le dossier du jeu.
- `Note.txt` est ajouté dans le dossier d'une sauvegarde qui a une note. Quand vous remettez une sauvegarde dans le dossier d'un jeu, copiez seulement les fichiers du jeu ou supprimez `Note.txt`.
- Ce n'est pas un remplaçant d'une vraie sauvegarde externe : pensez à copier le dossier `Sauvegardes/` sur un autre disque de temps en temps (**Copier vers…** ou le glisser-déposer peuvent servir).
- Ce programme est fourni tel quel, sans garantie.

## Licence

Ce projet est publié sous licence **MIT** : tout le monde peut l'utiliser, le modifier et le redistribuer, à condition de **conserver la mention de copyright « Copyright (c) 2026 Rw6 » et le texte de la licence** (fichier [LICENSE](LICENSE)) dans les copies et les versions modifiées.
