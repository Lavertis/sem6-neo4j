// ============================== Roles ==============================
CREATE (roleEmployee:Role {name: 'employee', description: 'Employee'})
CREATE (roleCustomer:Role {name: 'customer', description: 'Customer'})


// ============================== EmployeeTypes ==============================
CREATE (employeeTypeShopAssistant:EmployeeType {code: 'SHOP_ASSISTANT', description: 'Sprzedawca'})
CREATE (employeeTypeWarehouseman:EmployeeType {code: 'WAREHOUSEMAN', description: 'Magazynier'})
CREATE (employeeTypeManager:EmployeeType {code: 'MANAGER', name: 'kierownik'})


// ============================== Employees ==============================
// Employee 1
CREATE (employee1:User {
  email:        'employee1@gmail.com',
  password:     'pass1',
  phone_number: '111111111',
  first_name:   'Agata',
  last_name:    'Małysz'
})
CREATE (employee1)-[:HAS_ROLE]->(roleEmployee)-[:HAS_USER]->(employee1)
CREATE (employee1)-[:HAS_TYPE]->(employeeTypeShopAssistant)-[:HAS_EMPLOYEE]->(employee1)

// Employee 2
CREATE (employee2:User {
  email:        'employee2@gmail.com',
  password:     'pass2',
  phone_number: '222222222',
  first_name:   'Tomasz',
  last_name:    'Kowalski'
})
CREATE (employee2)-[:HAS_ROLE]->(roleEmployee)-[:HAS_USER]->(employee2)
CREATE (employee2)-[:HAS_TYPE]->(employeeTypeShopAssistant)-[:HAS_EMPLOYEE]->(employee2)

// Employee 3
CREATE (employee3:User {
  email:        'employee3@gmail.com',
  password:     'pass3',
  phone_number: '333333333',
  first_name:   'Tomasz',
  last_name:    'Wójcik'
})
CREATE (employee3)-[:HAS_ROLE]->(roleEmployee)-[:HAS_USER]->(employee3)
CREATE (employee3)-[:HAS_TYPE]->(employeeTypeShopAssistant)-[:HAS_EMPLOYEE]->(employee3)

// Employee 4
CREATE (employee4:User {
  email:        'employee4@gmail.com',
  password:     'pass4',
  phone_number: '444444444',
  first_name:   'Roman',
  last_name:    'Małysz'
})
CREATE (employee4)-[:HAS_ROLE]->(roleEmployee)-[:HAS_USER]->(employee4)
CREATE (employee4)-[:HAS_TYPE]->(employeeTypeWarehouseman)-[:HAS_EMPLOYEE]->(employee4)

// Employee 5
CREATE (employee5:User {
  email:        'employee5@gmail.com',
  password:     'pass5',
  phone_number: '555555555',
  first_name:   'Stefania',
  last_name:    'Przetak'
})
CREATE (employee5)-[:HAS_ROLE]->(roleEmployee)-[:HAS_USER]->(employee5)
CREATE (employee5)-[:HAS_TYPE]->(employeeTypeWarehouseman)-[:HAS_EMPLOYEE]->(employee5)


// ============================== Countries ==============================
CREATE (countryPoland:Country {
  name: 'Polska',
  code: 'PL'
})

CREATE (countryGermany:Country {
  name: 'Niemcy',
  code: 'DE'
})

CREATE (countryFrance:Country {
  name: 'Francja',
  code: 'FR'
})

CREATE (countrySpain:Country {
  name: 'Hiszpania',
  code: 'ES'
})

CREATE (countryItaly:Country {
  name: 'Włochy',
  code: 'IT'
})


// ============================== DepartmentTypes ==============================
CREATE (departmentType1:DepartmentType {name: 'SKLEP'})
CREATE (departmentType2:DepartmentType {name: 'MAGAZYN'})


