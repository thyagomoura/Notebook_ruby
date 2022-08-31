class Contact < ApplicationRecord
    #associacoes
    belongs_to :kind, optional: true
    has_many :phones

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
    def to_br
        {
            name: self.name,  
            email: self.email,
            birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
        }
    end
end
