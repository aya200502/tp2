# CakeJava – TP N°2 JEE – Servlets & JSP
## TDIA2-S4 / 2025-26 | Pr. Mohamed CHERRADI

---

## Prérequis
- Eclipse IDE for Enterprise Java Developers (JEE)
- Apache Tomcat 10.x (recommandé) ou 9.x
- JDK 11 ou supérieur
- Maven (intégré dans Eclipse)

---

## Importer le projet dans Eclipse

1. Ouvrir Eclipse JEE
2. `File` → `Import` → `Maven` → `Existing Maven Projects`
3. Sélectionner le dossier `CakeJava`
4. Cliquer `Finish`

---

## Configurer Tomcat dans Eclipse

1. `Window` → `Preferences` → `Server` → `Runtime Environments`
2. Cliquer `Add` → choisir **Apache Tomcat v10.1**
3. Indiquer le dossier d'installation de Tomcat
4. Cliquer `Finish`

---

## Lancer l'application

1. Clic droit sur le projet → `Run As` → `Run on Server`
2. Sélectionner Tomcat → `Finish`
3. Ouvrir le navigateur :

```
http://localhost:8080/CakeJava/index.jsp
```

---

## Structure du projet

```
CakeJava/
├── pom.xml
└── src/
    └── main/
        ├── java/
        │   └── servlets/
        │       ├── creerClient.java       ← Servlet /addClt
        │       └── creerReservation.java  ← Servlet /addRsv
        └── webapp/
            ├── index.jsp             ← Page d'accueil
            ├── Inscription.jsp       ← Formulaire client
            ├── infoClient.jsp        ← Affichage client
            ├── Reservation.jsp       ← Formulaire réservation
            ├── infoReservation.jsp   ← Affichage réservation
            └── WEB-INF/
                └── web.xml
```

---

## Note importante : Tomcat 9 vs Tomcat 10

| Tomcat 9  | Tomcat 10+ |
|-----------|------------|
| `javax.servlet.*` | `jakarta.servlet.*` |

Le code fourni utilise **jakarta.servlet** (Tomcat 10).
Si vous utilisez Tomcat 9, remplacez dans les deux servlets :
```java
import jakarta.servlet.*;   →   import javax.servlet.*;
import jakarta.servlet.annotation.WebServlet;  →  import javax.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;  →  import javax.servlet.http.*;
```
Et dans pom.xml, remplacez la version de l'API par `4.0.4`.

---

## Fonctionnalités

- **Page d'accueil** : navigation vers Clients ou Réservations
- **Espace Client** : formulaire d'ajout avec validation + affichage
- **Espace Réservation** : formulaire avec type (single/double/suite), prix, vue + affichage
- **Validation** : message d'erreur si un champ est vide
