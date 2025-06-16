use('projet_bdd');

db.commentaires.insertMany([
  {
    _id: ObjectId("6650a1a1a1a1a1a1a1a1a1a1"),
    contenu: "Très bon séjour, personnel accueillant.",
    images: [],
    date_commentaire: ISODate("2025-05-20"),
    avis_id: 1,
    reponses: []
  },
  {
    _id: ObjectId("6650a1a2a2a2a2a2a2a2a2a2"),
    contenu: "Bon rapport qualité prix.",
    images: [],
    date_commentaire: ISODate("2025-05-22"),
    avis_id: 2,
    reponses: []
  },
  {
    _id: ObjectId("6650a1a3a3a3a3a3a3a3a3a3"),
    contenu: "Chambre propre mais un peu bruyante.",
    images: ["chambre.jpg"],
    date_commentaire: ISODate("2025-05-23"),
    avis_id: 3,
    reponses: [
      {
        utilisateur: "hotel@example.com",
        contenu: "Merci pour votre remarque.",
        date: ISODate("2025-05-24")
      }
    ]
  },
  {
    _id: ObjectId("6650a1a4a4a4a4a4a4a4a4a4"),
    contenu: "Petit-déjeuner excellent.",
    images: [],
    date_commentaire: ISODate("2025-05-24"),
    avis_id: 4,
    reponses: []
  },
  {
    _id: ObjectId("6650a1a5a5a5a5a5a5a5a5a5"),
    contenu: "Service moyen.",
    images: [],
    date_commentaire: ISODate("2025-05-25"),
    avis_id: 5,
    reponses: []
  },
  {
    _id: ObjectId("6650a1a6a6a6a6a6a6a6a6a6"),
    contenu: "Vue magnifique, à recommander !",
    images: ["vue.jpg", "balcon.jpg"],
    date_commentaire: ISODate("2025-05-26"),
    avis_id: 6,
    reponses: []
  }
]);
