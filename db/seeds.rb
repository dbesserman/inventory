Reference.create(name: 'book')
Reference.create(name: 'apple')
Reference.create(name: 'computer')
Reference.create(name: 'forks')

Movement.create(comming_in: true, quantity: 2,  reference_id: 1)
Item.create(movement_id: 1, booked: false, in_stock: true)
