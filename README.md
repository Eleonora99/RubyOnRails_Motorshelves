# README
Laboratorio di Architetture Software e Sicurezza Informatica 2021 

nome del progetto: Motorshelves


Descrizione generale:
Motorshelves è un’ applicazione web che permette di cercare, vendere o acquistare motociclette tramite
rivenditori autorizzati o privati. Gli utenti interessati a vendere o acquistare hanno anche la possibilità
di organizzare dei rally (raduni) comunicandolo agli altri utenti tramite la creazione di un annuncio nel
quale vengono specificati data e luogo dell’incontro.

Ruoli previsti e funzionalità ad essi offerte:
• Amministratore: è in grado di effettuare qualsiasi azione, in particolare ha accesso a tutte le
funzionalità riguardanti la gestione degli utenti: può rimuovere, sospendere e modificare lo
status di chiunque oltre a poter accedere alla modifica e alla rimozione degli annunci.
Sono incluse nell’elenco delle admin actions anche tutte quelle riportate per gli utenti.
• Utente: può creare, modificare, cancellare o cercare annunci su motociclette.
Ha la possibilità di contattare l’utente dell’annuncio interessato tramite email
e può creare o cercare annunci di raduni dove vendere o comprare.

Modalità di accesso:
Gli utenti non registrati possono effettuare un sign-up tramite un form di registrazione standard, interno
al sito web, oppure effettuare un login esterno usando Facebook come provider
Descrizione dati gestiti:
I dati gestiti dall’applicazione web riguardano le seguenti entità:

• Utente privato: durante la registrazione interna l’applicazione richiede all'utente l’inserimento
di nome,cognome, sesso, data di nascita email e password.
Nel login fornito da Facebook tutte le informazionivengono fornite dal
provider.

• Annuncio di vendita ( Bike advertisment ): affinchè l’annuncio sia chiaro e completo all’utente
è richiesto di inserire la marca (“scuderia”), modello, cilindrata, anno e
residenza della motorbike,infine è possibile inserire un’ immagine, dei consigli e
una descrizione riguardanti quest’ultima.

• Annuncio di raduno (Selling rally): al momento della creazione dell’annuncio (“Bike-rally
advs”) all’utente sono richieste le date e il luogo del raduno.

Interazione con servizi esterni:
Per agevolare e velocizzare il processo di registrazione/login viene reso disponibile l’interazione con il
provider Facebook.
