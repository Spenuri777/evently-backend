-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 22, 2026 at 09:04 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evently`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `events`
--

CREATE TABLE `events` (
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `type` enum('konkurs','wycieczka','zebranie','sportowy','kulturalny') NOT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `participant_limit` int(11) DEFAULT NULL,
  `organizer_id` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`title`, `description`, `type`, `date`, `time`, `location`, `participant_limit`, `organizer_id`, `created_at`, `updated_at`, `id`) VALUES
('Uroczyste rozpoczęcie roku szkolnego', 'Inauguracja roku szkolnego 2025/2026. Spotkanie całej społeczności szkolnej na boisku szkolnym, powitanie nowych uczniów oraz przedstawienie planów na nadchodzący rok.', 'zebranie', '2025-09-01', '09:00:00', 'Boisko szkolne', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9d56ea-51d0-11f1-b76b-107b448ef272'),
('Zebranie organizacyjne z rodzicami', 'Pierwsze zebranie z rodzicami w nowym roku szkolnym. Omówienie planów wychowawczych, zasad oceniania oraz harmonogramu ważnych wydarzeń szkolnych.', 'zebranie', '2025-09-10', '17:00:00', 'Sale lekcyjne', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9d6461-51d0-11f1-b76b-107b448ef272'),
('Sprzątanie Świata', 'Ogólnopolska akcja ekologiczna. Uczniowie sprzątają okolice szkoły, parki i tereny zielone w ramach dbania o środowisko naturalne. Worki i rękawiczki zapewnia szkoła.', 'sportowy', '2025-09-19', '10:00:00', 'Okolice szkoły i parku miejskiego', 150, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('Szkolny Konkurs Ortograficzny - etap klasowy', 'Eliminacje klasowe do ogólnoszkolnego dyktanda. Uczniowie piszą tekst przygotowany przez polonistów. Najlepsi z każdej klasy przejdą do finału szkolnego.', 'konkurs', '2025-09-24', '11:00:00', 'Sale lekcyjne', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9d65fb-51d0-11f1-b76b-107b448ef272'),
('Wycieczka do Muzeum Narodowego w Warszawie', 'Jednodniowa wycieczka edukacyjna do Muzeum Narodowego. Uczniowie zwiedzą wystawę stałą malarstwa polskiego oraz wystawę czasową. Wyjazd autokarem spod szkoły.', 'wycieczka', '2025-10-03', '07:30:00', 'Muzeum Narodowe, Warszawa', 50, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9d665c-51d0-11f1-b76b-107b448ef272'),
('Dzień Nauczyciela - Akademia', 'Uroczysta akademia z okazji Dnia Edukacji Narodowej przygotowana przez uczniów. Program artystyczny, życzenia oraz drobne upominki dla nauczycieli.', 'kulturalny', '2025-10-14', '10:00:00', 'Aula szkolna', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9d6774-51d0-11f1-b76b-107b448ef272'),
('Szkolny Konkurs Ortograficzny - finał', 'Finał ogólnoszkolnego dyktanda. Udział biorą najlepsi uczniowie z eliminacji klasowych. Zwycięzcy w kategoriach klas 4-6 i 7-8 otrzymają nagrody i dyplomy.', 'konkurs', '2025-10-17', '11:00:00', 'Biblioteka szkolna', 30, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9d67d5-51d0-11f1-b76b-107b448ef272'),
('Turniej Piłki Nożnej - Liga Klas', 'Rozgrywki piłkarskie między klasami siódmymi i ósmymi. System grupowy, następnie faza pucharowa. Mecze rozgrywane są na boisku szkolnym. Kibice mile widziani!', 'sportowy', '2025-10-22', '12:00:00', 'Boisko szkolne', 80, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9d6839-51d0-11f1-b76b-107b448ef272'),
('Halloween - Szkolna Noc Kultury', 'Wieczór tematyczny w klimacie Halloween. Uczniowie przychodzą w kostiumach, biorą udział w konkursach, warsztatach plastycznych i seansie filmowym. Wydarzenie dla klas 4-8.', 'kulturalny', '2025-10-31', '16:00:00', 'Świetlica i korytarze szkolne', 120, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('Olimpiada Matematyczna - etap szkolny', 'Szkolny etap Ogólnopolskiej Olimpiady Matematycznej dla uczniów klas 7-8. Zadania obejmują arytmetykę, geometrię, algebrę i kombinatorykę. Czas trwania: 90 minut.', 'konkurs', '2025-11-07', '09:00:00', 'Sala 201', 40, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db19f-51d0-11f1-b76b-107b448ef272'),
('Wycieczka do Fabryki Czekolady w Krakowie', 'Wycieczka edukacyjno-rozrywkowa do interaktywnego muzeum czekolady. Uczniowie poznają historię kakao, proces produkcji czekolady oraz sami tworzą własne praliny.', 'wycieczka', '2025-11-14', '06:00:00', 'Fabryka Czekolady, Kraków', 45, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db207-51d0-11f1-b76b-107b448ef272'),
('Narodowe Święto Niepodległości - Akademia', 'Uroczysta akademia szkolna z okazji Święta Niepodległości. Program słowno-muzyczny przygotowany przez uczniów klas 6-8, recytacje, pieśni patriotyczne, projekcja historyczna.', 'kulturalny', '2025-11-10', '10:00:00', 'Aula szkolna', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db26d-51d0-11f1-b76b-107b448ef272'),
('Konkurs Języka Angielskiego - Spelling Bee', 'Konkurs poprawnej wymowy i pisowni w języku angielskim. Uczniowie literują słowa na czas w eliminacjach indywidualnych. Kategorie: klasy 4-5 oraz klasy 6-8.', 'konkurs', '2025-11-20', '10:30:00', 'Sala językowa 105', 50, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db2d2-51d0-11f1-b76b-107b448ef272'),
('Zebranie z rodzicami - I semestr', 'Śródokresowe spotkanie wychowawców z rodzicami. Omówienie postępów uczniów, frekwencji oraz bieżących spraw wychowawczych. Spotkania w salach poszczególnych klas.', 'zebranie', '2025-11-26', '17:00:00', 'Sale lekcyjne', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db342-51d0-11f1-b76b-107b448ef272'),
('Szkolny Konkurs Kolęd i Pastorałek', 'Konkurs wokalny z repertuarem bożonarodzeniowym. Uczniowie mogą startować solo, w duetach lub małych zespołach. Jury ocenia dobór repertuaru, intonację i interpretację.', 'konkurs', '2025-12-05', '13:00:00', 'Aula szkolna', 60, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db398-51d0-11f1-b76b-107b448ef272'),
('Mikołajki Szkolne', 'Tradycyjna impreza mikołajkowa. Uczniowie klas 1-3 odwiedza Mikołaj z paczkami, starsze klasy biorą udział w losowaniu prezentów i zabawach tematycznych.', 'kulturalny', '2025-12-06', '10:00:00', 'Świetlica szkolna', 200, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db3ee-51d0-11f1-b76b-107b448ef272'),
('Kiermasz Bożonarodzeniowy', 'Uczniowie sprzedają własnoręcznie wykonane ozdoby, kartki i wypieki bożonarodzeniowe. Dochód przeznaczony na rzecz uczniów z rodzin w trudnej sytuacji materialnej.', 'kulturalny', '2025-12-17', '09:00:00', 'Korytarz główny', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db441-51d0-11f1-b76b-107b448ef272'),
('Wigilia Szkolna', 'Spotkanie opłatkowe całej społeczności szkolnej. Wspólne kolędowanie, tradycyjne potrawy wigilijne, życzenia i podsumowanie pierwszego semestru.', 'kulturalny', '2025-12-19', '11:00:00', 'Aula szkolna', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db492-51d0-11f1-b76b-107b448ef272'),
('Turniej Szachowy - Mistrzostwa Szkoły', 'Dwudniowy turniej szachowy systemem szwajcarskim. Kategorie wiekowe: klasy 4-5 i klasy 6-8. Rejestracja do 15 stycznia. Zwycięzcy otrzymają puchary i nagrody rzeczowe.', 'konkurs', '2026-01-16', '10:00:00', 'Biblioteka szkolna', 32, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db4eb-51d0-11f1-b76b-107b448ef272'),
('Dzień Babci i Dziadka', 'Uroczyste zaproszenie dziadków do szkoły. Uczniowie klas 1-4 przygotowują program artystyczny, wystawy prac i prezenty wykonane własnoręcznie. Poczęstunek w świetlicy.', 'kulturalny', '2026-01-21', '10:00:00', 'Aula i świetlica szkolna', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db53e-51d0-11f1-b76b-107b448ef272'),
('Próbny Egzamin Ósmoklasisty - Język Polski', 'Symulacja egzaminu ósmoklasisty z języka polskiego w warunkach zbliżonych do rzeczywistego egzaminu. Uczniowie klas 8 piszą w salach egzaminacyjnych, z zachowaniem pełnej procedury.', 'zebranie', '2026-01-27', '09:00:00', 'Sale egzaminacyjne', 60, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db58f-51d0-11f1-b76b-107b448ef272'),
('Próbny Egzamin Ósmoklasisty - Matematyka', 'Symulacja egzaminu ósmoklasisty z matematyki. Uczniowie klas 8 rozwiązują zadania w warunkach egzaminacyjnych. Wyniki i omówienie błędów następnego dnia.', 'zebranie', '2026-01-28', '09:00:00', 'Sale egzaminacyjne', 60, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db5ea-51d0-11f1-b76b-107b448ef272'),
('Ferie Zimowe - Półkolonie Szkolne', 'Organizowane przez szkołę zajęcia podczas ferii zimowych: warsztaty sportowe, plastyczne, gry planszowe, wyjścia do kina i kręgielni. Zapisy przez sekretariat.', 'sportowy', '2026-01-26', '08:00:00', 'Szkoła i obiekty miejskie', 40, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db638-51d0-11f1-b76b-107b448ef272'),
('Walentynkowy Konkurs Poetycki', 'Uczniowie piszą wiersze o tematyce miłości, przyjaźni i piękna. Prace ocenia jury złożone z polonistów i bibliotekarz. Najlepsze wiersze zostaną opublikowane w gazecie szkolnej.', 'konkurs', '2026-02-13', '12:00:00', 'Biblioteka szkolna', 80, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db689-51d0-11f1-b76b-107b448ef272'),
('Turniej Koszykówki Dziewcząt', 'Rozgrywki koszykarskie między klasami dla dziewcząt z klas 6-8. Mecze trwają 2x15 minut. Nagrody dla drużyn z miejsc 1-3. Zapisy drużyn do 10 lutego.', 'sportowy', '2026-02-20', '12:30:00', 'Sala gimnastyczna', 60, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db6dd-51d0-11f1-b76b-107b448ef272'),
('Zebranie podsumowujące I semestr', 'Spotkanie z rodzicami po wystawieniu ocen semestralnych. Wychowawcy omawiają wyniki w nauce, zachowanie i plany na drugi semestr. Możliwość rozmów z nauczycielami przedmiotowymi.', 'zebranie', '2026-02-11', '17:00:00', 'Sale lekcyjne', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db72b-51d0-11f1-b76b-107b448ef272'),
('Dzień Kobiet - Szkolne Obchody', 'Uczniowie przygotowują niespodzianki dla nauczycielek i koleżanek. Program artystyczny, konkurs na najpiękniejszy wiersz dedykowany kobietom, wystawy portretów.', 'kulturalny', '2026-03-06', '10:00:00', 'Aula szkolna', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db77c-51d0-11f1-b76b-107b448ef272'),
('Olimpiada Języka Polskiego - etap szkolny', 'Eliminacje szkolne do olimpiady polonistycznej. Uczniowie klas 7-8 rozwiązują zadania z zakresu wiedzy o języku, literaturze i kulturze. Czas trwania: 120 minut.', 'konkurs', '2026-03-13', '09:00:00', 'Sala 301', 35, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db7ce-51d0-11f1-b76b-107b448ef272'),
('Wycieczka do Teatru Narodowego', 'Wyjazd do Teatru Narodowego w Warszawie na spektakl z repertuaru obowiązkowego. Przed spektaklem krótkie wprowadzenie przez polonistę. Powrót autokarem po zakończeniu.', 'wycieczka', '2026-03-20', '08:00:00', 'Teatr Narodowy, Warszawa', 50, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db81c-51d0-11f1-b76b-107b448ef272'),
('Wiosenny Rajd Pieszy', 'Całodniowy rajd pieszy trasą przez okoliczne lasy i wzgórza. Dystans ok. 12 km, trasa dostosowana do uczniów szkoły podstawowej. Obowiązkowe odpowiednie obuwie i prowiant.', 'wycieczka', '2026-03-27', '07:00:00', 'Trasa: Szkoła -> Lasy Chojnowskie -> Powrót', 80, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db869-51d0-11f1-b76b-107b448ef272'),
('Konkurs Wiedzy o Unii Europejskiej', 'Test wiedzy o historii, instytucjach i funkcjonowaniu Unii Europejskiej. Przeznaczony dla uczniów klas 7-8. Laureaci reprezentują szkołę w etapie rejonowym.', 'konkurs', '2026-03-25', '11:00:00', 'Sala 204', 30, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db8b5-51d0-11f1-b76b-107b448ef272'),
('Przegląd Teatrów Klasowych', 'Każda klasa 4-8 przygotowuje krótki spektakl (max 15 minut) na dowolny temat. Jury ocenia scenariusz, grę aktorską i oprawę wizualną. Najlesze przedstawienie jedzie na festiwal powiatowy.', 'kulturalny', '2026-04-10', '10:00:00', 'Aula szkolna', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db905-51d0-11f1-b76b-107b448ef272'),
('Turniej Tenisa Stołowego', 'Szkolne mistrzostwa w tenisie stołowym - gry pojedyncze i deblowe. Kategorie: dziewczęta i chłopcy oddzielnie. System pucharowy, ćwierćfinały od 20 uczestników.', 'sportowy', '2026-04-09', '13:00:00', 'Sala gimnastyczna', 40, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db95e-51d0-11f1-b76b-107b448ef272'),
('Dzień Ziemi - Szkolne Działania Ekologiczne', 'Całodniowe wydarzenie ekologiczne: warsztaty o segregacji odpadów, sadzenie drzewek na terenie szkoły, konkurs na ekoplakat, zbiórka elektrośmieci. Brak mundurka - strój ekologiczny.', 'kulturalny', '2026-04-22', '09:00:00', 'Teren szkoły i ogródek szkolny', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9db9af-51d0-11f1-b76b-107b448ef272'),
('Próbny Egzamin Ósmoklasisty - Język Angielski', 'Symulacja egzaminu z języka angielskiego dla klas 8. Uczniowie rozwiązują zadania na rozumienie ze słuchu, czytanie i znajomość środków językowych w warunkach egzaminacyjnych.', 'zebranie', '2026-04-24', '09:00:00', 'Sale egzaminacyjne', 60, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9dba01-51d0-11f1-b76b-107b448ef272'),
('Wycieczka do Centrum Nauki Kopernik', 'Wyjazd do Centrum Nauki Kopernik w Warszawie. Uczniowie klas 5-7 zwiedzają wystawy interaktywne z fizyki, chemii i biologii. Czas wolny na eksplorację wystawy Eksperymentuj!', 'wycieczka', '2026-04-17', '07:00:00', 'Centrum Nauki Kopernik, Warszawa', 55, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9dba50-51d0-11f1-b76b-107b448ef272'),
('Święto Flagi i Konstytucji 3 Maja - Akademia', 'Uroczysta akademia z okazji Święta Konstytucji 3 Maja. Część historyczna, recytacje, montaż słowno-muzyczny. Uczniowie przychodzą w strojach biało-czerwonych lub galowych.', 'kulturalny', '2026-05-05', '09:00:00', 'Aula szkolna', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9dba9d-51d0-11f1-b76b-107b448ef272'),
('Szkolne Biegi Przełajowe - Dzień Sportu', 'Coroczny Dzień Sportu z biegami przełajowymi na trasach dostosowanych do grup wiekowych. Klasy 1-3: 600m, klasy 4-6: 1000m, klasy 7-8: 1500m. Nagrody dla trzech pierwszych miejsc.', 'sportowy', '2026-05-15', '09:00:00', 'Boisko szkolne i okolice parku', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9dbaec-51d0-11f1-b76b-107b448ef272'),
('Konkurs Fotograficzny \"Moja Szkoła\"', 'Uczniowie przesyłają zdjęcia na temat życia szkolnego, architektury budynku i portretów nauczycieli. Fotografie ocenia zewnętrzne jury. Wystawa pokonkursowa w korytarzu głównym.', 'konkurs', '2026-05-08', '12:00:00', 'Biblioteka szkolna (odbiór prac)', 100, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9dbb3b-51d0-11f1-b76b-107b448ef272'),
('Wycieczka klasowa do Zakopanego', 'Trzydniowa wycieczka do Zakopanego dla klas 7. Program: Morskie Oko, Gubałówka, Muzeum Tatrzańskie, spacer Krupówkami. Zakwaterowanie w schronisku młodzieżowym.', 'wycieczka', '2026-05-20', '05:30:00', 'Zakopane', 50, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9dbb88-51d0-11f1-b76b-107b448ef272'),
('Zebranie z rodzicami - podsumowanie roku', 'Ostatnie w roku szkolnym spotkanie wychowawców z rodzicami. Informacje o przewidywanych ocenach końcowych, wymaganiach na egzaminach i planach wychowawczych na kolejny rok.', 'zebranie', '2026-05-27', '17:00:00', 'Sale lekcyjne', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9dbbd4-51d0-11f1-b76b-107b448ef272'),
('Egzamin Ósmoklasisty - Język Polski', 'Oficjalny egzamin ósmoklasisty z języka polskiego. Uczniowie klas 8 przystępują do egzaminu w warunkach określonych przez CKE. Obowiązuje pełna procedura egzaminacyjna.', 'zebranie', '2026-06-02', '09:00:00', 'Sale egzaminacyjne', 60, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9dbc27-51d0-11f1-b76b-107b448ef272'),
('Egzamin Ósmoklasisty - Matematyka', 'Oficjalny egzamin ósmoklasisty z matematyki. Uczniowie klas 8 rozwiązują zadania w warunkach egzaminacyjnych CKE. Wyniki dostępne w lipcu na stronie CKE.', 'zebranie', '2026-06-03', '09:00:00', 'Sale egzaminacyjne', 60, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9dbc76-51d0-11f1-b76b-107b448ef272'),
('Egzamin Ósmoklasisty - Język Angielski', 'Oficjalny egzamin ósmoklasisty z języka angielskiego. Ostatni dzień egzaminów. Po zakończeniu uczniowie klas 8 świętują zakończenie etapu szkolnego.', 'zebranie', '2026-06-04', '09:00:00', 'Sale egzaminacyjne', 60, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9dbcc7-51d0-11f1-b76b-107b448ef272'),
('Wycieczka nad Bałtyk - klasy 6', 'Trzydniowa wycieczka nad morze dla klas szóstych. Program: plaża, latarnia morska w Kołobrzegu, rejs statkiem, park rozrywki. Noclegi w ośrodku wczasowym.', 'wycieczka', '2026-06-10', '05:00:00', 'Kołobrzeg i okolice', 45, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9dd3ed-51d0-11f1-b76b-107b448ef272'),
('Szkolny Konkurs Talentów', 'Finałowy konkurs talentów kończący rok szkolny. Uczniowie prezentują swoje umiejętności: śpiew, taniec, akrobatyka, magia, stand-up, gra na instrumentach. Głosuje publiczność.', 'konkurs', '2026-06-17', '13:00:00', 'Aula szkolna', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9dd454-51d0-11f1-b76b-107b448ef272'),
('Pożegnanie Klas Ósmych - Bal Absolwenta', 'Uroczyste zakończenie roku szkolnego dla absolwentów klas 8. Część oficjalna z wręczeniem świadectw, przemówieniami i podziękowaniami, następnie część taneczna w udekorowanej auli.', 'kulturalny', '2026-06-19', '17:00:00', 'Aula szkolna', 150, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9dd4b0-51d0-11f1-b76b-107b448ef272'),
('Uroczyste Zakończenie Roku Szkolnego', 'Ceremonia zakończenia roku szkolnego 2025/2026. Wręczenie świadectw, nagród dla najlepszych uczniów i wyróżnień. Po ceremonii uczniowie rozchodzą się na zasłużone wakacje.', 'zebranie', '2026-06-26', '09:00:00', 'Boisko szkolne', NULL, '44565e0f-ed5f-415d-b4ec-cabf29971b43', '2026-05-17 11:15:18.000000', '2026-05-17 11:15:18.000000', 'ec9dd508-51d0-11f1-b76b-107b448ef272');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ratings`
--

