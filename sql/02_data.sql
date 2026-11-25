-- =====================================================================
-- Mindfit București - date de test
-- Rulezi acest script DUPA 01_schema.sql, pe baza de date "mindfit".
-- Datele sunt fictive (nume, emailuri, telefoane, CUI).
-- =====================================================================

-- ---------- CATEGORII ----------
INSERT INTO categorii (id_categorie, nume_categorie, descriere) VALUES
(1, 'Tricouri',      'Tricouri unisex, premium si sport'),
(2, 'Hanorace',      'Hanorace cu gluga si bluze fara gluga'),
(3, 'Polo',          'Tricouri polo pentru echipe si companii'),
(4, 'Șepci',         'Șepci baseball personalizabile'),
(5, 'Genți de pânză','Genți tote din bumbac');

-- ---------- PRODUSE ----------
INSERT INTO produse (id_produs, id_categorie, nume_produs, descriere, marca, material, pret_baza, este_activ) VALUES
(1, 1, 'Tricou bumbac unisex',   'Tricou clasic, 150 g/mp',            'Gildan',        '100% bumbac',           35.00, true),
(2, 1, 'Tricou premium',         'Tricou gros, croi modern',           'Stanley/Stella','bumbac organic',        55.00, true),
(3, 2, 'Hanorac cu glugă',       'Hanorac unisex cu buzunar cangur',   'Gildan',        '50% bumbac 50% poliester', 95.00, true),
(4, 2, 'Bluză fără glugă',       'Bluză groasă cu guler rotund',       'Gildan',        '50% bumbac 50% poliester', 85.00, true),
(5, 3, 'Tricou polo',            'Polo pique cu nasturi',              'Russell',       '100% bumbac',           60.00, true),
(6, 4, 'Șapcă baseball',         'Șapcă cu 6 panele, reglabilă',       'Beechfield',    'bumbac twill',          30.00, true),
(7, 5, 'Geantă de pânză',        'Geantă tote cu toarte lungi',        'Bag Base',      '100% bumbac',           20.00, true),
(8, 1, 'Tricou sport',           'Tricou tehnic pentru sublimare',     'Kariban',       '100% poliester',        40.00, true);

-- ---------- VARIANTE PRODUS ----------
INSERT INTO variante_produs (id_varianta, id_produs, marime, culoare, cod_sku, stoc, pret_suplimentar) VALUES
(1,  1, 'M',     'Alb',        'TRI-BAS-M-ALB',  120, 0),
(2,  1, 'L',     'Alb',        'TRI-BAS-L-ALB',  100, 0),
(3,  1, 'M',     'Negru',      'TRI-BAS-M-NEG',   90, 0),
(4,  1, 'L',     'Negru',      'TRI-BAS-L-NEG',   85, 0),
(5,  1, 'XL',    'Negru',      'TRI-BAS-XL-NEG',  60, 2.00),
(6,  2, 'S',     'Alb',        'TRI-PRE-S-ALB',   40, 0),
(7,  2, 'M',     'Alb',        'TRI-PRE-M-ALB',   55, 0),
(8,  2, 'L',     'Bleumarin',  'TRI-PRE-L-BLM',   35, 0),
(9,  3, 'M',     'Negru',      'HAN-GLU-M-NEG',   30, 0),
(10, 3, 'L',     'Negru',      'HAN-GLU-L-NEG',   28, 0),
(11, 3, 'L',     'Gri',        'HAN-GLU-L-GRI',   25, 0),
(12, 3, 'XL',    'Gri',        'HAN-GLU-XL-GRI',  20, 5.00),
(13, 4, 'M',     'Bleumarin',  'HAN-BLZ-M-BLM',   22, 0),
(14, 4, 'L',     'Bleumarin',  'HAN-BLZ-L-BLM',   18, 0),
(15, 5, 'M',     'Alb',        'POL-M-ALB',       25, 0),
(16, 5, 'L',     'Bleumarin',  'POL-L-BLM',       20, 0),
(17, 6, 'Unică', 'Negru',      'SAP-UNI-NEG',     80, 0),
(18, 6, 'Unică', 'Roșu',       'SAP-UNI-ROS',     50, 0),
(19, 7, 'Unică', 'Natur',      'GEN-UNI-NAT',    150, 0),
(20, 8, 'M',     'Alb',        'TRS-M-ALB',       45, 0),
(21, 8, 'L',     'Alb',        'TRS-L-ALB',       40, 0);

