10.times do 
   Board.create (
    name: Faker::Company.name
  )

  4.times do 
    List.create(
      name: Faker::Company.industry
    )

    3.times do 
      Task.create(
      description: Faker::Company.bs
      ) 
    end
  end
end 