CREATE TABLE `ratings` (
  `user_id` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `id` varchar(36) NOT NULL,
  `event_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`user_id`, `rating`, `created_at`, `updated_at`, `id`, `event_id`) VALUES
('u0000000-0000-0000-0000-000000000001', 5, '2026-05-22 09:03:46.000000', '2026-05-22 09:03:46.000000', '60803939-55ac-11f1-a0cf-107b448ef272', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000002', 4, '2026-05-22 09:03:46.000000', '2026-05-22 09:03:46.000000', '60804394-55ac-11f1-a0cf-107b448ef272', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000003', 3, '2026-05-22 09:03:46.000000', '2026-05-22 09:03:46.000000', '60804481-55ac-11f1-a0cf-107b448ef272', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000004', 2, '2026-05-22 09:03:46.000000', '2026-05-22 09:03:46.000000', '6080450f-55ac-11f1-a0cf-107b448ef272', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000004', 5, '2026-05-22 09:03:46.000000', '2026-05-22 09:03:46.000000', '60804589-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000005', 5, '2026-05-22 09:03:46.000000', '2026-05-22 09:03:46.000000', '608045f4-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000009', 4, '2026-05-22 09:03:46.000000', '2026-05-22 09:03:46.000000', '60804659-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000011', 5, '2026-05-22 09:03:46.000000', '2026-05-22 09:03:46.000000', '608046b9-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000016', 5, '2026-05-22 09:03:46.000000', '2026-05-22 09:03:46.000000', '60808d0a-55ac-11f1-a0cf-107b448ef272', 'ec9d6839-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000017', 4, '2026-05-22 09:03:46.000000', '2026-05-22 09:03:46.000000', '60808dbe-55ac-11f1-a0cf-107b448ef272', 'ec9d6839-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000018', 4, '2026-05-22 09:03:46.000000', '2026-05-22 09:03:46.000000', '60808e2a-55ac-11f1-a0cf-107b448ef272', 'ec9d6839-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000010', 5, '2026-05-22 09:03:46.000000', '2026-05-22 09:03:46.000000', '60808e8e-55ac-11f1-a0cf-107b448ef272', 'ec9dba50-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000012', 4, '2026-05-22 09:03:46.000000', '2026-05-22 09:03:46.000000', '60808efe-55ac-11f1-a0cf-107b448ef272', 'ec9dba50-51d0-11f1-b76b-107b448ef272');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `registrations`
--

CREATE TABLE `registrations` (
  `user_id` varchar(255) NOT NULL,
  `registered_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `id` varchar(36) NOT NULL,
  `event_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`user_id`, `registered_at`, `id`, `event_id`) VALUES
('u0000000-0000-0000-0000-000000000001', '2026-05-22 09:03:46.000000', '607d18c6-55ac-11f1-a0cf-107b448ef272', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000002', '2026-05-22 09:03:46.000000', '607d2706-55ac-11f1-a0cf-107b448ef272', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000003', '2026-05-22 09:03:46.000000', '607d27fe-55ac-11f1-a0cf-107b448ef272', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000004', '2026-05-22 09:03:46.000000', '607d289a-55ac-11f1-a0cf-107b448ef272', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000007', '2026-05-22 09:03:46.000000', '607d2917-55ac-11f1-a0cf-107b448ef272', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000009', '2026-05-22 09:03:46.000000', '607d2995-55ac-11f1-a0cf-107b448ef272', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000010', '2026-05-22 09:03:46.000000', '607d2a05-55ac-11f1-a0cf-107b448ef272', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000012', '2026-05-22 09:03:46.000000', '607d2a6e-55ac-11f1-a0cf-107b448ef272', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000015', '2026-05-22 09:03:46.000000', '607d2ae2-55ac-11f1-a0cf-107b448ef272', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000018', '2026-05-22 09:03:46.000000', '607d2b52-55ac-11f1-a0cf-107b448ef272', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000020', '2026-05-22 09:03:46.000000', '607d2bbb-55ac-11f1-a0cf-107b448ef272', 'ec9d656f-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000004', '2026-05-22 09:03:46.000000', '607d2c2b-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000005', '2026-05-22 09:03:46.000000', '607d2cac-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000008', '2026-05-22 09:03:46.000000', '607d2d16-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000009', '2026-05-22 09:03:46.000000', '607d2d80-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000011', '2026-05-22 09:03:46.000000', '607d2de9-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000013', '2026-05-22 09:03:46.000000', '607d2e4f-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000014', '2026-05-22 09:03:46.000000', '607d2eb4-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000016', '2026-05-22 09:03:46.000000', '607d2f1b-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000017', '2026-05-22 09:03:46.000000', '607d2f84-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000019', '2026-05-22 09:03:46.000000', '607d2fe9-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000021', '2026-05-22 09:03:46.000000', '607d3051-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000022', '2026-05-22 09:03:46.000000', '607d30ba-55ac-11f1-a0cf-107b448ef272', 'ec9db0b9-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000016', '2026-05-22 09:03:46.000000', '607d3124-55ac-11f1-a0cf-107b448ef272', 'ec9d6839-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000017', '2026-05-22 09:03:46.000000', '607d318a-55ac-11f1-a0cf-107b448ef272', 'ec9d6839-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000018', '2026-05-22 09:03:46.000000', '607d31f4-55ac-11f1-a0cf-107b448ef272', 'ec9d6839-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000019', '2026-05-22 09:03:46.000000', '607d325b-55ac-11f1-a0cf-107b448ef272', 'ec9d6839-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000020', '2026-05-22 09:03:46.000000', '607d32c6-55ac-11f1-a0cf-107b448ef272', 'ec9d6839-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000021', '2026-05-22 09:03:46.000000', '607d333a-55ac-11f1-a0cf-107b448ef272', 'ec9d6839-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000010', '2026-05-22 09:03:46.000000', '607d33a0-55ac-11f1-a0cf-107b448ef272', 'ec9dba50-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000012', '2026-05-22 09:03:46.000000', '607d3413-55ac-11f1-a0cf-107b448ef272', 'ec9dba50-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000013', '2026-05-22 09:03:46.000000', '607d34b2-55ac-11f1-a0cf-107b448ef272', 'ec9dba50-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000014', '2026-05-22 09:03:46.000000', '607d356b-55ac-11f1-a0cf-107b448ef272', 'ec9dba50-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000015', '2026-05-22 09:03:46.000000', '607d35df-55ac-11f1-a0cf-107b448ef272', 'ec9dba50-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000003', '2026-05-22 09:03:46.000000', '607d3664-55ac-11f1-a0cf-107b448ef272', 'ec9dd454-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000006', '2026-05-22 09:03:46.000000', '607d3719-55ac-11f1-a0cf-107b448ef272', 'ec9dd454-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000008', '2026-05-22 09:03:46.000000', '607d37db-55ac-11f1-a0cf-107b448ef272', 'ec9dd454-51d0-11f1-b76b-107b448ef272'),
('u0000000-0000-0000-0000-000000000011', '2026-05-22 09:03:46.000000', '607d38a1-55ac-11f1-a0cf-107b448ef272', 'ec9dd454-51d0-11f1-b76b-107b448ef272');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` varchar(36) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `role` enum('USER','TEACHER','ADMIN') NOT NULL DEFAULT 'USER',
  `class` varchar(2) DEFAULT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `passwordHash`, `firstName`, `lastName`, `createdAt`, `role`, `class`, `isActive`) VALUES
