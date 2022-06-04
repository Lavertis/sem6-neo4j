LOAD CSV WITH HEADERS FROM 'file:///books_insert.csv' AS line
FIELDTERMINATOR ','
MERGE (book:Book {
  title:            line.title,
  page_count:       line.page_count,
  price:            line.price,
  isbn:             line.isbn,
  publication_date: line.publication_date
})<-[:IS_AUTHOR]-(author:BookAuthor {code: line.code, name: line.name})
MERGE (author:BookAuthor {code: line.code, name: line.name})
MERGE (author)-[:IS_AUTHOR]->(book)