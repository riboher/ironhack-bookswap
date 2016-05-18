Reader.create(first_name: 'Ricardo',
            last_name: 'Boluda',
            email: 'riboher@gmail.com',
            city: 'Madrid',
            postcode: '28006',
            password: '123456',
            avatar: 'https://robohash.org/profile.png?size=150x150&set=set3')

Reader.create(first_name: 'Jose',
            last_name: 'Perez',
            email: 'josepe@hotmail.com',
            city: 'Madrid',
            postcode: '28004',
            password: '123456',
            avatar: 'https://robohash.org/profile.png?size=150x150&set=set3')

Book.create(title: "El Nino con el Pijama de Rayas (Spanish Edition)",
            author: "Boyne, John",
            publisher: "Publicaciones y Ediciones Salamandra, S.A.",
            year: "2007",
            price: 19,
            isbn: "9788498380798",
            cover: "http://www.directtextbook.com/large/8498380790.jpg",
            description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
            Eum a quod, voluptas doloremque magni inventore error nemo quidem
            optio consectetur ullam, maxime assumenda sapiente numquam mollitia
            autem explicabo nulla quos.",
            is_available: false,
            reader_id: 2)

Book.create(title: "Lucky star las lunas de jupiter",
            author: "Asimov, Isaac",
            publisher: "Editorial Bruguera",
            year: "1977",
            price: 9,
            isbn: "9788402077110",
            cover: "http://bit.ly/1R3HehX",
            description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
            Eum a quod, voluptas doloremque magni inventore error nemo quidem
            optio consectetur ullam, maxime assumenda sapiente numquam mollitia
            autem explicabo nulla quos.",
            reader_id: 1
            )

Book.create(title: "Post Office",
            author: "Bukowski, Charles",
            publisher: "HarperCollins Publishers",
            year: "2014",
            price: 16,
            isbn: "9780061177576",
            cover: "http://www.directtextbook.com/large/0061177571.jpg",
            description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
            Eum a quod, voluptas doloremque magni inventore error nemo quidem
            optio consectetur ullam, maxime assumenda sapiente numquam mollitia
            autem explicabo nulla quos.",
            is_available: false,
            reader_id: 1
            )

Book.create(title: "Los Relatos 4 (Spanish Edition)",
            author: "Cortazar, Julio",
            publisher: "Alianza Editorial, S. A.",
            year: "2014",
            price: 8,
            isbn: "9788420601281",
            cover: "http://www.directtextbook.com/large/8420601284.jpg",
            description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
            Eum a quod, voluptas doloremque magni inventore error nemo quidem
            optio consectetur ullam, maxime assumenda sapiente numquam mollitia
            autem explicabo nulla quos.",
            reader_id: 2
            )

Book.create(title: "La casa de los espíritus",
            author: "Allende, Isabel",
            publisher: "RBA, Barcelona",
            year: "1994",
            price: 12,
            isbn: "9788447306619",
            cover: "http://www.directtextbook.com/large/8447306615.jpg",
            description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
            Eum a quod, voluptas doloremque magni inventore error nemo quidem
            optio consectetur ullam, maxime assumenda sapiente numquam mollitia
            autem explicabo nulla quos.",
            reader_id: 2,
            is_available: false
            )

Book.create(title: "El Guardian Entre el Centeno (Spanish Edition)",
            author: "Salinger, J. D.",
            publisher: "Alianza Editorial, S. A.",
            year: "2001",
            price: 10,
            isbn: "9788420634098",
            cover: "http://www.directtextbook.com/large/8420634093.jpg",
            description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
            Eum a quod, voluptas doloremque magni inventore error nemo quidem
            optio consectetur ullam, maxime assumenda sapiente numquam mollitia
            autem explicabo nulla quos.",
            reader_id: 1
            )

Transaction.create(book_id: 1, buyer_id: 2, seller_id: 1)
Transaction.create(book_id: 3, buyer_id: 1, seller_id: 2)
Transaction.create(book_id: 5, buyer_id: 2, seller_id: 1)

puts "All info saved successfully"
