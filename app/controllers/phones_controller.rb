class PhonesController < ApplicationController

    before_action :set_contact

    # GET contacts/1/phones/
    def show
        render json: @contact.phones
    end

    # POST contacts/1/phone/
    def create
        @contact.phones = Phone.new(phone_params)

        if @contact.save
            render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
        else
            render json: @contact.errors, status: :unprocessable_entity
        end
    end

    # PUT contacts/1/phone/
    def update
        phone = Phone.find(params[:id])

        if phone.update(phone_params)
            render json: @contact.phones
        else
            render json: @contact.errors, status: :unprocessable_entity
        end
    end


     # DELETE contacts/1/phones/
    def destroy
        phone = Phone.find(params[:id])
        phones.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
        @contact = Contact.find(params[:contact_id])
    end

    def address_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