// ============================== Departments ==============================
// Department 1
CREATE (departmentWarehouse1:Department {
  name: 'Magazyn główny'
})
CREATE (departmentWarehouse1)-[:HAS_TYPE]->(departmentType2)-[:HAS_DEPARTMENT]->(departmentWarehouse1)
CREATE (employee1)-[:WORKS_IN]->(departmentWarehouse1)-[:HAS_EMPLOYEE]->(employee1)
CREATE (employee2)-[:WORKS_IN]->(departmentWarehouse1)-[:HAS_EMPLOYEE]->(employee2)
CREATE (department1Address:Address {
  street:       'Daszyńskiego',
  house_number: '11',
  postcode:     '10-333',
  city:         'Warszawa'
})-[:IS_IN]->(countryPoland)
CREATE (departmentWarehouse1)-[:HAS_ADDRESS]->(department1Address)-[:HAS_DEPARTMENT]->(departmentWarehouse1)

// Department 2
CREATE (departmentWarehouse2:Department {
  name: 'Magazyn zapasowy'
})
CREATE (departmentWarehouse2)-[:HAS_TYPE]->(departmentType2)-[:HAS_DEPARTMENT]->(departmentWarehouse2)
CREATE (department2Address:Address {
  street:       'Poturzyńska',
  house_number: '22',
  postcode:     '20-333',
  city:         'Lublin'
})-[:IS_IN]->(countryPoland)
CREATE (departmentWarehouse2)-[:HAS_ADDRESS]->(department2Address)-[:HAS_DEPARTMENT]->(departmentWarehouse2)

// Department 3
CREATE (departmentShop3:Department {
  name: 'Sklep w Lublinie'
})
CREATE (departmentShop3)-[:HAS_TYPE]->(departmentType1)-[:HAS_DEPARTMENT]->(departmentShop3)
CREATE (employee3)-[:WORKS_IN]->(departmentShop3)-[:HAS_EMPLOYEE]->(employee3)
CREATE (employee4)-[:WORKS_IN]->(departmentShop3)-[:HAS_EMPLOYEE]->(employee4)
CREATE (department3Address:Address {
  street:       'Nałęczowska',
  house_number: '3',
  postcode:     '15-221',
  city:         'Lublin'
})-[:IS_IN]->(countryPoland)
CREATE (departmentShop3)-[:HAS_ADDRESS]->(department3Address)-[:HAS_DEPARTMENT]->(departmentShop3)


// Department 4
CREATE (departmentShop4:Department {
  name: 'Sklep w Warszawie'
})
CREATE (departmentShop4)-[:HAS_TYPE]->(departmentType1)-[:HAS_DEPARTMENT]->(departmentShop4)
CREATE (employee5)-[:WORKS_IN]->(departmentShop4)-[:HAS_EMPLOYEE]->(employee5)
CREATE (department4Address:Address {
  street:       'Złota',
  house_number: '12',
  postcode:     '01-985',
  city:         'Warszawa'
})-[:IS_IN]->(countryPoland)
CREATE (departmentShop4)-[:HAS_ADDRESS]->(department4Address)-[:HAS_DEPARTMENT]->(departmentShop4)

// Department 5
CREATE (departmentShop5:Department {
  name: 'Sklep w Nowym Sączu'
})
CREATE (departmentShop5)-[:HAS_TYPE]->(departmentType1)-[:HAS_DEPARTMENT]->(departmentShop5)
CREATE (department5Address:Address {
  street:       'Zbożowa',
  house_number: '56',
  postcode:     '01-958',
  city:         'Nowy Sącz'
})-[:IS_IN]->(countryPoland)
CREATE (departmentShop5)-[:HAS_ADDRESS]->(department5Address)-[:HAS_DEPARTMENT]->(departmentShop5)


