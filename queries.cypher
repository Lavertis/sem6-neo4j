// 1. Wyświetlenie tytułów i autorów wszystkich książek w kolejności alfabetycznej.
MATCH (book:Book)<-[:IS_AUTHOR]-(author:BookAuthor)
RETURN book.title AS title, author.name AS author
  ORDER BY title, author

// 2. Wyświetlenie łącznej ceny każdego zamówienia.
MATCH (order:Order)-[cb:CONTAINS_BOOK]->(book:Book)
RETURN order, sum(cb.quantity * cb.purchase_price) AS total_price
  ORDER BY order

// 3. Wyszukanie tytułów wszystkich książek autora "Antoine de Saint-Exupéry", sortując je rosnąco według ceny.
MATCH (book:Book)<-[:IS_AUTHOR]-(author:BookAuthor {name: 'Antoine de Saint-Exupéry'})
RETURN book, author
  ORDER BY book.price ASC

// 4. Wyszukanie tytułów wszystkich książek wydanych przez wydawnictwo "Greg", sortując je malejąco według ilości stron
MATCH (book:Book)-[:PUBLISHED_BY]->(publisher:BookPublisher)
RETURN book.title AS title, book.page_count AS page_count, publisher.name AS publisher
  ORDER BY page_count DESC

// 5. Wyświetlenie tytułów wszystkich książek, w których język wydania jest ten sam co język oryginału.
MATCH (book:Book)-[:IS_IN_LANGUAGE]->(language:BookLanguage),
      (book)-[:WAS_ORIGINALLY_IN_LANGUAGE]->(original_language:BookLanguage)
  WHERE language = original_language
RETURN book.title AS title, language.name AS language, original_language.name AS original_language

// 6. Wyświetlenie id wszystkich zamówień dokonanych od początku 2013 roku.
MATCH (order:Order)
  WHERE order.order_date > datetime({year: 2013})
RETURN id(order) AS id, order.order_date AS order_date

// 7. Wyświetlenie danych (imię i nazwisko) wszystkich pracowników sklepu w Lublinie.
MATCH (employee:Employee)-[:WORKS_IN]->(department:Department),
      (employee)-[:IS_USER]->(user:User),
      (department)-[:LOCATED_AT]->(department_address:Address {city: 'Lublin'})
  WHERE department_address.city = 'Lublin'
RETURN user.first_name + ' ' + user.last_name AS full_name, department.name AS department_name,
       department_address.city AS department_city

// 8. Wyświetlenie wszystkich użytkowników (imię i nazwisko) o imieniu "Tomasz" lub nazwisku zaczynającym się na "Kowal".
MATCH (user:User)
  WHERE user.first_name = 'Tomasz' OR user.last_name STARTS WITH 'Kowal'
RETURN user.first_name AS first_name, user.last_name AS last_name

// 9. Wyświetlenie wszystkich użytkowników (imię i nazwisko), którzy są klientami.
MATCH (user:User)<-[:IS_USER]-(customer:Customer)
RETURN user.first_name AS first_name, user.last_name AS last_name

// 10. Wyświetlenie rosnąco ilości wszystkich książek w każdym oddziale.
MATCH (book:Book)-[availability:IS_AVAILABLE_IN]->(department:Department)
RETURN sum(availability.quantity) AS book_count, department.name AS department_name
  ORDER BY book_count, department.name

// 11. Wyświetlenie średniej ocen malejąco (zaokrągloną do dwóch miejsc po przecinku) dla każdej książki.
MATCH (book:Book)-[:HAS_REVIEW]->(review:BookReview)
RETURN book.title AS TITLE, round(avg(review.stars), 2) AS review_avg
  ORDER BY review_avg DESC