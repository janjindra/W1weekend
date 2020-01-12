@customers = [
  {
    name: "Alice",
    pets: [],
    cash: 1000
  },
  {
    name: "Bob",
    pets: [],
    cash: 50
  },
  {
    name: "Jack",
    pets: [],
    cash: 100
  }
]

@new_pet = {
  name: "Bors the Younger",
  pet_type: :cat,
  breed: "Cornish Rex",
  price: 100
}

@pet_shop = {
  pets: [
    {
      name: "Sir Percy",
      pet_type: :cat,
      breed: "British Shorthair",
      price: 500
    },
    {
      name: "King Bagdemagus",
      pet_type: :cat,
      breed: "British Shorthair",
      price: 500
    },
    {
      name: "Sir Lancelot",
      pet_type: :dog,
      breed: "Pomsky",
      price: 1000,
    },
    {
      name: "Arthur",
      pet_type: :dog,
      breed: "Husky",
      price: 900,
    },
    {
      name: "Tristan",
      pet_type: :dog,
      breed: "Basset Hound",
      price: 800,
    },
    {
      name: "Merlin",
      pet_type: :cat,
      breed: "Egyptian Mau",
      price: 1500,
    }
  ],
  admin: {
    total_cash: 1000,
    pets_sold: 0,
  },
  name: "Camelot of Pets"
}



def pet_shop_name(pet_shop)
  for pet in pet_shop
    return pet_shop[:name]
  end
end

def total_cash(pet_shop_hash)
return pet_shop_hash[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop_hash, amount)
  return pet_shop_hash[:admin][:total_cash] += amount
end

def pets_sold(pet_shop_hash)
return pet_shop_hash[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
  return pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, type)
count = []
  for pet in pet_shop[:pets]
    if pet[:breed] == type
      count.push(pet[:breed])
      #this will product the same result - we either count number of hashes or number of strings.
    end
  end
  return count
end


def find_pet_by_name(pet_shop_hash, pets_array)
  for pet in pet_shop_hash[:pets]
    if pets_array == pet[:name]
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet_name == pet[:name]
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
  return pet_shop[:pets].length
end


def customer_cash(customers_array)
  for customer in customers_array
    return customers_array[:cash]
  end
end


def remove_customer_cash(customers_array, amount)
  for customer in customers_array
    return (customers_array[:cash] -= amount)
  end
end

def customer_pet_count(customers_array)
 for customer in customers_array
   return customers_array[:pets].length
 end
end

def add_pet_to_customer(customers_array, new_pet_hash)
  for customer in customers_array
    return customers_array[:pets].push(new_pet_hash)
  end
end

def customer_can_afford_pet(customers_array, new_pet_hash)
  for customer in customers_array
    if customers_array[:cash] >= new_pet_hash[:price]
      return true
    end
  end
  return false
end



def sell_pet_to_customer(pet_shop_hash, pets_array, customers_array)

    p find_pet_by_name(pet_shop_hash, pets_array)
  if find_pet_by_name(pet_shop_hash, pets_array) != nil

    p add_pet_to_customer(customers_array, pets_array)
    p customer_pet_count(customers_array)

    increase_pets_sold(pet_shop_hash, 1)
    p pets_sold(pet_shop_hash)

    remove_customer_cash(customers_array, 900)
    p customer_cash(customers_array)

    add_or_remove_cash(pet_shop_hash, 900)
    p total_cash(pet_shop_hash)
  else
    p customer_pet_count(customers_array)
    p pets_sold(pet_shop_hash)
    p customer_cash(customers_array)
    p total_cash(pet_shop_hash)
  end
end

sell_pet_to_customer(@pet_shop, "Arthur", @customers[0])
