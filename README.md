# BDD

## ⚙️ Exécuter les fichiers SQL

### 🖥️ Via le terminal (recommandé)

Assure-toi que tu es dans le dossier où se trouvent les fichiers `.sql`, puis exécute :

```bash
psql -U postgres -d projet_bdd -f create.sql
psql -U postgres -d projet_bdd -f trigger.sql
psql -U postgres -d projet_bdd -f insert.sql
```
