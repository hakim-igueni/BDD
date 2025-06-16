# Projet de NoSQL

# M2 MIAGE-IF 2024-2025

# Système de base de données polyglotte

## 🎯 Objectif

Ce projet a pour but de concevoir, modéliser et interroger une base de données polyglotte destinée à un système de gestion touristique. L’architecture repose sur l'utilisation combinée de trois technologies complémentaires :

- PostgreSQL pour les données relationnelles structurées
- MongoDB pour les documents souples et non structurés (commentaires)
- Neo4j pour représenter les villes et leurs connexions via un graphe

Chaque technologie est utilisée là où elle est la plus adaptée, avec pour but de simuler un écosystème cohérent autour de points d’intérêt, activités et hébergements.

---

## 🛠️ Technologies utilisées

| Outil         | Rôle                                                              |
| ------------- | ----------------------------------------------------------------- |
| PostgreSQL    | Système relationnel structuré (hébergements, POI, avis…)          |
| MongoDB       | Stockage NoSQL pour les commentaires riches (documents JSON)      |
| Neo4j         | Graphe des villes reliées par distance et temps                   |
| Python        | Tests applicatifs via un notebook Jupyter (connexion aux 3 bases) |
| MongoSH       | Console CLI pour MongoDB – insertion et requêtes                  |
| MongoCompass  | Interface graphique MongoDB – consultation des documents          |
| Neo4j Browser | Interface web Neo4j – exécution des scripts Cypher                |

---

## 📁 Structure des fichiers

### 📦 PostgreSQL

- `create.sql` : création des tables avec contraintes (ON DELETE CASCADE)
- `insert.sql` : insertion de données cohérentes
- `delete.sql` : suppression ciblée
- `drop.sql` : suppression des tables
- `queries.sql` : requêtes SQL
- `triggers.sql` : triggers de cohérence
- `Updates.sql` : mise à jour 

### 📦 MongoDB

- `create-db.js` : création de la base et de la collection
- `insert_commentaires.js` : insertion de plusieurs commentaires
- `delete_commentaires.js` : suppression ciblée
- `queries.js` : requêtes MongoDB de test

### 📦 Neo4j

- `create-graph.cypher` : création des nœuds Ville et des relations RELIE_A
- `queries.cypher` : requêtes de navigation sur le graphe (ville proche, trajet…)

### 📘️ Python (optionnel)

- `integration.ipynb` : notebook pour insérer un commentaire dans MongoDB, puis son avis correspondant dans PostgreSQL, ou insérer une ville à la fois dans PostgreSQL et Neo4j

---

## 🔄 Intégration entre les bases

- ✅ Insertion d’un avis : via Python, un commentaire est d’abord inséré dans MongoDB, puis un avis est ajouté dans PostgreSQL avec une référence au commentaire
- ✅ Ajout d’une ville : une fonction Python permet d’ajouter une ville dans PostgreSQL et Neo4j en parallèle (non requis, mais démonstration de la faisabilité technique)

## 📌 Instructions d’exécution

### 🟦 PostgreSQL

#### ✅ Prérequis

- PostgreSQL doit être installé sur votre machine (via [https://www.postgresql.org/download/](https://www.postgresql.org/download/))
- Vous devez connaître votre nom d'utilisateur PostgreSQL (souvent `postgres` par défaut)

#### 1. Ouvrir le terminal PostgreSQL (`psql`)

```bash
psql -U votre_utilisateur
```

> Exemple :  
> `psql -U postgres`

#### 2. Créer la base de données

```sql
CREATE DATABASE projet_polyglotte;
```

#### 3. Se connecter à la base nouvellement créée

```sql
\c projet_polyglotte
```

#### 4. Exécuter les scripts SQL dans l'ordre

Placez-vous dans le dossier où sont les fichiers `.sql` (ou précisez le chemin absolu) puis exécutez :

```sql
\i create.sql
\i triggers.sql
\i insert.sql
\i queries.sql
\i Updates.sql
```

> 💡 Vous pouvez exécuter `delete.sql` ou `drop.sql` à tout moment si vous souhaitez réinitialiser ou supprimer les données.

---

### 🟩 MongoDB

#### ✅ Prérequis

- MongoDB doit être installé sur votre machine
- MongoDB Shell (`mongosh`) doit être disponible (installé avec MongoDB)
- Les fichiers `.js` doivent être dans le dossier courant ou spécifier leur chemin

#### 1. Lancer le shell MongoDB

```bash
mongosh
```

#### 2. Créer la base et insérer les données

Dans le shell :

```js
load("create-db.js");
load("insert_commentaires.js");
```

#### 3. Lancer les requêtes de test

```js
load("queries.js");
```

> 💡 Vous pouvez aussi utiliser l’interface MongoDB Compass pour consulter ou modifier les données de manière graphique.

---

### 🟪 Neo4j

#### ✅ Prérequis

- Neo4j Desktop ou Neo4j Aura installé
- Base de données locale démarrée
- Accès à l’interface Neo4j Browser : [http://localhost:7474](http://localhost:7474)

#### 1. Ouvrir Neo4j Browser

Connectez-vous à votre instance locale (avec `neo4j` comme utilisateur et votre mot de passe choisi à l’installation).

#### 2. Exécuter les scripts Cypher

Ouvrez les fichiers suivants dans un éditeur de texte, copiez leur contenu, puis collez-le **dans l'interface Neo4j Browser** :

- `create-graph.cypher` : pour créer les villes et les routes
- `queries.cypher` : pour exécuter les requêtes d’exploration

> ℹ️ Aucun usage de `cypher-shell` n’a été nécessaire : toutes les requêtes ont été exécutées directement via le navigateur Neo4j.

---

### 💻 Alternative : exécution via CypherShell (optionnel)

Si vous préférez exécuter les fichiers `.cypher` en ligne de commande avec `cypher-shell` (fourni avec Neo4j), voici comment faire :

#### ✅ Prérequis

- `cypher-shell` doit être installé et accessible dans votre terminal (`PATH`)
- La base de données Neo4j doit être **démarrée**

#### 1. Exécution d’un script `.cypher`

```bash
cypher-shell -u neo4j -p votremotdepasse < create-graph.cypher
cypher-shell -u neo4j -p votremotdepasse < queries.cypher
```

> Remplacez `votremotdepasse` par le mot de passe de votre base Neo4j locale.

> 💡 Cette méthode permet d’automatiser l’importation de graphes et de requêtes sans passer par l’interface graphique.