-- ---------- CLIENȚI ----------
INSERT INTO clienti (id_client, prenume, nume, email, telefon, tip_client, denumire_firma, cui, data_creare) VALUES
(1,  'Andrei',    'Popescu',    'andrei.popescu@example.com',    '0721000001', 'persoana_fizica', NULL, NULL, '2026-08-20 10:00'),
(2,  'Maria',     'Ionescu',    'maria.ionescu@example.com',     '0721000002', 'persoana_fizica', NULL, NULL, '2026-09-01 12:30'),
(3,  'Elena',     'Dumitrescu', 'elena.dumitrescu@example.com',  '0721000003', 'persoana_fizica', NULL, NULL, '2026-09-10 09:15'),
(4,  'Bogdan',    'Stan',       'bogdan.stan@example.com',       '0721000004', 'persoana_fizica', NULL, NULL, '2026-09-25 18:00'),
(5,  'Ioana',     'Georgescu',  'ioana.georgescu@example.com',   '0721000005', 'persoana_fizica', NULL, NULL, '2026-10-05 11:45'),
(6,  'Cristian',  'Marin',      'cristian.marin@example.com',    '0721000006', 'persoana_fizica', NULL, NULL, '2026-10-12 14:20'),
(7,  'Alexandra', 'Radu',       'alexandra.radu@example.com',    '0721000007', 'firma', 'Fit Club Berceni SRL',          'RO12345678', '2026-09-15 10:30'),
(8,  'Mihai',     'Toma',       'mihai.toma@example.com',        '0721000008', 'firma', 'Studio Pilates Floreasca SRL',  'RO23456789', '2026-10-01 13:00'),
(9,  'Daniela',   'Vasile',     'daniela.vasile@example.com',    '0721000009', 'firma', 'Asociația Sportivă Dinamic',    '34567890',   '2026-10-20 09:40'),
(10, 'Răzvan',    'Constantin', 'razvan.constantin@example.com', '0721000010', 'persoana_fizica', NULL, NULL, '2026-11-02 16:10');

-- ---------- ADRESE ----------
INSERT INTO adrese (id_adresa, id_client, tip_adresa, strada, oras, judet, cod_postal) VALUES
(1,  1,  'livrare',   'Str. Fabricii nr. 12',          'București', 'București', '030167'),
(2,  2,  'livrare',   'Bd. Iuliu Maniu nr. 45',        'București', 'București', '061072'),
(3,  3,  'livrare',   'Str. Pipera nr. 8',             'Voluntari', 'Ilfov',     '077190'),
(4,  4,  'livrare',   'Calea Victoriei nr. 100',       'București', 'București', '010072'),
(5,  5,  'livrare',   'Str. Mihai Bravu nr. 210',      'București', 'București', '030313'),
(6,  6,  'livrare',   'Șos. Colentina nr. 33',         'București', 'București', '021183'),
(7,  7,  'livrare',   'Șos. Berceni nr. 70',           'București', 'București', '041911'),
(8,  7,  'facturare', 'Str. Vitan nr. 15, birou 2',    'București', 'București', '031296'),
(9,  8,  'livrare',   'Str. Floreasca nr. 60',         'București', 'București', '014456'),
(10, 8,  'facturare', 'Str. Floreasca nr. 60',         'București', 'București', '014456'),
(11, 9,  'livrare',   'Str. Dinamo nr. 3',             'București', 'București', '014231'),
(12, 9,  'facturare', 'Bd. Ion Mihalache nr. 150',     'București', 'București', '011172'),
(13, 10, 'livrare',   'Str. Aviatorilor nr. 25',       'București', 'București', '011851');

-- ---------- ANGAJAȚI ----------
INSERT INTO angajati (id_angajat, prenume, nume, rol, email, telefon, data_angajare) VALUES
(1, 'Laura',   'Nistor',   'designer',       'laura.nistor@mindfit.example',   '0722000001', '2024-03-01'),
(2, 'Vlad',    'Barbu',    'operator_print', 'vlad.barbu@mindfit.example',     '0722000002', '2024-06-15'),
(3, 'Simona',  'Enache',   'vanzari',        'simona.enache@mindfit.example',  '0722000003', '2025-01-10'),
(4, 'Cătălin', 'Ciobanu',  'operator_print', 'catalin.ciobanu@mindfit.example','0722000004', '2025-09-01');

