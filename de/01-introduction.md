Einleitung
==========

Über diese Einführung
---------------------

Willkommen zu **Learn You a Haskell for Great Good**! Wenn Sie das hier lesen,
liegt der Verdacht nahe, dass Sie Haskell lernen möchten. Schön, Sie sind am
richtigen Ort dafür, aber lassen Sie uns zunächst über diese Einführung
sprechen.

Ich habe mich dazu entschieden, diese Einführung zu schreiben, weil ich mein
eigenes Wissen rund um Haskell festigen wollte und weil ich dachte, Anfängern
Haskell aus meiner Perspektive beibringen zu können. Im Internet sind einige
Einführungen zu Haskell im Umlauf. Als ich mit Haskell begann, lernte ich nicht
nur aus einer einzigen Quelle. Ich brachte mir die Sprache bei, indem ich
verschiedene Einführungen und Artikel las, da jede einzelne Einführung
verschiedene Dinge unterschiedlich erklärte. Indem ich mehrere Quellen
verwendete, konnte ich die einzelnen Teile zu einem großen Ganzen zusammenfügen.
Dies ist ein Versuch, eine weitere hilfreiche Quelle zum Erlernen von Haskell
beizusteuern, um Ihnen zu ermöglichen, diejenige zu finden, die Ihnen gefällt.

![](../img/bird.png)

Diese Einführung ist auf Personen ausgerichtet, die bereits Erfahrungen mit
imperativer Programmierung (C, C++, Java, Python, usw.) gemacht haben, die jedoch
noch nicht in funktionalen Programmiersprachen (Haskell, ML, OCaml, usw.)
programmiert haben. Trotzdem wette ich, dass eine schlaue Person wie Sie,
sollten Sie noch keine nennenswerte Programmiererfahrung gesammelt haben, in der
Lage sein sollte, den Kapiteln zu folgen und Haskell zu erlernen.

Der IRC-Channel `#haskell` im Freenode-Netzwerk ist ein prima Ort, um Fragen zu
stellen, sollten Sie nicht mehr weiterkommen. Die Leute sind dort wirklich nett,
geduldig und verständnisvoll gegenüber Anfängern. Für deutsche Nutzer gibt es
zudem `#haskell.de`.

Ungefähr zweimal bin ich daran gescheitert, Haskell zu erlernen, bevor ich es
schlussendlich begriff, da mir vieles zu merkwürdig vorkam. Aber als es dann
nach den ersten Startschwierigkeiten „Klick“ machte, lief alles glatt. Ich
schätze ich will damit sagen, dass Haskell toll ist und dass Sie es wirklich
lernen sollten, wenn Sie sich für’s Programmieren interessieren, selbst wenn am
Anfang vieles seltsam erscheint. Haskell zu erlernen, ist wie die erste
Programmiersprache zu erlernen -- es macht Spaß! Es zwingt einen dazu, anders zu
denken, was uns auch zum zweiten Abschnitt bringt. …

Also was ist Haskell?
---------------------

![](../img/fx.png) Haskell ist eine **rein funktionale Programmiersprache**.
In imperativen Sprachen werden Dinge erledigt, indem man dem Computer eine Reihe
von Aufgaben gibt und er diese dann ausführt. Während der Ausführung ändert der
Computer seinen Zustand. Man weist beispielsweise einer Variable `a` den Wert 5
zu, macht dann etwas anderes und weist ihr schließlich einen anderen Wert zu.
Es gibt Kontrollstrukturen um etwas zu wiederholen. In rein funktionalen
Programmiersprachen sagt man dem Computer nicht, was er machen soll, sondern man
sagt ihm, was etwas _ist_. Die Fakultät einer Zahl ist das Produkt aller Zahlen
von 1 bis zu dieser Zahl, Die Summe einer Liste von Zahlen ist die erste Zahl
plus die Summe aller weiteren Zahlen und so weiter. Man drückt das als
Funktionen aus. Man kann ebenfalls keine Variable mit einem Wert initialisieren
und dieser dann später einen anderen Wert zuweisen. Wenn man sagt, dass `a` 5
ist, kann man nicht später sagen, dass es etwas anderes ist, da man ja zuvor
gesagt hat `a` sei 5. Oder sind Sie lügen Sie etwa? Also hat eine Funktion in
funktionalen Sprachen keine Nebeneffekte. Eine Funktion kann ausschließlich
etwas berechnen und als Ergebnis zurückliefern. Das scheint zu Beginn eine
Einschränkung zu sein, hat aber einige nützliche Folgen: Wenn eine Funktion
zweimal mit den gleichen Parametern aufgerufen wird, liefert sie garantiert
beide Male das gleiche Ergebnis. Das nennt man _referenzielle Transparenz_ und
es erlaubt nicht nur dem Compiler über das Verhalten des Programms nachzudenken,
sondern auch abzuleiten (und sogar beweisen), dass ein Programm korrekt ist, um
dann komplexere Funktionen zu bauen, indem man sie aus einfachen Funktionen
zusammensetzt.

Haskell ist _faul_. Das bedeutet, dass wenn es nicht explizit angewiesen wird,
sich anders zu verhalten, es keine Funktion berechnet, solange es nicht
gezwungen wird, ein Ergebnis anzuzeigen. Das passt gut zur Referenziellen
Transparenz und erlaubt einem ein Programm als eine Folge von
**Transformationen auf Daten** zu sehen. Außerdem erlaubt es coole Dinge wie
endlose Datenstrukturen. Sagen wir, du hast eine unveränderliche Liste von
Zahlen `xs = [1,2,3,4,5,6,7,8]` und eine Funktion `doubleMe`, welche jedes
Element mit 2 multipliziert und dann eine neue Liste mit den Ergebnissen
zurückliefert. Wenn wir unsere Liste
