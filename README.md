# Backup med systemd-timer (Restic)

Detta repo innehåller min lösning på systemd-uppgiften.
Backup körs från Ubuntu → Fedora med Restic och triggas automatiskt 5 minuter efter boot.

## Struktur

```
/usr/local/bin/backup.sh
/etc/systemd/system/backup.service
/etc/systemd/system/backup.timer
```

## Arbetsgång (kort)

1. Fedora: Skapade backup-mappen och initierade Restic-repo.
2. Ubuntu: Installerade Restic, lade lösenord i `/etc/restic_pass` och skrev backup-scriptet.
3. Skapade service + timer och aktiverade timern.
4. Testade manuellt att backup fungerade innan jag slog på timern.

## Test

Manuellt test:

```
sudo /usr/local/bin/backup.sh
```

Exempeloutput från körningen:

```
(said@192.168.64.28) Password:
repository 7cdff18c opened (version 2, compression level auto)
using parent snapshot f4871e92

Files:         0 new, 0 changed, 287 unmodified
Dirs:          0 new, 0 changed, 225 unmodified
Added to the repository: 0 B (0 B stored)

processed 287 files, 551.814 KiB in 0:00
snapshot 8d20f677 saved
```

Restic skapade snapshot utan problem.

## Noteringar

* Jag stjärnade restic repot som inspo. "https://github.com/restic/restic.git"
* Jag använde **man pages** när jag fastnade.
* Vid oklara lägen tog jag hjälp av **AI** för att reda ut detaljer.
* Uppfatta uppgiften som att det räckte med snap av en boot och inget schema?


