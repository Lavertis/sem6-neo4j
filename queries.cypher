// 1. Wyświetlenie tytułów i autorów wszystkich książek w kolejności alfabetycznej.
MATCH (book:Book)<-[:IS_AUTHOR]-(author:BookAuthor)
RETURN book.title AS title, author.name AS author
  ORDER BY title, author

// 2. Wyświetlenie łącznej ceny każdego zamówienia rosnąco.
MATCH (order:Order)-[cb:CONTAINS_BOOK]->(book:Book)
RETURN id(order) AS order_id,
       order.order_date AS order_date,
       collect([cb.quantity, cb.purchase_price]) AS quantity_and_price,
       round(sum(cb.quantity * cb.purchase_price), 2) AS total_price
  ORDER BY total_price

// 3. Wyszukanie tytułów wszystkich książek autora "Antoine de Saint-Exupéry", sortując je rosnąco według ceny.
MATCH (book:Book)<-[:IS_AUTHOR]-(author:BookAuthor {name: 'Antoine de Saint-Exupéry'})
RETURN book.title AS tile, author.name AS author, book.price AS price
  ORDER BY book.price

// 4. Wyszukanie tytułów wszystkich książek wydanych przez wydawnictwo "Greg", sortując je malejąco według ilości stron
MATCH (book:Book)-[:PUBLISHED_BY]->(publisher:BookPublisher {name: 'Greg'})
RETURN book.title AS title, book.page_count AS page_count, publisher.name AS publisher
  ORDER BY page_count DESC

// 5. Wyświetlenie tytułów wszystkich książek, w których język wydania jest ten sam co język oryginału.
MATCH (book:Book)-[:IS_IN_LANGUAGE]->(language:BookLanguage),
      (book)-[:WAS_ORIGINALLY_IN_LANGUAGE]->(original_language:BookLanguage {name: language.name})
RETURN book.title AS title, language.name AS language, original_language.name AS original_language

// 6. Wyświetlenie id wszystkich zamówień dokonanych od początku 2013 roku.
MATCH (order:Order)
  WHERE order.order_date > datetime({year: 2013})
RETURN id(order) AS order_id, order.order_date AS order_date

// 7. Wyświetlenie danych (imię i nazwisko) wszystkich pracowników Sklepu w Lublinie.
MATCH (employee:Employee)-[:WORKS_IN]->(department:Department {name: 'Sklep w Lublinie'}),
      (employee)-[:IS_USER]->(user:User)
RETURN user.first_name AS first_name, user.last_name AS last_name, department.name AS department_name

// 8. Wyświetlenie wszystkich użytkowników (imię i nazwisko) o imieniu "Tomasz" lub nazwisku zaczynającym się na "Kowal".
MATCH (user:User)
  WHERE user.first_name = 'Tomasz' OR user.last_name STARTS WITH 'Kowal'
RETURN user.first_name AS first_name, user.last_name AS last_name

// 9. Wyświetlenie wszystkich użytkowników (imię i nazwisko), którzy są klientami.
MATCH (user:User)-[:HAS_ROLE]->(role:Role {code: 'CUSTOMER'})
RETURN user.first_name AS first_name, user.last_name AS last_name, role.name AS role_name

// 10. Wyświetlenie rosnąco ilości wszystkich książek w każdym oddziale.
MATCH (book:Book)-[availability:IS_AVAILABLE_IN]->(department:Department)
RETURN department.name AS department_name, sum(availability.quantity) AS book_count
  ORDER BY book_count

// 11. Wyświetlenie średniej ocen malejąco (zaokrągloną do dwóch miejsc po przecinku) dla każdej książki.
MATCH (book:Book)-[:HAS_REVIEW]->(review:BookReview)
RETURN book.title AS title, collect(review.stars) AS stars, round(avg(review.stars), 2) AS review_avg
  ORDER BY review_avg DESC