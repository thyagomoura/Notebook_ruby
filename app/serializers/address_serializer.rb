class AddressSerializer < ActiveModel::Serializer
    attributes :id, :city, :street

    belongs_to :contact do
        link(:related) {contact_address_url(object.id)}
    end
end
  
#aqui passamos os valores do model para retornarem no json da require