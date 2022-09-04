class PhoneSerializer < ActiveModel::Serializer
    attributes :id, :number
end
  #aqui passamos os valores do model para retornarem no json da require