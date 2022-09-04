class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthdate
  
  #aqui temos a associação do kind com seu url para especificar no json da req
  belongs_to :kind do
    link(:related) {kind_url(object.kind.id)}
  end

  #aqui temos a especificação da relação entre contact e os associados
  has_many :phones
  has_one :address

  #aqui é realizado a conversao da data para o padrão Iso8601
  def attributes(*args)
    h = super(*args)
    # h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)- PTBR
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end

  #aqui temos a associação do conteact  com seu url para especificar no json da req
  link(:self) {contact_url(object.id)}
  
  #aqui temos o acrescimo de informações no json
  meta do
    {author: "Thyago Moura"}
  end
end
