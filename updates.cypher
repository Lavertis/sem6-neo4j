// 1. Zmiana adresu e-mail użytkownika o danym id.
MATCH (user:User)
  WHERE id(user) = 2
SET user.email = 'edit-customer2@gmail.com'

// 2. Odjęcie 200 książek o tytule "Hobbit, czyli tam i z powrotem" z magazynu głównego.
MATCH (:Book {title: 'Hobbit, czyli tam i z powrotem'})
        -[availability:IS_AVAILABLE_IN]->
      (:Department {name: 'Magazyn główny'})
SET availability.quantity = availability.quantity - 200

// 3. Usunięcie recenzji książki o danym id.
MATCH ()-[:HAS_REVIEW]->(review:BookReview)
  WHERE id(review) = 68
DETACH DELETE review

// 4. Zmiana numeru mieszkania w adresie dostawy dla zamówienia z danym id.
MATCH (order:Order)-[:DELIVERED_TO]->(address:Address)
  WHERE id(order) = 76
SET address.house_number = 1000

// 5. Usunięcie pola “flat_number” z zamówienia o danym id.
MATCH (address:Address)
  WHERE id(address) = 33
REMOVE address.flat_number

// 6. Dodanie właściwości "alternative_title" do książki.
MATCH (book:Book {title: 'Ania z Zielonego Wzgórza'})
SET book.alternative_title = 'Ania z Zielonych Szczytów'
RETURN book