// ============================== Customers ==============================
CREATE (customer1:User {
  email:        'customer1@gmail.com',
  password:     'pass1',
  phone_number: '666666666',
  first_name:   'Karol',
  last_name:    'Martyniuk'
})
CREATE (customer1)-[:HAS_ROLE]->(roleCustomer)-[:HAS_USER]->(customer1)

CREATE (customer2:User {
  email:        'customer2@gmail.com',
  password:     'pass2',
  phone_number: '777777777',
  first_name:   'Agata',
  last_name:    'Fiołek'
})
CREATE (customer2)-[:HAS_ROLE]->(roleCustomer)-[:HAS_USER]->(customer2)

CREATE (customer3:User {
  email:        'customer3@gmail.com',
  password:     'pass3',
  phone_number: '888888888',
  first_name:   'Stefan',
  last_name:    'Karol'
})
CREATE (customer3)-[:HAS_ROLE]->(roleCustomer)-[:HAS_USER]->(customer3)

CREATE (customer4:User {
  email:        'customer4@gmail.com',
  password:     'pass4',
  phone_number: '999999999',
  first_name:   'Marcin',
  last_name:    'Januszewski'
})
CREATE (customer4)-[:HAS_ROLE]->(roleCustomer)-[:HAS_USER]->(customer4)

CREATE (customer5:User {
  email:        'customer5@gmail.com',
  password:     'pass5',
  phone_number: '101010101',
  first_name:   'Alicja',
  last_name:    'Kowalska'
})
CREATE (customer5)-[:HAS_ROLE]->(roleCustomer)-[:HAS_USER]->(customer5)


// ============================== BookReviews ==============================
// BookReview 1
CREATE (bookReview1:BookReview {
  title:   'BARDZO POLECAM!!!',
  content: 'PIĘKNA książka która zachwyciła tysiące dziewcząt na całym świecie, w tym i mnie.Ciekawa, opisująca losy małej dziewczynki z sierocińca , która przez przypadek trafia na Zielone Wzgórze.',
  stars:   5
})
CREATE (bookReview1)-[:HAS_AUTHOR]->(customer1)-[:HAS_REVIEW]->(bookReview1)

// BookReview 2
CREATE (bookReview2:BookReview {
  title:   'Bardzo ciekawa',
  content: 'Bardzo ciekawa książka (lektura). Opowiada o dziewczynce która trafiła przez pomyłke do starszego rodzeństwa. Warto przeczytać.',
  stars:   4
})
CREATE (bookReview2)-[:HAS_AUTHOR]->(customer2)-[:HAS_REVIEW]->(bookReview2)

// BookReview 3
CREATE (bookReview3:BookReview {
  title:   'Kiepskie tłumaczenie',
  content: 'Zdecydowanie polecam bardziej tłumaczenie p. Skibniewskiej niż to użyte w tym wydaniu, czyli p. Braiter. W wydaniu Zysk i S-ka na mapie świata pojawiło się kilka błędów rzeczowych i związanych z odmianą oraz kilka literówek w samym tekście. Do tego niektóre użyte sformułowania aż kłują w oczy - "najdrożssssszy" zamiast sskarbie, "ziomkowie" zamiast rodu, czy wojowników, "drzazgi" zamiast pochodni" oraz moje ulubione "gruba beka" zamiast "stare pajęczysko". Momentami naprawdę źle się to czyta. Całość w dużym stopniu ratuje przepiękna wręcz oprawa wizualna. Mimo to, wygląda to trochę jakby nad wydaniem czuwał ktoś, kto nie ma pojęcia o świecie Tolkiena. Skontaktowałem się już w sprawie poprawek błędów z wydawnictwem, jednak od kilku dni przestali mi odpowiadać. Szkoda.',
  stars:   1
})
CREATE (bookReview3)-[:HAS_AUTHOR]->(customer3)-[:HAS_REVIEW]->(bookReview3)