-- ---------- TEHNICI PRINT ----------
INSERT INTO tehnici_print (id_tehnica, nume_tehnica, descriere, pret_per_bucata, cantitate_minima) VALUES
(1, 'DTF',        'Transfer digital, full color, potrivit pentru orice material', 15.00, 1),
(2, 'Serigrafie', 'Print cu sabloane, ideal pentru comenzi mari',                  8.00, 20),
(3, 'Broderie',   'Broderie computerizata, aspect premium',                       25.00, 1),
(4, 'Flex',       'Folie termotransfer, potrivit pentru text si numere',          12.00, 1),
(5, 'Sublimare',  'Print pe poliester, culori vii, fara senzatie la atingere',    18.00, 10);

-- ---------- POZIȚII PRINT ----------
INSERT INTO pozitii_print (id_pozitie, nume_pozitie, latime_max_cm, inaltime_max_cm, pret_suplimentar) VALUES
(1, 'Piept stânga',   10.0, 10.0, 0),
(2, 'Piept centru',   30.0, 35.0, 0),
(3, 'Spate',          35.0, 45.0, 5.00),
(4, 'Mânecă stânga',   8.0,  8.0, 3.00),
(5, 'Mânecă dreapta',  8.0,  8.0, 3.00);

-- ---------- MODELE GRAFICE ----------
INSERT INTO modele_grafice (id_model, id_client, nume_model, cale_fisier, tip_fisier, text_personalizat, font, culoare_text, aprobat, data_incarcare) VALUES
(1,  1,  'Logo echipă futsal',   'designs/futsal_logo.png',  'PNG', 'FC Titan',          'Impact',       'alb',    true,  '2026-09-04 18:20'),
(2,  2,  'Text cadou aniversar', NULL,                       NULL,  'Cea mai bună mamă', 'Pacifico',     'roz',    true,  '2026-09-11 20:05'),
(3,  3,  'Poză familie',         'designs/familie.png',      'PNG', NULL,                NULL,           NULL,     true,  '2026-11-11 19:30'),
(4,  4,  'Număr 10 spate',       NULL,                       NULL,  '10 STAN',           'Arial Black',  'alb',    true,  '2026-10-01 21:00'),
(5,  7,  'Logo Fit Club',        'designs/fitclub.svg',      'SVG', NULL,                NULL,           NULL,     true,  '2026-09-18 10:10'),
(6,  8,  'Logo Studio Pilates',  'designs/pilates.svg',      'SVG', NULL,                NULL,           NULL,     true,  '2026-10-08 12:00'),
(7,  9,  'Siglă asociație',      'designs/dinamic.pdf',      'PDF', NULL,                NULL,           NULL,     true,  '2026-10-27 09:30'),
(8,  5,  'Citat motivațional',   NULL,                       NULL,  'Mind over matter',  'Montserrat',   'negru',  true,  '2026-10-17 22:15'),
(9,  6,  'Desen caricatură',     'designs/caricatura.png',   'PNG', NULL,                NULL,           NULL,     false, '2026-11-15 17:30'),
(10, 10, 'Nume brodat',          NULL,                       NULL,  'Răzvan',            'Script',       'auriu',  true,  '2026-11-04 15:50');

-- ---------- COMENZI (suma_totala se calculeaza mai jos) ----------
INSERT INTO comenzi (id_comanda, id_client, id_adresa_livrare, id_adresa_facturare, id_angajat, data_comanda, data_limita, status, status_plata, metoda_livrare, cost_livrare, suma_totala, observatii) VALUES
(1,  1,  1,  1,  3, '2026-09-05 10:15', '2026-09-12', 'livrata',      'platita',   'curier',             15.00, 0, 'Echipament futsal, 12 tricouri'),
(2,  2,  2,  2,  3, '2026-09-12 14:30', '2026-09-18', 'livrata',      'platita',   'curier',             15.00, 0, 'Cadou de ziua mamei'),
(3,  7,  7,  8,  1, '2026-09-20 09:00', '2026-10-04', 'livrata',      'platita',   'curier',              0.00, 0, 'Hanorace pentru antrenori si staff'),
(4,  4,  4,  4,  3, '2026-10-02 16:45', '2026-10-09', 'livrata',      'platita',   'ridicare personala',  0.00, 0, NULL),
(5,  8,  9,  10, 1, '2026-10-10 11:20', '2026-10-24', 'livrata',      'platita',   'curier',              0.00, 0, 'Polo brodate pentru instructori'),
(6,  5,  5,  5,  3, '2026-10-18 13:10', '2026-10-25', 'livrata',      'platita',   'curier',             15.00, 0, NULL),
(7,  9,  11, 12, 1, '2026-10-28 10:00', '2026-11-12', 'in_productie', 'partial',   'curier',              0.00, 0, 'Echipament sublimat pentru turneu, avans 50%'),
(8,  10, 13, 13, 3, '2026-11-05 15:20', '2026-11-15', 'gata',         'platita',   'curier',             15.00, 0, 'Cadou, nume brodat'),
(9,  3,  3,  3,  3, '2026-11-12 12:00', '2026-11-22', 'in_productie', 'neplatita', 'ramburs',           20.00, 0, NULL),
(10, 6,  6,  6,  3, '2026-11-15 17:40', '2026-11-25', 'noua',         'neplatita', 'curier',             15.00, 0, 'Asteapta aprobarea desenului');

