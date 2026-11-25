-- Mindfit București - interogările mele
-- Se rulează după 01_schema.sql și 02_data.sql


-- 1. comenzile împreună cu numele clientului
SELECT c.id_comanda,
       cl.prenume || ' ' || cl.nume AS client,
       c.data_comanda,
       c.status,
       c.suma_totala
FROM comenzi c
JOIN clienti cl ON cl.id_client = c.id_client
ORDER BY c.data_comanda DESC;


-- 2. cât a cheltuit fiecare client (cei mai mari primii)
SELECT cl.prenume, cl.nume, SUM(c.suma_totala) AS total_cheltuit
FROM clienti cl
JOIN comenzi c ON c.id_client = cl.id_client
GROUP BY cl.id_client, cl.prenume, cl.nume
ORDER BY total_cheltuit DESC;


-- 3. câte produse are fiecare categorie
SELECT cat.nume_categorie, COUNT(p.id_produs) AS nr_produse
FROM categorii cat
JOIN produse p ON p.id_categorie = cat.id_categorie
GROUP BY cat.nume_categorie
ORDER BY nr_produse DESC;


-- 4. ce tehnici de print se folosesc cel mai des
SELECT t.nume_tehnica, COUNT(*) AS utilizari
FROM personalizari_articol pa
JOIN tehnici_print t ON t.id_tehnica = pa.id_tehnica
GROUP BY t.nume_tehnica
ORDER BY utilizari DESC;


-- 5. banii făcuți din personalizări, pe fiecare tehnică
-- (înmulțesc prețul personalizării cu cantitatea din comandă)
SELECT t.nume_tehnica,
       SUM(a.cantitate * pa.pret_personalizare) AS venit_personalizari
FROM personalizari_articol pa
JOIN tehnici_print t    ON t.id_tehnica = pa.id_tehnica
JOIN articole_comanda a ON a.id_articol = pa.id_articol
GROUP BY t.nume_tehnica
ORDER BY venit_personalizari DESC;


-- 6. valoarea stocului pe categorie
-- (preț de bază + preț suplimentar, înmulțit cu stocul)
SELECT cat.nume_categorie,
       SUM(v.stoc) AS bucati_in_stoc,
       SUM(v.stoc * (p.pret_baza + v.pret_suplimentar)) AS valoare_stoc
FROM variante_produs v
JOIN produse p     ON p.id_produs = v.id_produs
JOIN categorii cat ON cat.id_categorie = p.id_categorie
GROUP BY cat.nume_categorie
ORDER BY valoare_stoc DESC;


-- 7. venitul pe luni (nu iau în calcul comenzile anulate)
SELECT DATE_TRUNC('month', data_comanda)::date AS luna,
       COUNT(*) AS nr_comenzi,
       SUM(suma_totala) AS venit
FROM comenzi
WHERE status <> 'anulata'
GROUP BY DATE_TRUNC('month', data_comanda)
ORDER BY luna DESC;


-- 8. clienții care au cheltuit mai mult de 1000 lei
-- aici folosesc HAVING pentru că filtrez după SUM
SELECT cl.prenume, cl.nume, SUM(c.suma_totala) AS total_cheltuit
FROM clienti cl
JOIN comenzi c ON c.id_client = cl.id_client
GROUP BY cl.id_client, cl.prenume, cl.nume
HAVING SUM(c.suma_totala) > 1000
ORDER BY total_cheltuit DESC;


-- 9. comenzile care nu sunt plătite complet
SELECT id_comanda, data_comanda, status, status_plata, suma_totala
FROM comenzi
WHERE status_plata IN ('neplatita', 'partial')
ORDER BY data_comanda;


-- 10. cât mai are de plată fiecare comandă
-- LEFT JOIN ca să apară și comenzile care nu au nicio plată
SELECT c.id_comanda,
       c.suma_totala,
       COALESCE(SUM(p.suma), 0) AS achitat,
       c.suma_totala - COALESCE(SUM(p.suma), 0) AS rest_de_plata
FROM comenzi c
LEFT JOIN plati p ON p.id_comanda = c.id_comanda
GROUP BY c.id_comanda, c.suma_totala
HAVING c.suma_totala - COALESCE(SUM(p.suma), 0) > 0
ORDER BY rest_de_plata DESC;


-- 11. comenzile mai mari decât media (subinterogare)
SELECT id_comanda, suma_totala
FROM comenzi
WHERE suma_totala > (SELECT AVG(suma_totala) FROM comenzi)
ORDER BY suma_totala DESC;


-- 12. împart comenzile în mari / medii / mici cu CASE
SELECT id_comanda,
       suma_totala,
       CASE
         WHEN suma_totala >= 2000 THEN 'Mare'
         WHEN suma_totala >= 500  THEN 'Medie'
         ELSE 'Mică'
       END AS categorie_comanda
FROM comenzi
ORDER BY suma_totala DESC;


-- 13. clasamentul clienților după cât au cheltuit (RANK)
SELECT cl.prenume,
       cl.nume,
       SUM(c.suma_totala) AS total,
       RANK() OVER (ORDER BY SUM(c.suma_totala) DESC) AS loc
FROM clienti cl
JOIN comenzi c ON c.id_client = cl.id_client
GROUP BY cl.id_client, cl.prenume, cl.nume
ORDER BY loc;


-- 14. produsele care s-au împuținat (stoc sub 30)
SELECT p.nume_produs, v.marime, v.culoare, v.stoc
FROM variante_produs v
JOIN produse p ON p.id_produs = v.id_produs
WHERE v.stoc < 30
ORDER BY v.stoc;


-- 15. VIEW cu detaliile unei comenzi: client, produse și personalizări
-- am folosit LEFT JOIN la personalizări, pentru că nu toate articolele au
CREATE OR REPLACE VIEW v_detalii_comanda AS
SELECT c.id_comanda,
       cl.prenume || ' ' || cl.nume AS client,
       c.data_comanda,
       c.status,
       p.nume_produs,
       v.marime,
       v.culoare,
       a.cantitate,
       t.nume_tehnica,
       poz.nume_pozitie
FROM comenzi c
JOIN clienti cl                    ON cl.id_client   = c.id_client
JOIN articole_comanda a            ON a.id_comanda   = c.id_comanda
JOIN variante_produs v             ON v.id_varianta  = a.id_varianta
JOIN produse p                     ON p.id_produs    = v.id_produs
LEFT JOIN personalizari_articol pa ON pa.id_articol  = a.id_articol
LEFT JOIN tehnici_print t          ON t.id_tehnica   = pa.id_tehnica
LEFT JOIN pozitii_print poz        ON poz.id_pozitie = pa.id_pozitie;

-- testez view-ul pentru comanda 3
SELECT * FROM v_detalii_comanda WHERE id_comanda = 3;