('44565e0f-ed5f-415d-b4ec-cabf29971b43', 'admin@email.com', '$2b$12$Mly/T0WZbL8M27ejehXHrOHE6PxZIzQ5L33AXEbXwB7mGu0J6CrZO', 'Jan', 'Nowak', '2026-05-17 10:38:07.023963', 'ADMIN', NULL, 1),
('b0000000-0000-0000-0000-000000000001', 'k.kwiatkowska@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Krystyna', 'Kwiatkowska', '2026-05-22 09:03:46.000000', 'TEACHER', NULL, 1),
('b0000000-0000-0000-0000-000000000002', 'a.adamowicz@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Andrzej', 'Adamowicz', '2026-05-22 09:03:46.000000', 'TEACHER', NULL, 1),
('e8580adc-028c-47d1-89b7-5bfdf36b3b9c', 'admin@szkola.pl', '$2b$12$EaqAi0X/d8l7A/utSlAb..UOu4xYly5lpC4HKrGqIhyWEGJ8/glnG', 'Admin', 'Szkoły', '2026-05-21 21:19:46.762160', 'ADMIN', '0A', 1),
('f8404bd7-8aad-493c-81fa-f9ad06b14d39', 'jan.kowalski@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Jan', 'Kowalski', '2026-05-17 11:06:17.794037', 'USER', '3A', 1),
('u0000000-0000-0000-0000-000000000001', 'antoni.bielski@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Antoni', 'Bielski', '2026-05-22 09:03:46.000000', 'USER', '1A', 1),
('u0000000-0000-0000-0000-000000000002', 'zofia.borowska@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Zofia', 'Borowska', '2026-05-22 09:03:46.000000', 'USER', '1A', 1),
('u0000000-0000-0000-0000-000000000003', 'jan.cieślak@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Jan', 'Cieślak', '2026-05-22 09:03:46.000000', 'USER', '1B', 1),
('u0000000-0000-0000-0000-000000000004', 'julia.duda@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Julia', 'Duda', '2026-05-22 09:03:46.000000', 'USER', '2A', 1),
('u0000000-0000-0000-0000-000000000005', 'aleksander.gajda@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Aleksander', 'Gajda', '2026-05-22 09:03:46.000000', 'USER', '2A', 1),
('u0000000-0000-0000-0000-000000000006', 'marcel.górski@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Marcel', 'Górski', '2026-05-22 09:03:46.000000', 'USER', '2B', 1),
('u0000000-0000-0000-0000-000000000007', 'natalia.grabowska@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Natalia', 'Grabowska', '2026-05-22 09:03:46.000000', 'USER', '3A', 1),
('u0000000-0000-0000-0000-000000000008', 'filip.jankowski@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Filip', 'Jankowski', '2026-05-22 09:03:46.000000', 'USER', '3B', 1),
('u0000000-0000-0000-0000-000000000009', 'oliwia.król@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Oliwia', 'Król', '2026-05-22 09:03:46.000000', 'USER', '4A', 1),
('u0000000-0000-0000-0000-000000000010', 'adam.krupa@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Adam', 'Krupa', '2026-05-22 09:03:46.000000', 'USER', '4A', 1),
('u0000000-0000-0000-0000-000000000011', 'hanna.laskowska@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Hanna', 'Laskowska', '2026-05-22 09:03:46.000000', 'USER', '4B', 1),
('u0000000-0000-0000-0000-000000000012', 'igor.malinowski@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Igor', 'Malinowski', '2026-05-22 09:03:46.000000', 'USER', '5A', 1),
('u0000000-0000-0000-0000-000000000013', 'karolina.michalska@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Karolina', 'Michalska', '2026-05-22 09:03:46.000000', 'USER', '5B', 1),
('u0000000-0000-0000-0000-000000000014', 'nikodem.nowakowski@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Nikodem', 'Nowakowski', '2026-05-22 09:03:46.000000', 'USER', '6A', 1),
('u0000000-0000-0000-0000-000000000015', 'marta.olszewska@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Marta', 'Olszewska', '2026-05-22 09:03:46.000000', 'USER', '6B', 1),
('u0000000-0000-0000-0000-000000000016', 'dawid.ostrowski@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Dawid', 'Ostrowski', '2026-05-22 09:03:46.000000', 'USER', '7A', 1),
('u0000000-0000-0000-0000-000000000017', 'maria.pawlak@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Maria', 'Pawlak', '2026-05-22 09:03:46.000000', 'USER', '7A', 1),
('u0000000-0000-0000-0000-000000000018', 'kacper.pietrzak@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Kacper', 'Pietrzak', '2026-05-22 09:03:46.000000', 'USER', '7B', 1),
('u0000000-0000-0000-0000-000000000019', 'wiktoria.sikora@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Wiktoria', 'Sikora', '2026-05-22 09:03:46.000000', 'USER', '8A', 1),
('u0000000-0000-0000-0000-000000000020', 'maciej.sobczak@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Maciej', 'Sobczak', '2026-05-22 09:03:46.000000', 'USER', '8A', 1),
('u0000000-0000-0000-0000-000000000021', 'emilia.szczepańska@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Emilia', 'Szczepańska', '2026-05-22 09:03:46.000000', 'USER', '8B', 1),
('u0000000-0000-0000-0000-000000000022', 'jan.szewczyk@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Jan', 'Szewczyk', '2026-05-22 09:03:46.000000', 'USER', '8B', 1),
('u0000000-0000-0000-0000-000000000023', 'lilia.wasilewska@szkola.pl', '$2b$12$CzTxEXtJbyMzKqOryBc/meZjtaks7bMR.hP0qpUNde3.tgb9uiwAi', 'Lilia', 'Wasilewska', '2026-05-22 09:03:46.000000', 'USER', '8B', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_14c9ce53a2c2a1c781b8390123e` (`organizer_id`);

--
-- Indeksy dla tabeli `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_649eae9432dd48c0e79df43fe9` (`event_id`,`user_id`),
  ADD KEY `FK_f49ef8d0914a14decddbb170f2f` (`user_id`);

--
-- Indeksy dla tabeli `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_4a9503004f3598e35e0e5c4636` (`event_id`,`user_id`),
  ADD KEY `FK_6aacc9b213fd8c881af6c738ecf` (`user_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_97672ac88f789774dd47f7c8be` (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `FK_14c9ce53a2c2a1c781b8390123e` FOREIGN KEY (`organizer_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `FK_b4b9de806b24e78afc2aceec379` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_f49ef8d0914a14decddbb170f2f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `FK_6aacc9b213fd8c881af6c738ecf` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_c082d66f7080c743a96c1e91807` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
