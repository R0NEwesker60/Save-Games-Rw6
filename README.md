[README.md](https://github.com/user-attachments/files/34325910/README.md)
# Save Games Rw6

Petite appli de bureau (Windows) qui **copie les fichiers de sauvegarde de tes jeux**, à la main ou toute seule, et **vérifie** que la copie est bonne.

Un seul fichier : `save_games_rw6.pyw`. Pas de terminal, thème sombre.

## Installer

1. Installe [Python 3](https://www.python.org/downloads/) (tkinter est inclus sous Windows).
2. Télécharge ce dépôt.
3. Double-clique sur `save_games_rw6.pyw`.

Recommandé, une seule fois (dans l’invite de commandes Windows) :

```
py -m pip install tkinterdnd2 pystray
```

- `tkinterdnd2` : glisser-déposer vers l’Explorateur.
- `pystray` : icône près de l’horloge. **Nécessaire pour que la croix masque l’appli au lieu de la fermer** (voir « Masquer »). Installe aussi Pillow.

## Utiliser

- **Liste des jeux à gauche**, fiche du jeu choisi à droite. Ajoute tes jeux avec le bouton prévu.
- Pour chaque jeu, choisis ce qui est à sauvegarder : **Dossier…** ou **Fichiers…** (plusieurs fichiers précis, copiés à plat).
- **Sauvegarder** copie vers `Sauvegardes/<jeu>/<jeu>_JJ-MM-AAAA_HH-MM-SS`.
- **Vérification SHA-256** après chaque copie (2 essais, une copie défectueuse est supprimée).
- **Tout sauvegarder** (vue « Tous »), renommer un jeu (notes, favoris et réglages suivent).
- **Deux listes visibles en même temps** : sauvegardes manuelles en haut, automatiques en bas. La barre entre les deux se déplace.
- **Notes** par sauvegarde (aussi écrites en `Note.txt` dans le dossier de la sauvegarde).
- **Favoris ★** : protègent de toute suppression, automatique comprise.
- Sauvegardes de 0 octet en rouge.
- Sélection multiple (Ctrl, Maj, rectangle depuis la zone vide), menu clic droit, touche Suppr, Copier vers…, Ouvrir le dossier.
- Les sélections des deux listes se cumulent : **Ctrl + clic** dans l’autre liste garde la première sélection, **Ctrl+A** prend tout (manuelles et automatiques). Un clic simple repart d’une seule sélection.
- Dans la liste des jeux, chaque jeu montre ses compteurs : manuelles, automatiques, favoris ★.
- Limite de sauvegardes manuelles (désactivée par défaut) et limite des automatiques (5 par défaut). Les favoris ne comptent pas.
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
- Pour indiquer le .exe : écris son nom, clique **Parcourir…** (explorateur de fichiers) ou **Choisir dans la liste…** (programmes en cours).
- Sauvegarde seulement si le contenu a changé.
- En cas d’échec : message dans `erreurs.log`, pause de 10 minutes.
- Les sauvegardes automatiques sont rangées dans `Sauvegardes/<jeu>/Auto/`.

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

`config.json`, `notes.json`, `favoris.json`, `limites.json`, `auto.json`, `fenetre.json`, `affichage.json`, `erreurs.log` et le dossier `Sauvegardes/`.

Une icône `icone.ico` à côté du script est utilisée si elle existe. `creer_raccourci.bat` crée un raccourci sur le Bureau.

## Licence

MIT, Copyright (c) 2026 Rw6. Tu peux utiliser et modifier l’appli librement, à condition de garder la mention du copyright et de la licence.
