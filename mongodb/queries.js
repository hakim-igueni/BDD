// Sélectionner tous les commentaires
db.commentaires.find().pretty()

// Trouver les commentaires d’un utilisateur donné
db.commentaires.find({ utilisateur: "alice@example.com" }).pretty()

// Chercher un commentaire par son ID
db.commentaires.find({ _id: ObjectId("6650a1a3a3a3a3a3a3a3a3a3") }).pretty()

// Afficher les commentaires contenant le mot "séjour"
db.commentaires.find({ contenu: /séjour/i }).pretty()

// Ajouter une réponse à un commentaire spécifique
db.commentaires.updateOne(
  { _id: ObjectId("6650a1a5a5a5a5a5a5a5a5a5") },
  {
    $push: {
      reponses: {
        utilisateur: "admin@hotel.com",
        contenu: "Merci pour votre retour.",
        date: new Date("2025-06-15")
      }
    }
  }
)

// Ajouter une vidéo à un commentaire existant
db.commentaires.updateOne(
  { _id: ObjectId("6650a1a6a6a6a6a6a6a6a6a6") },
  { $push: { videos: "video_vue.mp4" } }
)

// Compter le nombre de commentaires
db.commentaires.countDocuments()

// Supprimer un commentaire par ID
db.commentaires.deleteOne({ _id: ObjectId("6650a1a4a4a4a4a4a4a4a4a4") })

// Ajouter un champ "tags" à tous les documents
db.commentaires.updateMany({}, { $set: { tags: [] } })

db.commentaires.updateOne(
  { _id: ObjectId("6650a1a6a6a6a6a6a6a6a6a6") },
  { $push: { tags: { $each: ["Cuisine", "Gastronomie"] } } }
)