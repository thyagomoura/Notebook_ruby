class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthdate

  belongs_to :kind do
    link(:related) {kind_url(object.kind.id)}
  end

  has_many :phones
  has_one :address

  def attributes(*args)
    h = super(*args)
    # h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)- PTBR
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end

  link(:self) {contact_url(object.id)}
  
  meta do
    {author: "Thyago Moura"}
  end
end
