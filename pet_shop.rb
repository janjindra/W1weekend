

def pet_shop_name(pet_shop)
    return pet_shop[:name]
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

def increase_pets_sold(pet_shop, number)
  return pet_shop[:admin][:pets_sold] += number
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
  #return pet_shop[:pets].length
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

if (pets_array != nil) && (customer_can_afford_pet(customers_array, pets_array) == true)

    add_pet_to_customer(customers_array, pets_array)
    #return customer_pet_count(customers_array)

    increase_pets_sold(pet_shop_hash, 1)
    #return pets_sold(pet_shop_hash)

    remove_customer_cash(customers_array, pets_array[:price])
    #return customer_cash(customers_array)

    add_or_remove_cash(pet_shop_hash, pets_array[:price])
    #return total_cash(pet_shop_hash)

  end
  # return customer_pet_count(customers_array)
  # return pets_sold(pet_shop_hash)
  # return customer_cash(customers_array)
  # return total_cash(pet_shop_hash)
end
