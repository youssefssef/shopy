# shopy

## Installation et Exécution

### Prérequis
- Flutter SDK 3.29.3 (stable)
- Dart 3.7.2
- Un IDE comme Android Studio ou Visual Studio Code

### Instructions d’installation

1. Cloner le dépôt :

   ```bash

   git clone https://github.com/votre-utilisateur/shopy.git

2. Installer les dépendances : 

   ```bash

   flutter pub get

3. Lancer l’application : 

   ```bash

   flutter run


### Choix techniques et architecturaux

    - Architecture MVVM (Model-View-ViewModel) pour une meilleure séparation des responsabilités.
    - Provider pour la gestion d’état, simple et efficace pour ce type d’application.
    - SharedPreferences utilisé pour la sauvegarde locale des commandes passées, car nous stockons uniquement les IDs, quantités et dates, ce qui est léger et rapide.
    - Utilisation du package `http` pour effectuer les requêtes réseau :  
        - Récupération des données produits depuis l’API DummyJSON (https://dummyjson.com).  
        - Simulation de l’envoi des commandes via une API factice (https://jsonplaceholder.typicode.com/posts).
    - QuickAlert pour fournir un feedback utilisateur clair lors des actions (succès, erreurs).
    - Gestion responsive personnalisée avec une classe Responsive adaptée aux différents formats d’écran.



### Fonctionnalités principales

- Gestion du panier (ajout, suppression, modification).
- Passage de commande avec confirmation et animations.
- Affichage de l’historique des commandes avec détails des produits.
- Recherche avancée avec filtres par nom, catégorie, marque, prix et note.
- Sauvegarde rapide des produits favoris pour un accès facilité.
- Sauvegarde locale des produits commandés pour un historique enrichi.
- UI responsive et animations pour une meilleure expérience utilisateur.

### Notes supplémentaires


Le projet est conçu pour être facilement maintenable et extensible, avec une logique métier clairement séparée de l’interface. Les données sauvegardées localement sont minimisées pour optimiser la performance.
