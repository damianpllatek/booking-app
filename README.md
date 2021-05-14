# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Zadanie:
1. nawigacja --gotowe
2. Panel administatora - nagłówek --gotowe
3. Dla bloga to samo co dla admina --gotowe
4. Nowe kolumny do bloga i do storny (do tablicy seo_title) --gotowe
5. Dodać komunikaty --gotowe
6. Poprawić widoki dodanych stron i artykułów --nie najgorzej
7. Dodać licznik wyświetleń na blog --gotowe
8. Zadania od Pawła na GitHub - https://gist.github.com/ptrela/7869d7437a2c0e5520355d4cb146c4ae?fbclid=IwAR0ZXKjQRHVZmI52OcVs3wXH5p9nB7OxYCqd_zojMm69M73BzPr2MoL2uyM

Utworzyć widoki dla admin booking, walidacje i aktualizacja menu



---------------------------------------------------

1. poprawić notice i alert -- gotowe
2. Zrobic widoki dla devise (logowanie itd.) --gotowe
3. Ogarnąć devise scope
4. Dodać w widoku blogu żeby wyświetlało kategorię --gotowe
5. w blogs_controller zrobić zmienną w provate + before action dla new i edit --gotowe
6. Dodać kolejną relację dla rezerwacje i pokoje (rezerwacja musi mieć room_id) --gotowe
7. Relacja dla bloga i usera (blog musi mieć user id) --gotowe
8. Dodać to co wyżęj do widoków. --gotowe
9. Usunąć komentarz z brancah 002 --gotowe
10. mergowac całość

----------------------------------------------------

1. ----------dodać name do tabeli usera --gotowe
2. Date w rezerwacji zmienić na "data picker" (znaleźć w google) -- ogarnąć na zajęciach
3. zainstalowanie carierwave na AWS
4. ----------dodać zdjęcia do wszystkich stron, blogów i pokojów --gotowe
5. Tutorial jak połączyć aws z obrazkami - link na skype
6. dopuszczanie i zawężanie formatów, maksymalny rozmiar pliku i max rozmiar obrazka w px.
7. ----------Pobawić się carierwave
8. zrobić change column default dla innych tabeli. Tabele mają różne opcje!
9. ----------zrobić reverse dla innych stron --gotowe
10. poczytać o scope
11*. Dodać do tabeli pages kolumnę state, aby w formularzu było select. W select opcje do wyboru published lub unpublished. 
    Zrobić 2x scope nazywające się published i unpublished. Mają znajdywać się w modelu page i w panelu admina zrobić 2 podstrony published i unpublished.
    Na postronie published ma byc tylko scope @pages = Page.published. W metodzie unpublished @pages = Page.unpublished. (będzie select z wyborem opublikowane czy nie).
12. ---------WIdoki ogarnąć ze zdjęciami --gotowe
13. Paginacja na stronach
14. Gem zmieniający id na nazwy https://github.com/norman/friendly_id   (jak się nie uda to następnym razem)