# Návod: Nastavenie macOS pre WSJT-X (Apple Silicon)

Tento návod ukazuje, ako nakonfigurovať parametre jadra macOS potrebné pre správne fungovanie WSJT-X bez chýb "Unable to create shared memory segment".

## Čo tento skript robí?

WSJT-X vyžaduje zvýšené limity zdieľanej pamäte v macOS. Tento skript dočasne nastaví správne parametre jadra. Budete ho musieť spustiť po každom reštarte pred použitím WSJT-X.

## Požiadavky

- macOS (akákoľvek novšia verzia)
- Mac s Apple Silicon (M1, M2, M3, atď.) alebo Intel Mac
- Administrátorský prístup (budete potrebovať heslo)
- Nainštalovaný WSJT-X (stiahnite z https://sourceforge.net/projects/wsjt/files/)

## Krok 1: Stiahnuť skript

**Metóda A — Terminál**:

```bash
curl -L https://raw.githubusercontent.com/tomasgeci/wsjtx-mac-howto/main/wsjtx.sh -o ~/wsjtx.sh
```

**Metóda B — Prehliadač**:

1. Prejdite na: `https://github.com/tomasgeci/wsjtx-mac-howto`
2. Kliknite na `wsjtx.sh` → `Raw`
3. Pravé tlačidlo → Uložiť ako → uložte ako `wsjtx.sh` do domovského priečinka

## Krok 2: Nastaviť spustiteľné práva

Otvorte Terminál a spustite:

```bash
chmod +x ~/wsjtx.sh
```

## Krok 3: Spustiť skript (po každom reštarte)

```bash
~/wsjtx.sh
```

Skript:
- Zobrazí aktuálne hodnoty parametrov jadra
- Nastaví požadované parametre pre WSJT-X
- Požiada o administrátorské heslo (toto je normálne)

Mali by ste vidieť výstup ako:
```
kern.sysv.shmmax: 4194304 -> 52428800
kern.sysv.shmmin: 1 -> 1
kern.sysv.shmmni: 32 -> 128
...
```

## Krok 4: Spustiť WSJT-X

Teraz môžete normálne otvoriť WSJT-X z priečinka Aplikácie.

## Pravidelné používanie

**Pri každom reštarte Macu:**

1. Otvorte Terminál
2. Spustite: `~/wsjtx.sh`
3. Zadajte heslo po výzve
4. Spustite WSJT-X

## Riešenie problémov

**Chyba "Unable to create shared memory segment":**
- Uistite sa, že ste spustili skript pred spustením WSJT-X
- Overte pomocou: `sysctl kern.sysv.shmmax` (malo by ukázať `52428800`)
- Ak nie, znovu spustite skript

**Skript žiada heslo:**
- Toto je normálne — zmena parametrov jadra vyžaduje administrátorský prístup

**Musím to spúšťať zakaždým?**
- Áno, po každom reštarte. Nastavenia sú dočasné a neuchovávajú sa.
- Toto je zámerné pre jednoduchosť a bezpečnosť.

## Poznámky

- Nastavenia sa resetujú po reštarte (zámerne)
- Bezpečné spustiť viackrát
- Žiadne systémové súbory sa nemenia
- Ovplyvňuje len aktuálne sedenie
