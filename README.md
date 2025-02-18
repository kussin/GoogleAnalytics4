[![deutsche Version](https://logos.oxidmodule.com/de2_xs.svg)](README.md)

# ![D3 Logo](https://logos.oxidmodule.com/d3logo_24x24.svg) Google-Analytics 4 für OXID eShop

Dieses Modul bietet die Möglichkeit in Ihrem OXID eShop (6.x) die neue 'Property' Google Analytics 4 (GA4) von Google
zu integrieren.  
Hierfür stehen Ihnen verschiedene 'templates' zur verfügung, mit denen Sie bestimmte Events tracken können.  
Beispiele dafür sind: view_item, add_to_basket, purchase, ...

Weiterführende Informationen: https://developers.google.com/analytics/devguides/collection/ga4

## Inhaltsverzeichnis

- [Installation](#installation)
- [Verwendung](#verwendung)
- [Changelog](#changelog)
- [Lizenz](#lizenz)

## Installation

Dieses Paket erfordert einen mit Composer installierten OXID eShop in einer in der [composer.json](composer.json) definierten Version.

Bitte tragen Sie den folgenden Abschnitt in die `composer.json` Ihres Projektes ein:

```
  "extra": {
    "oxideshop": {
      "blacklist-filter": [
        "*.md",
        "composer.json",
        ".php-cs-fixer.php",
        "*.xml",
        "*.neon"
      ],
      "target-directory": "d3/googleanalytics"
  }
```

Öffnen Sie eine Kommandozeile und navigieren Sie zum Stammverzeichnis des Shops (Elternverzeichnis von source und vendor). Führen Sie den folgenden Befehl aus. Passen Sie die Pfadangaben an Ihre Installationsumgebung an.


```bash
php composer require d3/google-analytics4:^1
```

Sofern nötig, bestätigen Sie bitte, dass Sie `package-name` erlauben, Code auszuführen.

Aktivieren Sie das Modul im Shopadmin unter "Erweiterungen -> Module".

## Verwendung
### Grundfunktionalität
Nach erfolgreicher Installation finden Sie in Ihrem Shop-Admin unter "Erweiterungen > Module" 
den Eintrag 'Google Analytics 4'.
Aktivieren Sie dieses Modul, um die Funktionalitäten nutzen zu können.

Navigieren Sie danach zum Reiter 'Einstell.'.
Tragen Sie die nötige sog. 'Container ID' ein. Diese sieht in etwa so aus: 'GTM-W34LLOP'.

Aktivieren Sie GA4 selbst, indem Sie dieses direkt darunter anhaken.

### GA4 Events / Customizing
Für alle implementierten GA4 Events existieren Templates unter `source/modules/d3/googleanalytics4/Application/views/ga4/`, dabei entspricht der Dateiname dem Eventnamen in GA4.
Die Einbindung dieser Event-Templates erfolgt über TPL-Blöcke unter `source/modules/d3/googleanalytics4/Application/views/blocks/`.  
*Hinweis: nicht alle templates sind bereits gefüllt. Wünschen Sie die Implementierung eines unausgefüllten templates?
Kommen Sie auf uns zu unter https://www.d3data.de/

### Blöcke
Für den geregelten Ablauf sind folgende Blöcke nötig:
- Suchergebnisse
  - Blockname: search_results 
  - Datei: page/search/search.tpl
  - GA4 Event: view_search_results
- Artikelliste
  - Blockname: d3Ga4_view_item_list (muss hinzugefügt werden) 
  - Datei: widget/product/list.tpl
  - GA4 Event: view_item_list
- Detailseite
  - Blockname: details_productmain_title
  - Datei: page/details/inc/productmain.tpl
  - GA4 Event: view_item
- dem WK hinzufügen (button)
  - Blockname: details_productmain_tobasket
  - Datei: page/details/inc/productmain.tpl
  - GA4 Event: add_to_cart
- Warenkorb
  - Blockname: checkout_basket_main
  - Datei: page/checkout/basket.tpl
  - GA4 Event: view_cart
- abgeschlossener Kauf
  - Blockname: checkout_thankyou_main
  - Datei: page/checkout/thankyou.tpl
  - GA4 Event: purchase

### Verfügbare Datalayer Variablen
Für die einfachste Übersicht der enthaltenen Daten empfehle ich den Vorschau-Modus vom Google Tag Manager.

Bei jedem Seitenaufruf wird die Datenschicht mit einigen wenigen Infos erstellt, die man zum reinen Erfassen der Seitenaufrufe benötigt:
+ **page.type** - Seitentyp: default / cms / product / listing / checkout (an google analytics angelehnt)
+ **page.title** - Seitentitel (außer Startseite, sie hat keinen Titel)
+ **page.cl** - OXID Controller Klasse (start, search, etc)
+ **userid** - oxId vom Benutzer bzw `false` falls nicht eingeloggt
+ **sessionid** - session iD

Alle für Ecommerce Tracking relevanten Daten werden mit speziellen Ecommerce Events in die Datenschicht eingefügt.

---

Sie nutzen einen eigenen, als Modul im Shop installierten, Cookie-manager? Dann tragen Sie in den Folgeeinstellungen 
unter "Cookie Manager Einstellungen", die Cookie-ID des zugehörigen Cookies ein. Und aktivieren Sie diese Weiche,
indem Sie den Haken bei "Eigenen Cookie Manager nutzen?" setzen.

## Changelog

Siehe [CHANGELOG](CHANGELOG.md) für weitere Informationen.

## Beitragen

Wenn Sie einen Verbesserungsvorschlag haben, legen Sie einen Fork des Repositories an und erstellen Sie einen Pull Request. Alternativ können Sie einfach ein Issue erstellen. Fügen Sie das Projekt zu Ihren Favoriten hinzu. Vielen Dank.

- Erstellen Sie einen Fork des Projekts
- Erstellen Sie einen Feature Branch (git checkout -b feature/AmazingFeature)
- Fügen Sie Ihre Änderungen hinzu (git commit -m 'Add some AmazingFeature')
- Übertragen Sie den Branch (git push origin feature/AmazingFeature)
- Öffnen Sie einen Pull Request

## Lizenz
(Stand: 06.05.2021)

Vertrieben unter der GPLv3 Lizenz.

```
Copyright (c) D3 Data Development (Inh. Thomas Dartsch)

Diese Software wird unter der GNU GENERAL PUBLIC LICENSE Version 3 vertrieben.
```

Die vollständigen Copyright- und Lizenzinformationen entnehmen Sie bitte der [LICENSE](LICENSE.md)-Datei, die mit diesem Quellcode verteilt wurde.

## weitere Lizenzen und Nutzungsbedingungen

...