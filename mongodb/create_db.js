// Sélection de la base (elle sera créée automatiquement si elle n'existe pas)
use('projet_bdd');

// Création explicite de la collection "commentaires" avec un index sur _id
db.createCollection("commentaires");

// (Optionnel) Création d’un index sur date_commentaire pour des recherches futures
db.commentaires.createIndex({ date_commentaire: 1 });

// (Optionnel) Affichage de confirmation
print("Base 'projet_bdd' et collection 'commentaires' créées avec succès !");
