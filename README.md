# Save Games Rw6

[English version → README.en.md](README.en.md)

Petite appli de bureau (Windows) qui **copie les fichiers de sauvegarde de tes jeux**, à la main ou toute seule, et **vérifie** que la copie est bonne.

Un seul fichier : `save_games_rw6.pyw`. Pas de terminal. Thème sombre, en **français** et en **English** (menu en haut de la fenêtre).

## Installer

1. Installe [Python 3](https://www.python.org/downloads/) (tkinter est inclus sous Windows). Pendant l’installation, coche **Add python.exe to PATH**.
2. Télécharge ce dépôt et décompresse-le.
3. **Double-clique sur `installer_dependances.bat`** : il installe tout seul `tkinterdnd2` et `pystray` (une seule fois ; il propose aussi d’installer Python s’il manque).
4. Double-clique sur `save_games_rw6.pyw` (ou lance `creer_raccourci.bat` pour avoir un raccourci sur le Bureau).

Sans le `.bat`, c’est la même chose à la main, dans l’invite de commandes Windows :

```
py -m pip install tkinterdnd2 pystray
```

- `tkinterdnd2` : glisser-déposer vers l’Explorateur.
- `pystray` : icône près de l’horloge. **Nécessaire pour que la croix masque l’appli au lieu de la fermer** (voir « Masquer »). Installe aussi Pillow.

> Tu es sous Linux ? Il existe un zip dédié, avec un `install.sh` : `save-games-rw6-linux.zip`.

## Langue

Le menu déroulant au milieu, tout en haut de la fenêtre, porte la mention **« Language / Langue : »** suivie de la langue actuelle. Clique dessus : **Français** et **English** apparaissent par-dessus la fenêtre. Quand tu en choisis une, l’appli se relance toute seule dans cette langue (ton choix est retenu dans `reglages.json`). Au tout premier lancement, l’appli prend la langue de ton système si elle la connaît (français ou anglais), sinon l’anglais.

Pour ajouter une langue : ajoute-la dans `LANGUAGES` et crée son dictionnaire `TRANSLATIONS["code"]` tout en bas du fichier (le texte français sert de clé ; un texte sans traduction reste en français).

## Utiliser

- **Liste des jeux à gauche**, fiche du jeu choisi à droite. Ajoute tes jeux avec le bouton prévu.
- **Dossier des sauvegardes** : la ligne sous les boutons du haut montre où tout est rangé (à côté de l’appli par défaut). **Changer…** permet de le mettre ailleurs (autre disque, par exemple), avec l’option de déplacer les sauvegardes existantes : tout est copié et vérifié avant de supprimer l’ancien, et rien ne change au moindre problème. **Ouvrir** y va directement.
- **Accéder au dossier**, à droite du chemin d’un jeu, ouvre le dossier où il range sa sauvegarde. Les boutons **Dossier…** et **Fichiers…** s’ouvrent eux aussi à cet endroit.
- Pour chaque jeu, choisis ce qui est à sauvegarder : **Dossier…** ou **Fichiers…** (plusieurs fichiers précis, copiés à plat).
- **Sauvegarder** copie vers `Sauvegardes/<jeu>/<jeu>_JJ-MM-AAAA_HH-MM-SS`.
- **Vérification SHA-256** après chaque copie (2 essais, une copie défectueuse est supprimée).
- **Tout sauvegarder** (vue « Tous »), renommer un jeu (notes, favoris et réglages suivent).
- **Deux listes visibles en même temps** : sauvegardes manuelles et automatiques. À côté de chaque titre, un petit texte rappelle la limite choisie (« limite de 5 », « pas de limite »). La barre entre les deux listes se déplace.
- **Avant injection/manuel-auto** (en haut) ouvre une autre page, à la place des deux listes : les copies de sécurité faites avant chaque injection, avec leur propre réglage. **← Retour** (ou le même bouton) revient aux listes habituelles (manuelles et automatiques). Les boutons du bas (Note, Favori, Supprimer, Injecter…) marchent sur la page affichée ; rien n’agit jamais sur une liste cachée.
- **Notes** par sauvegarde (aussi écrites en `Note.txt` dans le dossier de la sauvegarde).
- **Favoris ★** : protègent de toute suppression, automatique comprise.
- Sauvegardes de 0 octet en rouge.
- Sélection multiple (Ctrl, Maj, rectangle depuis la zone vide), menu clic droit, touche Suppr, Copier vers…, Ouvrir le dossier.
- Les sélections des deux listes se cumulent : **Ctrl + clic** dans l’autre liste garde la première sélection, **Ctrl+A** prend tout (manuelles et automatiques). Un clic simple repart d’une seule sélection.
- Dans la liste des jeux, chaque jeu montre ses compteurs : manuelles, automatiques, favoris ★.
- Limite de sauvegardes manuelles (désactivée par défaut) et limite des automatiques (5 par défaut). Les favoris ne comptent pas.
- **Pour tous…** (en haut, à côté d’« Avant injection/manuel-auto ») ouvre une fenêtre qui change le **nombre** pour tous les jeux sans toucher aux cases, et qui **coche** ou **décoche** la limite pour tous. Même chose pour les manuelles et les automatiques.
- Sur la page **Avant injection** : combien de copies de sécurité garder par jeu, de 1 à 99 (5 par défaut), hors favoris ★.
- La molette de la souris ne change jamais un nombre ni un menu déroulant par erreur : elle fait seulement défiler.
- Les boutons du bas restent toujours visibles : quand la fenêtre manque de place (texte agrandi), ce sont les listes qui rétrécissent, et la fenêtre ne peut pas devenir plus petite que la barre du haut et les boutons du bas.
- **Rappel des limites** : à côté du titre de chaque liste, un petit texte rappelle la limite du jeu choisi (« limite de 5 », « pas de limite »). En vue « Tous », il montre la limite commune, ou « limite selon le jeu ».
- Taille du texte réglable : boutons A−/A+ ou Ctrl +, Ctrl −, Ctrl 0.
- La taille et la place de la fenêtre sont retenues (`reinitialiser_fenetre.bat` pour remettre à zéro).

## Sauvegarde automatique

Bouton **Automatique…** dans la fiche du jeu. Trois modes, que tu peux **cocher ensemble** (aucun coché = désactivée). Une seule sauvegarde est faite par passage, même si plusieurs modes sont d’accord, et rien n’est copié si le contenu n’a pas changé :

- **Intervalle** : toutes les N heures, jours ou semaines.
- **Heure fixe** : à une heure précise (HH:MM), les jours cochés. Si le PC était éteint, la sauvegarde est rattrapée au démarrage.
- **Fin de session** : quand le jeu se ferme (environ 5 s après).

Règles :

- Le **programme du jeu (.exe) est obligatoire**, pour tous les modes. L’appli ne sauvegarde **jamais** pendant que le jeu tourne : elle attend qu’il soit fermé.
- Plusieurs jeux peuvent partager le même programme (un émulateur, par exemple). Chaque jeu est vérifié à part et n’est sauvegardé que si son contenu a changé.
- Pour indiquer le programme : écris son nom, clique **Parcourir…** (explorateur de fichiers) ou **Choisir dans la liste…** (programmes en cours).
- Sauvegarde seulement si le contenu a changé.
- En cas d’échec : message dans `erreurs.log`, pause de 10 minutes.
- Les sauvegardes automatiques sont rangées dans `Sauvegardes/<jeu>/Auto/`.

## Cloud (Google Drive, OneDrive, Dropbox…)

Tout est **désactivé par défaut**. L’appli ne parle à aucun service en ligne : elle **copie** tes sauvegardes dans un dossier de ton PC que Google Drive pour PC, OneDrive ou Dropbox synchronise (ou n’importe quel dossier, même sur un disque externe). Pas de clé, pas de compte à créer.

Bouton **Cloud…** (en haut, ou dans la fiche d’un jeu) : un onglet **Réglages** et un onglet **Aperçu**.

- **Dossiers cloud** : ajoute-en un ou plusieurs avec l’explorateur, ou aucun. L’appli y crée un dossier « Save Games Rw6 ». Retirer un dossier de la liste ne supprime rien.
- **Cloud pour tous les jeux** / **Aucun jeu** : coche ou décoche tous les jeux d’un coup.
- **Par jeu** : envoyer ou non les sauvegardes automatiques, vers quels dossiers, et combien en garder dans le cloud (6 par défaut ; 10 pour un jeu, 5 pour un autre, aucune pour un troisième…).
- **Garder au maximum pour tous** : un nombre appliqué à tous les jeux sans toucher aux cases, plus **Cocher pour tous** / **Décocher pour tous** pour la case « Garder au maximum ».
- **Envoi manuel** : sélectionne des sauvegardes (Ctrl + clic, manuelles ou automatiques), puis **Envoyer vers le cloud** (bouton du bas ou clic droit). La note `Note.txt` part avec. Modifier une note met aussi à jour la copie déjà envoyée.
- **Réessayer** : délai (minutes, heures ou jours) et nombre d’essais, utile si le dossier cloud est introuvable (Drive pas lancé, disque débranché). Après le dernier essai raté, un message s’affiche : c’est le seul pop-up du cloud. Sans internet, le programme du cloud garde le fichier et l’envoie plus tard tout seul.
- **Limite de place** en Go (par dossier cloud), au choix : supprimer les plus anciennes sauvegardes du cloud (hors favoris ★, c’est le réglage par défaut), ou arrêter d’envoyer. Un avertissement discret s’affiche à côté de la jauge et dans la fiche du jeu, sans pop-up. L’appli ne mesure que son propre dossier, pas le reste de ton Drive.
- **Aperçu** : place utilisée et jauge, détail par dossier cloud, par jeu et par sauvegarde (type, date, taille, note, favoris ★).

À savoir :

- Le cloud garde sa propre copie. Supprimer une sauvegarde dans l’appli ne touche **pas** à sa copie dans le cloud. Seuls le maximum / la limite de place de l’appli, ou toi dans le dossier cloud, suppriment des copies (le programme du cloud les supprime alors aussi en ligne, souvent vers sa corbeille).
- L’appli vérifie sa copie dans le dossier (SHA-256). Elle ne peut pas savoir si le programme du cloud a fini d’envoyer en ligne.

## Injecter une sauvegarde

Sélectionne une sauvegarde, puis **Injecter la sauvegarde** (bouton du bas ou clic droit) : elle **remplace** la sauvegarde actuelle du jeu.

- Une confirmation est demandée. Si la sauvegarde choisie est **identique** à celle du jeu (même contenu, SHA-256), l’appli le dit et demande si tu veux poursuivre quand même (réponse par défaut : non). L’appli refuse si le programme du jeu (réglé dans **Automatique…**) tourne.
- L’état actuel est d’abord copié dans la liste **« Avant injection »** (note automatique « Avant injection (1) MonJeu », puis (2), (3)… : le numéro monte à chaque injection sur ce jeu, même quand les anciennes sont supprimées ; tu peux écrire à la suite avec **Note…**, le texte va dans `Note.txt` de ce dossier, jamais remis dans le jeu) : tu peux revenir en arrière. Les plus anciennes au-delà du nombre réglé sur la page **Avant injection** sont supprimées (hors favoris ★).
- Pour un dossier, son contenu est remplacé. Pour des fichiers précis, chacun retourne à sa place.
- Chaque fichier est vérifié (SHA-256). `Note.txt` n’est jamais remise dans le jeu.

## Masquer, icône et lancement avec Windows

- **Masquer** cache la fenêtre, l’appli continue de tourner (les sauvegardes automatiques aussi).
- Avec `pystray` installé : une icône apparaît près de l’horloge. Clic = rouvrir. Menu clic droit : Ouvrir / Quitter.
- Windows range souvent les nouvelles icônes dans le menu **^** (icônes cachées). Fais-la glisser vers la barre pour la garder visible.
- Sans `pystray` : un avertissement s’affiche. Relancer l’appli réaffiche la fenêtre.
- **Une seule copie** de l’appli tourne à la fois.
- La croix (**X**) **ne ferme jamais** l’appli : elle la masque, comme **Masquer**. Pour vraiment quitter : clic droit sur l’icône près de l’horloge, puis **Quitter** (ou le Gestionnaire des tâches).
- Sans `pystray`, il n’y a pas d’icône : la croix propose alors de fermer l’appli (en expliquant comment installer `pystray`), faute d’un autre moyen de la rouvrir ou de la quitter.
- Case **Lancer avec Windows** : l’appli démarre avec la session, réduite.

## Fichiers créés à côté du script

`config.json`, `notes.json`, `favoris.json`, `limites.json`, `auto.json`, `cloud.json`, `reglages.json`, `fenetre.json`, `affichage.json`, `erreurs.log` et le dossier `Sauvegardes/`.

Une icône `icone.ico` à côté du script est utilisée si elle existe. `creer_raccourci.bat` crée un raccourci sur le Bureau. `installer_dependances.bat` installe `tkinterdnd2` et `pystray`.

## Licence

MIT, Copyright (c) 2026 Rw6. Tu peux utiliser et modifier l’appli librement, à condition de garder la mention du copyright et de la licence.
