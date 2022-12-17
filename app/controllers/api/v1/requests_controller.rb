class Api::V1::RequestsController < ApplicationController
    def index
        # 本人のリクエスト一覧取得
        requests = current_api_v1_user.requests
        render json: { status:200 , requests: requests }
    end

end
