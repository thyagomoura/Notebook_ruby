class Contact < ApplicationRecord
    #associacoes
    belongs_to :kind
    has_many :phones

    #nested 
    accepts_nested_attributes_for :phones, allow_destroy: true

    def as_json(options = {})
        h = super(options)
        h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
        h
    end
    #################testes e estudos######################
    # def author
    #     "Thyagomoura"
    # end

    # def kind_description
    #     self.kind.description
    # raiend

    # def as_json(options = {})
    #     super(
    #         root: true,
    #         method: [:author, :kind_description], 
    #         include: {kind: {only: :description}}
    #     )
    # end

    # def i18n
    #     I18n.default_locale
    # end

    # def birthdate_br
    #     I18n.l(self.birthdate) unless self.birthdate.blank?
    # end
 #ok
    # def to_br
    #     {
    #         name: self.name,  
    #         email: self.email,
    #         birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
    #         kind: {only: :description}
    #     }
    # end
end
