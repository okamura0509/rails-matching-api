class Api::V1::RequestsController < ApplicationController
    def index
        requests=[]
        # 本人のリクエスト一覧取得
        current_api_v1_user.requests.each do |request|
            chat_rooms << {
                request: request,
                requester: Request.requester_user
            }
        end
        render json: { status:200 , requests: requests }
    end

    def create
        requests = Request.new(request_paramas)
        p requests
        if requests.save
            p requests
            render json: { status:200 , messages: requests }
        else
            p '失敗'
            render json: { status: 500, message: "メッセージの送信に失敗しました。"}
        end
    end

    private

    def request_paramas
        params.permit(:requester_id , :worker_id , :title , :body)
    end

end
