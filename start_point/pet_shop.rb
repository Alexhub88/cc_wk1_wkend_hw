def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,amount)
    pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_of_pets)
  pet_shop[:admin][:pets_sold] += number_of_pets
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed_name)
  pets_of_breed_name = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed_name
     pets_of_breed_name.push(pet)
    end
  end
  return pets_of_breed_name
end

def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, pet)
  pet_shop[:pets].push(pet)
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer, pet)
  if customer[:cash] - pet[:price] >= 0
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)

  if pet == nil
    puts "This pet shop doesn't have a pet by that name!"
    return
  end

  if customer_can_afford_pet(customer, pet)
    remove_pet_by_name(pet_shop, pet[:name])
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
    add_or_remove_cash(pet_shop,pet[:price])
  else
    puts "Insufficient cash to buy this pet!"
  end

end
