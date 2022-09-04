class ApplicationController < ActionController::API
    #definindo um tipo especifico para a request sendo ele o tipo json, caso contrario erro 406
    before_action :ensure_json_request
    def ensure_json_request
        return if request.headers["Accept"] =~ /json/
        render :nothing => true, :status => 406
    end
end
