# README

Projekt wykonany na zaliczenie Studiów Podyplomowych "Programowanie Aplikacji Webowych" Akademii Górniczo Hutniczej w Krakowie.

Aplikacja przeznaczona do wyszukiwania i rezerwacji wolnych pokoi w SunriseHotel.

Technologie:
Backend:
Ruby v 2.7.3
Rails v 6.1

Frontend:
HTML5
CSS3
Bootstrap4
JavaScript
RWD

Baza danych:
SQLite


Opis konfiguracji środowiska i uruchomienia projektu:

1. Pobieranie i instalacja Ruby 2.7.3:

   W zależności od posiadanego systemu operacyjnego należy pobrać i zainstalować Ruby w wersji 2.7.3 zgodnie z instrukcją:
   ->  https://www.ruby-lang.org/en/downloads/

   Jeżeli posiadamy inną wersję języka Ruby należy ją zmienić przy użyciu rbenv:
   -> https://github.com/rbenv/rbenv

2. Instalacja Ruby on Rails
   Po zainstalowaniu Ruby następnie w konsoli wpisujemy komendę:
   -> gem install rails

3. Pobierz i wypakuj plik "booking-app.zip".

4. W edytorze kodu np. RubyMine lub Visual Studio Code otwieramu folder booking-app.

5. Po załadowaniu projektu w edytorze uruchamiamy terminal i wpisujemy komendnę, która zaktualizuje potrzebne komponenty apliakcji:
   -> bundle install

6. Uruchamiamy wirtualny serwer komendą:
   -> rails s

7. W przeglądarce internetowej wpisujemy adres:
   -> http://localhost:3000

8. Logowanie w panelu administratora poprzez link w nawigacji strony.
   Dane logowania:
   email: admin@example.com <br>
   hasło: admin123
