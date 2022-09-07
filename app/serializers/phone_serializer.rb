class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :number

  belongs_to :contact do
      link(:related) {contact_phones_url(object.contact.id)}
  end
end
  #aqui passamos os valores do model para retornarem no json da require