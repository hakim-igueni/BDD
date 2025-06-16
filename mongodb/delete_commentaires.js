// Se connecter à la base
use('projet_bdd');

// Supprimer tous les documents de la collection "commentaires"
db.commentaires.deleteMany({});

// Afficher une confirmation
print("Tous les commentaires ont été supprimés de la collection !");
