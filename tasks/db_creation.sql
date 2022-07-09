/*
Adatbázis létrehozása feladat

Készíts adatbázis-táblákat a feladat leírása alapján!
(Magát az adatbázist nem kell létrehoznod.)

Amit be kell adnod:
    - a táblák létrehozásának MySQL utasítása
    - a táblák mezőinek létrehozásához és beállításához szükséges MySQL utasítások

Az utasításokat jelen fájl tartalmazza!

A bónusz feladat megoldása nem kötelező.

Nem futtatható (azaz szintaktikai hibás) SQL utasításokért nem jár pont.
A feladatot részben teljesítő megoldásokért részpontszám jár.
A bónusz feladatnál csak a teljesen helyes megoldásért jár pont.

A feladat leírása törölhető.

Jó munkát!
*/

/*
Adatbázis-táblák létrehozása (20 pont)

Az általad létrehozott adatbázist egy üzenetküldő alkalmazáshoz szeretnénk használni.
Az alkalmazásban a felhasználók regisztrálás után tudnak üzenetet küldeni szintén regisztrált felhasználóknak,
valamint a kapott üzenetekre válaszolhatnak.
Nincs lehetőség több címzett megadására - azaz egy üzenetet csak egy felhasználó részére lehet küldeni.

Az adatbázisnak képesnek kell lennie a következő adatok tárolására:
    1. regisztrált felhasználók adatai
        - kötelező adatok: név, email-cím, jelszó, aktív felhasználó-e, a regisztrálás időpontja
    2. a regisztrált felhasználók által egymásnak küldött üzenetek adatai
        - kötelező adatok: küldő, címzett, üzenet szövege, az üzenet küldésének időpontja,
          továbbá ha az üzenet egy korábban kapottra válasz, akkor hivatkozás a megválaszolt üzenetre

Kritériumok az adatbázissal kapcsolatban:
    - legalább kettő, legfeljebb négy táblát tartalmazzon
    - legyen legalább egy kapcsolat a létrehozott táblák között (idegen kulccsal)
      (egy tábla saját magával is kapcsolódhat)
    - a fent leírt adatokon kívül más adatokat is tárolhat, de egy táblán legfeljebb 8 mező lehet
    - az adatbázis, a táblák és a mezők elnevezése rajtad áll, azonban használj angol megnevezéseket, méghozzá következetesen
      (ha az egyik táblában camel-case szerinti mező-neveket adtál, akkor a másik táblában is tégy úgy)

*/

CREATE TABLE `modul`.`user_data` (`id` INT NOT NULL AUTO_INCREMENT , `name` VARCHAR(100) NOT NULL ,
`e-mail` VARCHAR(100) NOT NULL , `password` VARCHAR(100) NOT NULL , `activity` BOOLEAN NOT NULL ,
`registration_date` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY (`id`)) ENGINE = InnoDB;

CREATE TABLE `modul`.`message` (`id` INT NOT NULL AUTO_INCREMENT , `sender_id` INT NOT NULL ,
`getter_id` INT NOT NULL , `text` TEXT NOT NULL , `send_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`answered_letter_id` INT NULL DEFAULT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE message ADD FOREIGN KEY (sender_id) REFERENCES user_data(id);

ALTER TABLE message ADD FOREIGN KEY (getter_id) REFERENCES user_data(id);

ALTER TABLE message ADD FOREIGN KEY (answered_letter_id) REFERENCES message(id);


-- ---------------------------------------------------------------------------------------------------------------------

/*
Bónusz feladat (5 pont)

Adj hozzá adatokat mindegyik táblához!
(Az adatoknak nem kell valósnak lenniük. Egy felhasználói email-cím lehet például: 'valami@valami.va')

*/

INSERT INTO `user_data`(`name`, `e-mail`, `password`, `activity`) VALUES ('Kis Pista', 'valami@valami.va', 1234, 1)

INSERT INTO `message`(`sender_id`, `getter_id`, `text`) VALUES (1, 1, 'Hello')

INSERT INTO `message`(`sender_id`, `getter_id`, `text`, `answered_letter_id`) VALUES (1, 1, 'Szia',1 )