// BookReview 4
CREATE (bookReview4:BookReview {
  title:   'Książka J.R.R. Tolkiena',
  content: 'Książka J.R.R. Tolkiena pt. "Hobbit, czyli tam i z powrotem" jest lekturą fantastyczną, przygodową. Przyjemnie i szybko się ją czyta. Głównym bohaterem jest mały Hobbit - Bilbo Baggins. Wiedzie spokojne życie w swojej chatce pod Pagurkiem. Pewnego dnia jego świat odwraca się do góry nogami. Niespodziewanie w jego domu pojawia się gromadka Krasnoludów oraz czarodziej Gandalf. Chcą, aby udał się z nimi w podróż w celu zabicia smoka oraz odzyskania Góry i skarbów Durina. Bilbo zgadza się na wyprawę, nie wiedząc jeszcze jak naprawdę niebezpieczna okaże się ta przygoda.\n\n"Ciemne sprawy najlepiej załatwiać po ciemku."',
  stars:   3
})
CREATE (bookReview4)-[:HAS_AUTHOR]->(customer4)-[:HAS_REVIEW]->(bookReview4)

// BookReview 5
CREATE (bookReview5:BookReview {
  title:   'Cudowne',
  content: 'Kto z nas nie zna tej historii? Piękna opowieść z cudnymi ilustracjami. To wydanie jest wprost niesamowite, a moja córka nie może sie od niego oderwać.',
  stars:   5
})
CREATE (bookReview5)-[:HAS_AUTHOR]->(customer3)-[:HAS_REVIEW]->(bookReview5)

// BookReview 6
CREATE (bookReview6:BookReview {
  title:   'Polecam',
  content: 'Polecam, dobre opracowanie, bardzo pomocne w szkole przy omawianiu lektury.',
  stars:   4
})
CREATE (bookReview6)-[:HAS_AUTHOR]->(customer4)-[:HAS_REVIEW]->(bookReview6)

// BookReview 7
CREATE (bookReview7:BookReview {
  title:   'Moja ulubiona książka',
  content: 'To książka, która na zawsze pozostaje w pamięci, o ile da się jej „oswoić”. To alegoria samotności, miłości, która przekazuje ponadczasowe treści. Czy jest ktoś, kto nie zna sentencji, że dobrze widzi się tylko sercem…? To klasyka, którą można codziennie odkrywać od nowa. Choć jej forma nie przemówi do wszystkich, to jednak dla tych, którzy przeczytają ją sercem, pozwoli spojrzeć na współczesny świat w innej perspektywy. Jest ona pełna emocji, wskazuje na miłość i przyjaźń, na wartości, które tak łatwo zatracić, a bez których nie ma prawdziwego życia. Życia, które jest pełne szczęścia i może być przezywane w pełni.',
  stars:   5
})
CREATE (bookReview7)-[:HAS_AUTHOR]->(customer5)-[:HAS_REVIEW]->(bookReview7)

// BookReview 8
CREATE (bookReview8:BookReview {
  title:   'À partir de là',
  content: "À partir de là, vous n'aurez plus qu'une seule interrogation: savoir d'où vient cet étrange petit bonhomme et connaître son histoire.",
  stars:   4
})
CREATE (bookReview8)-[:HAS_AUTHOR]->(customer3)-[:HAS_REVIEW]->(bookReview8)

// BookReview 9
CREATE (bookReview9:BookReview {
  title:   'Imaginez-vous',
  content: "Imaginez-vous perdu dans le désert, loin de tout lieu habité, et face à un petit garçon tout blond, surgi de nulle part. Si de surcroît ce petit garçon vous demande avec insistance de dessiner un mouton, vous voilà plus qu'étonné !",
  stars:   4
})
CREATE (bookReview9)-[:HAS_AUTHOR]->(customer4)-[:HAS_REVIEW]->(bookReview9)