-- ---------- ARTICOLE COMANDĂ ----------
INSERT INTO articole_comanda (id_articol, id_comanda, id_varianta, cantitate, pret_unitar) VALUES
(1,  1,  3,  6,  35.00),
(2,  1,  4,  6,  35.00),
(3,  2,  7,  1,  55.00),
(4,  3,  10, 15, 95.00),
(5,  3,  9,  10, 95.00),
(6,  4,  5,  1,  37.00),
(7,  5,  15, 12, 60.00),
(8,  5,  16, 8,  60.00),
(9,  6,  1,  1,  35.00),
(10, 6,  17, 1,  30.00),
(11, 7,  20, 25, 40.00),
(12, 7,  21, 25, 40.00),
(13, 8,  8,  1,  55.00),
(14, 9,  11, 1,  95.00),
(15, 9,  19, 2,  20.00),
(16, 10, 13, 1,  85.00),
(17, 10, 2,  1,  35.00);

-- ---------- PERSONALIZĂRI ARTICOL (pret_personalizare = pret pe bucata) ----------
INSERT INTO personalizari_articol (id_personalizare, id_articol, id_model, id_tehnica, id_pozitie, pret_personalizare, previzualizare_aprobata) VALUES
(1,  1,  1,  1, 1, 15.00, true),
(2,  1,  1,  1, 3, 20.00, true),
(3,  2,  1,  1, 1, 15.00, true),
(4,  2,  1,  1, 3, 20.00, true),
(5,  3,  2,  1, 2, 15.00, true),
(6,  4,  5,  2, 1,  8.00, true),
(7,  4,  5,  2, 3, 13.00, true),
(8,  5,  5,  2, 1,  8.00, true),
(9,  5,  5,  2, 3, 13.00, true),
(10, 6,  4,  4, 3, 17.00, true),
(11, 7,  6,  3, 1, 25.00, true),
(12, 8,  6,  3, 1, 25.00, true),
(13, 9,  8,  1, 2, 15.00, true),
(14, 10, 8,  3, 2, 25.00, true),
(15, 11, 7,  5, 2, 18.00, true),
(16, 11, 7,  5, 4, 21.00, true),
(17, 12, 7,  5, 2, 18.00, true),
(18, 12, 7,  5, 4, 21.00, true),
(19, 13, 10, 3, 1, 25.00, true),
(20, 14, 3,  1, 2, 15.00, true),
(21, 15, 3,  1, 2, 15.00, true),
(22, 16, 9,  1, 2, 15.00, false),
(23, 17, 9,  1, 2, 15.00, false);

-- ---------- CALCUL TOTAL COMENZI ----------
-- suma_totala = cost_livrare + SUM(cantitate * (pret_unitar + personalizari))
UPDATE comenzi c
SET suma_totala = c.cost_livrare + COALESCE((
    SELECT SUM(a.cantitate * (a.pret_unitar + COALESCE((
        SELECT SUM(p.pret_personalizare)
        FROM personalizari_articol p
        WHERE p.id_articol = a.id_articol
    ), 0)))
    FROM articole_comanda a
    WHERE a.id_comanda = c.id_comanda
), 0);

-- ---------- PLĂȚI ----------
-- plata cu cardul (comenzile 1, 2, 4, 6, 8)
INSERT INTO plati (id_comanda, data_plata, suma, metoda_plata, referinta_tranzactie, status)
SELECT id_comanda, data_comanda + interval '1 hour', suma_totala, 'card', 'TRX-' || id_comanda, 'confirmata'
FROM comenzi
WHERE id_comanda IN (1, 2, 4, 6, 8);

