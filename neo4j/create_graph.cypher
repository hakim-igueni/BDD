// Création des villes (en évitant les doublons)
MERGE (:Ville {nom: 'Montreal'});
MERGE (:Ville {nom: 'Quebec'});
MERGE (:Ville {nom: 'Ottawa'});
MERGE (:Ville {nom: 'Toronto'});
MERGE (:Ville {nom: 'Vancouver'});
MERGE (:Ville {nom: 'Halifax'});

MERGE (:Ville {nom: 'Longueuil'});
MERGE (:Ville {nom: 'Laval'});
MERGE (:Ville {nom: 'Gatineau'});
MERGE (:Ville {nom: 'Mississauga'});
MERGE (:Ville {nom: 'Burnaby'});
MERGE (:Ville {nom: 'Dartmouth'});

// Création des relations orientées uniquement si elles n'existent pas déjà
MATCH (m:Ville {nom: 'Montreal'}), (q:Ville {nom: 'Quebec'})
WHERE NOT (m)-[:RELIE_A]->(q)
CREATE (m)-[:RELIE_A {distance: 250, temps: 180}]->(q);

MATCH (m:Ville {nom: 'Montreal'}), (o:Ville {nom: 'Ottawa'})
WHERE NOT (m)-[:RELIE_A]->(o)
CREATE (m)-[:RELIE_A {distance: 200, temps: 120}]->(o);

MATCH (o:Ville {nom: 'Ottawa'}), (t:Ville {nom: 'Toronto'})
WHERE NOT (o)-[:RELIE_A]->(t)
CREATE (o)-[:RELIE_A {distance: 450, temps: 270}]->(t);

MATCH (t:Ville {nom: 'Toronto'}), (v:Ville {nom: 'Vancouver'})
WHERE NOT (t)-[:RELIE_A]->(v)
CREATE (t)-[:RELIE_A {distance: 3370, temps: 3000}]->(v);

MATCH (v:Ville {nom: 'Vancouver'}), (h:Ville {nom: 'Halifax'})
WHERE NOT (v)-[:RELIE_A]->(h)
CREATE (v)-[:RELIE_A {distance: 6030, temps: 4200}]->(h);

MATCH (m:Ville {nom: 'Montreal'}), (h:Ville {nom: 'Halifax'})
WHERE NOT (m)-[:RELIE_A]->(h)
CREATE (m)-[:RELIE_A {distance: 1240, temps: 900}]->(h);

MATCH (m:Ville {nom: 'Montreal'}), (l:Ville {nom: 'Longueuil'})
WHERE NOT (m)-[:RELIE_A]-(l)
CREATE (m)-[:RELIE_A {distance: 8, temps: 15}]->(l);

MATCH (m:Ville {nom: 'Montreal'}), (v:Ville {nom: 'Laval'})
WHERE NOT (m)-[:RELIE_A]-(v)
CREATE (m)-[:RELIE_A {distance: 12, temps: 20}]->(v);

MATCH (o:Ville {nom: 'Ottawa'}), (g:Ville {nom: 'Gatineau'})
WHERE NOT (o)-[:RELIE_A]-(g)
CREATE (o)-[:RELIE_A {distance: 5, temps: 10}]->(g);

MATCH (t:Ville {nom: 'Toronto'}), (m:Ville {nom: 'Mississauga'})
WHERE NOT (t)-[:RELIE_A]-(m)
CREATE (t)-[:RELIE_A {distance: 14, temps: 25}]->(m);

MATCH (v:Ville {nom: 'Vancouver'}), (b:Ville {nom: 'Burnaby'})
WHERE NOT (v)-[:RELIE_A]-(b)
CREATE (v)-[:RELIE_A {distance: 10, temps: 15}]->(b);

MATCH (h:Ville {nom: 'Halifax'}), (d:Ville {nom: 'Dartmouth'})
WHERE NOT (h)-[:RELIE_A]-(d)
CREATE (h)-[:RELIE_A {distance: 6, temps: 10}]->(d);