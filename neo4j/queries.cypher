// 1. Villes à moins de 10 km d’une ville donnée (ex : Montreal)
MATCH (v1:Ville {nom: 'Montreal'})-[r:RELIE_A]-(v2:Ville)
WHERE r.distance < 10
RETURN v2.nom AS ville_proche, r.distance;

// 2. Distance et durée entre deux villes (ex : Toronto et Vancouver)
MATCH (v1:Ville {nom: 'Toronto'})-[r:RELIE_A]-(v2:Ville {nom: 'Vancouver'})
RETURN v1.nom AS ville_depart, v2.nom AS ville_arrivee, r.distance, r.temps;

// 3. Toutes les villes entre deux villes (itinéraire possible, ex : Montreal → Vancouver)
MATCH
  path =
    (start:Ville {nom: 'Montreal'})-[:RELIE_A*]-(end:Ville {nom: 'Vancouver'})
WHERE start <> end
RETURN
  [v IN nodes(path) | v.nom] AS villes_etapes,
  reduce(
    total = 0, rel IN relationships(path) | total + rel.distance) AS distance_totale,
  reduce(
    total = 0, rel IN relationships(path) | total + rel.temps) AS duree_totale
ORDER BY size(nodes(path)) ASC;

////////////////////////////REQUETES ADDITIONNELLES///////////////////////////////////////////////

// 4. Modifier un trajet (ex : changer distance entre Ottawa et Toronto)
MATCH (v1:Ville {nom: 'Ottawa'})-[r:RELIE_A]-(v2:Ville {nom: 'Toronto'})
SET r.distance = 430, r.temps = 260
RETURN 'Trajet modifié' AS statut, r;

// 5. Ajouter une nouvelle ville si elle n’existe pas
MERGE (v:Ville {nom: 'Trois-Rivières'})
RETURN 'Ville ajoutée' AS statut, v.nom;

// 6. Ajouter un trajet entre deux villes existantes
MATCH (a:Ville {nom: 'Trois-Rivières'}), (b:Ville {nom: 'Quebec'})
MERGE (a)-[:RELIE_A {distance: 130, temps: 90}]->(b)
RETURN 'Relation ajoutée entre Trois-Rivières et Quebec' AS statut;

// 7. Supprimer une ville et toutes ses relations
MATCH (v:Ville {nom: 'Laval'})
DETACH DELETE v;

// 8. Villes sans connexion (isolées)
MATCH (v:Ville)
WHERE NOT (v)--()
RETURN v.nom AS ville_isolee;

// 9. Afficher tous les trajets directs (relations RELIE_A)
MATCH (v1:Ville)-[r:RELIE_A]->(v2:Ville)
RETURN v1.nom AS de, v2.nom AS vers, r.distance, r.temps
ORDER BY r.distance ASC;


// 10. Itinéraire optimal par distance entre deux villes (ex : Ottawa → Vancouver)
MATCH
  path =
    (start:Ville {nom: 'Ottawa'})-[:RELIE_A*]-(end:Ville {nom: 'Vancouver'})
RETURN
  [v IN nodes(path) | v.nom] AS villes,
  reduce(
    total = 0, rel IN relationships(path) | total + rel.distance) AS distance_totale
ORDER BY distance_totale ASC
LIMIT 1;