// BookReview 10
CREATE (bookReview10:BookReview {
  title:   'Wybrakowane',
  content: 'Kupiłem synowi i brakuje części rozdziału 3 i całego czwartego, musiałem ratować się dostępną w sieci darmową wersją elektroniczną.',
  stars:   1
})
CREATE (bookReview10)-[:HAS_AUTHOR]->(customer1)-[:HAS_REVIEW]->(bookReview10)

// BookReview 11
CREATE (bookReview11:BookReview {
  title:   'Ciężko się czyta',
  content: 'Bardzo mała czcionka...',
  stars:   2
})
CREATE (bookReview11)-[:HAS_AUTHOR]->(customer2)-[:HAS_REVIEW]->(bookReview11)

// BookReview 12
CREATE (bookReview12:BookReview {
  title:   'No nie',
  content: 'Długa, nużąca, ciężko się czyta.',
  stars:   1
})
CREATE (bookReview12)-[:HAS_AUTHOR]->(customer3)-[:HAS_REVIEW]->(bookReview12)


// ============================== BookAuthors ==============================
CREATE (bookAuthor1:BookAuthor {name: 'Lucy Maud Montgomery'})
CREATE (bookAuthor2:BookAuthor {name: 'J. R. R. Tolkien'})
CREATE (bookAuthor3:BookAuthor {name: 'Antoine de Saint-Exupéry'})
CREATE (bookAuthor4:BookAuthor {name: 'Henryk Sienkiewicz'})


// ============================== Books ==============================
// Book 1
CREATE (book1:Book {
  title:               'Ania z Zielonego Wzgórza',
  publisher:           'Greg',
  language:            'polski',
  original_language:   'angielski',
  pages:               352,
  release_date:        datetime('2021-01-01T00:00:00.000+00:00'),
  year_of_publication: datetime('2021-01-01T00:00:00.000+00:00'),
  isbn:                '9788375174717',
  price:               13.26
})
CREATE (book1)-[:HAS_AUTHOR]->(bookAuthor1)-[:IS_AUTHOR]->(book1)
CREATE (book1)-[:HAS_REVIEW]->(bookReview1)
CREATE (book1)-[:HAS_REVIEW]->(bookReview2)

// Book 2
CREATE (book2:Book {
  title:               'Hobbit czyli tam i z powrotem',
  publisher:           'Iskry',
  language:            'polski',
  original_language:   'angielski',
  pages:               320,
  release_date:        datetime('2012-01-01T00:00:00.000+00:00'),
  year_of_publication: datetime('2014-01-01T00:00:00.000+00:00'),
  isbn:                '9788324403875',
  price:               36.46
})
CREATE (book2)-[:HAS_AUTHOR]->(bookAuthor2)-[:IS_AUTHOR]->(book2)
CREATE (book2)-[:HAS_REVIEW]->(bookReview3)
CREATE (book2)-[:HAS_REVIEW]->(bookReview4)

// Book 3
CREATE (book3:Book {
  title:               'Mały Książę',
  publisher:           'Greg',
  language:            'polski',
  original_language:   'francuski',
  pages:               84,
  release_date:        datetime('2013-01-01T00:00:00.000+00:00'),
  year_of_publication: datetime('2021-01-01T00:00:00.000+00:00'),
  isbn:                '9788375178548',
  price:               12
})
CREATE (book3)-[:HAS_AUTHOR]->(bookAuthor3)-[:IS_AUTHOR]->(book3)
CREATE (book3)-[:HAS_REVIEW]->(bookReview5)
CREATE (book3)-[:HAS_REVIEW]->(bookReview6)
CREATE (book3)-[:HAS_REVIEW]->(bookReview7)

// Book 4
CREATE (book4:Book {
  title:               'Le Petit Prince',
  publisher:           'Denoel',
  language:            'francuski',
  original_language:   'francuski',
  pages:               103,
  release_date:        datetime('2008-01-01T00:00:00.000+00:00'),
  year_of_publication: datetime('2008-01-01T00:00:00.000+00:00'),
  isbn:                '9782070408504',
  price:               44.8
})
CREATE (book4)-[:HAS_AUTHOR]->(bookAuthor3)-[:IS_AUTHOR]->(book4)
CREATE (book4)-[:HAS_REVIEW]->(bookReview8)
CREATE (book4)-[:HAS_REVIEW]->(bookReview9)

