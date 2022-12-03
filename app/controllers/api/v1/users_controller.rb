class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: %i[show update]

    def index
      users = User.all();
      render json: { status: 200, users: users, params: params }
    end

    def show
      render json: { status: 200, user: @user }
    end

    def update
      @user.name = user_params[:name]
      @user.prefecture = user_params[:prefecture]
      @user.profile = user_params[:profile]
      @user.image = user_params[:image] if user_params[:image] != ""

      if @user.save
        render json: { status: 200, user: @user }
      else
        render json: { status: 500, message: "更新に失敗しました" }
      end
    end

    def search
        user_params.to_yaml
        users = User.yield_self{|scope| user_params[:prefecture] != nil ? scope.where(prefecture: user_params[:prefecture]) : scope }.yield_self{|scope| user_params[:name] != nil ? scope.where("name LIKE ?" ,"%#{user_params[:name]}%") : scope}.order("created_at DESC")
        render json: { status: 200, users: users , params: user_params }
    end

    private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.permit(:name, :prefecture, :profile, :image)
      end
end
