class TestData
    def get_fake_customer
        @name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
        return @new_customer = {
        'nome' => @name,
        'telefone' => Faker::PhoneNumber.cell_phone,
        'email' => Faker::Internet.free_email(@name),
        'sexo' => ['M','F'].sample,
        'tipo' => ['Prime','Gold','Platinum'].sample,
        'obs' => Faker::Lorem.paragraph
    }
    end
end