// Book 5
CREATE (book5:Book {
  title:               'Krzyżacy',
  publisher:           'Greg',
  language:            'polski',
  original_language:   'polski',
  pages:               600,
  release_date:        datetime('2001-01-01T00:00:00.000+00:00'),
  year_of_publication: datetime('2020-01-01T00:00:00.000+00:00'),
  isbn:                '68839758',
  price:               70.45
})
CREATE (book5)-[:HAS_AUTHOR]->(bookAuthor4)-[:IS_AUTHOR]->(book5)
CREATE (book5)-[:HAS_REVIEW]->(bookReview10)
CREATE (book5)-[:HAS_REVIEW]->(bookReview11)
CREATE (book5)-[:HAS_REVIEW]->(bookReview12)


// ============================== Book availability in departments ==============================
// Department 1
CREATE (departmentWarehouse1)-[:HAS_BOOK {quantity: 4589}]->(book1)
CREATE (departmentWarehouse1)-[:HAS_BOOK {quantity: 2156}]->(book2)
CREATE (departmentWarehouse1)-[:HAS_BOOK {quantity: 1549}]->(book3)
CREATE (departmentWarehouse1)-[:HAS_BOOK {quantity: 1423}]->(book4)
CREATE (departmentWarehouse1)-[:HAS_BOOK {quantity: 3569}]->(book5)

// Department 2
CREATE (departmentWarehouse2)-[:HAS_BOOK {quantity: 500}]->(book2)
CREATE (departmentWarehouse2)-[:HAS_BOOK {quantity: 784}]->(book3)
CREATE (departmentWarehouse2)-[:HAS_BOOK {quantity: 100}]->(book4)
CREATE (departmentWarehouse2)-[:HAS_BOOK {quantity: 471}]->(book5)

// Department 3
CREATE (departmentShop3)-[:HAS_BOOK {quantity: 41}]->(book1)
CREATE (departmentShop3)-[:HAS_BOOK {quantity: 21}]->(book2)
CREATE (departmentShop3)-[:HAS_BOOK {quantity: 10}]->(book3)
CREATE (departmentShop3)-[:HAS_BOOK {quantity: 4}]->(book4)

// Department 4
CREATE (departmentShop4)-[:HAS_BOOK {quantity: 58}]->(book1)
CREATE (departmentShop4)-[:HAS_BOOK {quantity: 71}]->(book2)
CREATE (departmentShop4)-[:HAS_BOOK {quantity: 85}]->(book4)
CREATE (departmentShop4)-[:HAS_BOOK {quantity: 19}]->(book5)

// Department 5
CREATE (departmentShop5)-[:HAS_BOOK {quantity: 12}]->(book1)
CREATE (departmentShop5)-[:HAS_BOOK {quantity: 3}]->(book2)
CREATE (departmentShop5)-[:HAS_BOOK {quantity: 24}]->(book3)
CREATE (departmentShop5)-[:HAS_BOOK {quantity: 15}]->(book4)
CREATE (departmentShop5)-[:HAS_BOOK {quantity: 1}]->(book5)


// ============================== OrderStatuses ==============================
CREATE (orderStatusBeingPacked:OrderStatus {code: 'BEING_PACKED', description: 'W trakcie pakowania'})
CREATE (orderStatusInTransport:OrderStatus {code: 'IN_TRANSPORT', description: 'W transporcie'})
CREATE (orderStatusSent:OrderStatus {code: 'SENT', name: 'Zamówienie wysłane'})
CREATE (orderStatusDelivered:OrderStatus {code: 'DELIVERED', description: 'Dostarczone'})
CREATE (orderStatusCancelled:OrderStatus {code: 'CANCELLED', description: 'Anulowane'})


