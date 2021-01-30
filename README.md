### **_W celu uruchomienia skryptu uruchom plik main.ps1 za pomocą PowerShell'a_**


# AZ1 Projekt poprawkowy.
Wymogi formalne, działamy na zmiennyh, wykonywane operacje mają być realizowane niezależnie od danych wejściowych. Unikamy danych statycznych, dane mają być przypisywane tylko do zmiennych. Odczytywane dane mają zawierać tylko potrzebne dane, bez zbędnych znaków np. spacja na końcu.

#### Wszystko wykonywane ma być wyłącznie za pomocą PowerShell.

Napisać skrypt wykonujące poniższe operacje. Każde zadanie ma być opisane w komentarzu co jest wykonywane. Na początku skryptu należy podać dane AZ1 Poprawa i należy podać dane autorów skryptu. Imię nazwisko grupa oraz numer indeksu.

Skrypt, pliki wejściowe oraz pliki wyników przesłać spakowane ZIP (nazwa pliku AZ1_Poprawa_numer zespolu.zip) za pomocą systemu zadań na Teams.

Jeżeli autorzy uznają, że trzeba dodać coś np. dodatkową weryfikację, zabezpieczenie to proszę dodając opisać to dlaczego jest to ważne.

#### Termin nadsyłania prac mija 07.02.2021 o godzinie 23:59 – termin nieprzekraczalny.

Do poniższego skryptu proszę stworzyć dokumentację w formacie PDF zawierającą instrukcję obsługi skryptu. Opis zmiennych – za co każda zmienna odpowiada i jakiego jest typu. Dokumentacja musi zawierać stronę tytułową, spisy ilustracji, tabel, spis treści.

## Napisać skrypt do obsługi Active Directory Domain Services.
Skrypt ma posiadać menu z wyborem 8 poniższych opcji. Skrypt ma na początku czyścić ekran na początku działania. Każda z opcji w menu ma być realizowana oddzielną funkcją. Skrypt ma być uniwersalny i działać na każdej domenie. Wszystkie pliki i raporty mają być generowane w jednym miejscu – proszę zaproponować to miejsce, tak żeby było uniwersalne.

Zadania jakie ma wykonywać skrypt to:

### Obsługa kont użytkowników

#### Tworzenie konta użytkownika
   Atrybuty wymagane:
    
   * Imie
    
   * Nazwisko
    
   * Dział
    
   * E-mail
    
   Login (upn + samaccount) – imie+nazwisko generowany automatycznie, Jeżeli już taki login istnieje to skrypt musi dodać do nowego loginu cyfrę np. jan.kowalski1. Wartość cyfry zależy od ilości już istniejących kont w domenie.
    
   E-mial ma być generowany automatycznie.
    
   Hasło do kont ma być generowane automatycznie – informacje o loginie i haśle mają zostać zapisane do pliku o nazwie „nazwa użytkownika.txt”
    
#### Tworzenie wielu kont na podstawie pliku csv
   Atrybuty wymagane:
       
   * Imie
       
   * Nazwisko
       
   * Dział
       
   * E-mail
   
   Login (upn + samaccount) – imie+nazwisko generowany automatycznie, jak już taki login istnieje to skrypt przed utworzeniem konta musi o tym poinformować i poprosić o nowy login.
   
   Hasło generowane automatycznie – informacje o loginie i haśle mają zostać zapisane do pliku z nazwą użytkownika.
   
   Osoba użytkująca skrypt ma tylko w pisać w wejściowym pliku „użytkownicy.csv” dane: „imię, nazwisko, dział” resztę ma robić skrypt. – Jeżeli już taki login istnieje to skrypt musi dodać do nowego loginu cyfrę np. jan.kowalski1. Wartość cyfry zależy od ilości już istniejących kont w domenie.
   
   Skrypt powinien umożliwiać generowanie pustego plku csv z samymi nagłówkami, w celu wypełnienia go.
   
   #### Blokowanie konta użytkownika
   
   Skrypt ma zapytać o login do zablokowania – informacja o zablokowanym koncie ma zostać zapisana do pliku log o nazwie „zablokowane konta data.txt”. w pliku tym ma się znaleźć kto kiedy i jakie konto zablokował
   
   #### Zmiana hasła konta użytkownika
   
   Skrypt ma zapytać o login do zablokowania – informacja o zablokowanym koncie ma zostać zapisana do pliku log o nazwie „zablokowane konta data.txt”. w pliku tym ma się znaleźć kto kiedy i jakie konto zablokował
   
   ### Obsługa kont użytkowników
   
   #### Dodawanie użytkowników do grup
   
   Skrypt ma zadać pytanie o nazwę grupy do jakiej ma być dodany użytkownik, następnie ma zadać pytanie o nazwę użytkownika jaki ma zostać dodany. Ma zostać stworzony plik o nazwie „zmiana członkostwa grup.txt” i w nim mają się znaleźć kto dodał kogo oraz do jakiej grupy.
   
   ### Raporty
   
   #### Lista grup z członkami
   
   Skrypt ma wygenerować pliki o nazwach „nazwa grupy.txt” grup w domenie i w każdym z tych plików mają się znaleźć loginy członków w danej grupie. Pojedynczy plik reprezentuje jedną grupę np. g_it.txt
   
   #### Lista zablokowanych kont w domenie
   
   Skrypt ma wygenerować plik o nazwie „zablokowane konta.txt” w pliku ma się znaleźć lista zablokowanych kont w domenie.
   
   **Proszę napisać skrypt wykonujący powyższe zadania, wymogi co do działania skryptu:**
   
   **Posługujemy się zmiennymi, nie danymi statycznymi**
