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
            reader_id: 1
            )

Transaction.create(book_id: 3, buyer_id: 1, seller_id: 2)

puts "All info saved successfully"