// ============================== OrderTypes ==============================
CREATE (orderTypeOnlineStore:OrderType {code: 'ONLINE_STORE', description: 'Zamówienie internetowe'})
CREATE (orderTypeLocalStore:OrderType {code: 'LOCAL_STORE', description: 'Zamówienie stacjonarne'})


// ============================== Orders ==============================
// Order 1
CREATE (order1:Order {order_date: datetime('2011-11-05T11:29:36.000+00:00')})
CREATE (order1)-[:HAS_STATUS]->(orderStatusDelivered)
CREATE (order1)-[:HAS_TYPE]->(orderTypeOnlineStore)
CREATE (order1)-[:DELIVERY_ADDRESS]->(:Address {
  street:       'Lublińskiego Mariana',
  house_number: '6',
  flat_number:  '17',
  postcode:     '12-546',
  city:         'Warszawa'
})-[:IS_IN]->(countryPoland)
CREATE (order1)-[:SENT_FROM]->(departmentWarehouse1)
CREATE (order1)-[:ORDERED_BY]->(customer1)-[:ORDERED]->(order1)

// Order 2
CREATE (order2:Order {order_date: datetime('2012-11-05T12:29:36.000+00:00')})
CREATE (order2)-[:HAS_STATUS]->(orderStatusInTransport)
CREATE (order2)-[:HAS_TYPE]->(orderTypeOnlineStore)
CREATE (order2)-[:DELIVERY_ADDRESS]->(:Address {
  street:       'Impasse du Dahomey',
  house_number: '2',
  flat_number:  '251',
  postcode:     '56764',
  city:         'Saint-Denis'
})-[:IS_IN]->(countryFrance)
CREATE (order2)-[:SENT_FROM]->(departmentWarehouse1)
CREATE (order2)-[:ORDERED_BY]->(customer1)-[:ORDERED]->(order2)

// Order 3
CREATE (order3:Order {order_date: datetime('2013-11-05T13:29:36.000+00:00')})
CREATE (order3)-[:HAS_STATUS]->(orderStatusBeingPacked)
CREATE (order3)-[:HAS_TYPE]->(orderTypeOnlineStore)
CREATE (order3)-[:DELIVERY_ADDRESS]->(:Address {
  street:       'Borgo Galli',
  house_number: '8',
  flat_number:  '142',
  postcode:     '77352',
  city:         'San Giacinta sardo'
})-[:IS_IN]->(countryItaly)
CREATE (order3)-[:SENT_FROM]->(departmentWarehouse1)
CREATE (order3)-[:ORDERED_BY]->(customer2)-[:ORDERED]->(order3)

// Order 4
CREATE (order4:Order {order_date: datetime('2014-11-05T14:29:36.000+00:00')})
CREATE (order4)-[:HAS_STATUS]->(orderStatusCancelled)
CREATE (order4)-[:HAS_TYPE]->(orderTypeOnlineStore)
CREATE (order3)-[:DELIVERY_ADDRESS]->(:Address {
  street:       '3 maja',
  house_number: '2',
  flat_number:  '251',
  postcode:     '20-653',
  city:         'Lublin'
})-[:IS_IN]->(countryPoland)
CREATE (order3)-[:SENT_FROM]->(departmentWarehouse2)
CREATE (order4)-[:ORDERED_BY]->(customer3)-[:ORDERED]->(order4)

// Order 5
CREATE (order5:Order {order_date: datetime('2015-11-05T15:29:36.000+00:00')})
CREATE (order5)-[:HAS_STATUS]->(orderStatusDelivered)
CREATE (order5)-[:HAS_TYPE]->(orderTypeLocalStore)
CREATE (order5)-[:PICKED_UP_IN]->(departmentShop4)