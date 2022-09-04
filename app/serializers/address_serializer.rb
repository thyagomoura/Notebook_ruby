class AddressSerializer < ActiveModel::Serializer
    attributes :id, :city, :street
end
  
#aqui passamos os valores do model para retornarem no json da require