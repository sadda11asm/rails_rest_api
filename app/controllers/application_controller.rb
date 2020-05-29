class ApplicationController < ActionController::API
    before_action :authenticate_request
        attr_reader :current_user

        private

        def authenticate_request
            @current_user = AuthorizeApiRequest.call(request.headers).result
            if @current_user
                @token = request.headers['Authorization'].split(' ').last
            end
            render json: { error: 'Not Authorized' }, status: 401 unless @current_user
        end
end