-- plata prin transfer bancar (comenzile 3 si 5, firme)
INSERT INTO plati (id_comanda, data_plata, suma, metoda_plata, referinta_tranzactie, status)
SELECT id_comanda, data_comanda + interval '3 days', suma_totala, 'transfer', 'OP-' || id_comanda, 'confirmata'
FROM comenzi
WHERE id_comanda IN (3, 5);

-- avans 50% pentru comanda 7
INSERT INTO plati (id_comanda, data_plata, suma, metoda_plata, referinta_tranzactie, status)
SELECT id_comanda, data_comanda + interval '2 days', ROUND(suma_totala * 0.5, 2), 'transfer', 'OP-AVANS-' || id_comanda, 'confirmata'
FROM comenzi
WHERE id_comanda = 7;

-- ---------- FACTURI (preturile includ TVA 19%) ----------
INSERT INTO facturi (id_comanda, numar_factura, data_emitere, suma_totala, suma_tva)
SELECT id_comanda,
       'MF-2026-' || LPAD(id_comanda::text, 4, '0'),
       data_comanda::date,
       suma_totala,
       ROUND(suma_totala * 19 / 119, 2)
FROM comenzi
WHERE status_plata = 'platita';

-- ---------- FURNIZORI ----------
INSERT INTO furnizori (id_furnizor, denumire_furnizor, persoana_contact, email, telefon, oras) VALUES
(1, 'Textile Prim SRL',    'Adrian Lungu',  'comenzi@textileprim.example', '0723000001', 'București'),
(2, 'Confecții Nord SA',   'Gabriela Matei','vanzari@confectiinord.example','0723000002', 'Cluj-Napoca'),
(3, 'Promo Wear Import',   'Sorin Preda',   'office@promowear.example',    '0723000003', 'Timișoara');

-- ---------- PRODUSE FURNIZORI ----------
INSERT INTO produse_furnizori (id_furnizor, id_produs, pret_achizitie, termen_livrare_zile) VALUES
(1, 1, 18.00, 3),
(1, 3, 52.00, 5),
(1, 4, 46.00, 5),
(2, 2, 30.00, 7),
(2, 5, 33.00, 7),
(3, 6, 14.00, 10),
(3, 7, 8.00,  10),
(3, 8, 20.00, 10);

-- ---------- ACTUALIZARE SECVENTE (dupa inserari cu ID explicit) ----------
SELECT setval(pg_get_serial_sequence('categorii',             'id_categorie'),    (SELECT MAX(id_categorie)    FROM categorii));
SELECT setval(pg_get_serial_sequence('produse',               'id_produs'),       (SELECT MAX(id_produs)       FROM produse));
SELECT setval(pg_get_serial_sequence('variante_produs',       'id_varianta'),     (SELECT MAX(id_varianta)     FROM variante_produs));
SELECT setval(pg_get_serial_sequence('clienti',               'id_client'),       (SELECT MAX(id_client)       FROM clienti));
SELECT setval(pg_get_serial_sequence('adrese',                'id_adresa'),       (SELECT MAX(id_adresa)       FROM adrese));
SELECT setval(pg_get_serial_sequence('angajati',              'id_angajat'),      (SELECT MAX(id_angajat)      FROM angajati));
SELECT setval(pg_get_serial_sequence('tehnici_print',         'id_tehnica'),      (SELECT MAX(id_tehnica)      FROM tehnici_print));
SELECT setval(pg_get_serial_sequence('pozitii_print',         'id_pozitie'),      (SELECT MAX(id_pozitie)      FROM pozitii_print));
SELECT setval(pg_get_serial_sequence('modele_grafice',        'id_model'),        (SELECT MAX(id_model)        FROM modele_grafice));
SELECT setval(pg_get_serial_sequence('comenzi',               'id_comanda'),      (SELECT MAX(id_comanda)      FROM comenzi));
SELECT setval(pg_get_serial_sequence('articole_comanda',      'id_articol'),      (SELECT MAX(id_articol)      FROM articole_comanda));
SELECT setval(pg_get_serial_sequence('personalizari_articol', 'id_personalizare'),(SELECT MAX(id_personalizare)FROM personalizari_articol));
SELECT setval(pg_get_serial_sequence('furnizori',             'id_furnizor'),     (SELECT MAX(id_furnizor)     FROM furnizori));

-- ---------- VERIFICARE RAPIDA ----------
-- SELECT id_comanda, status, status_plata, suma_totala FROM comenzi ORDER BY id_comanda;
