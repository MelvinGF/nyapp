class ConfirmationsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]
    def create
      def create
        @user = User.find_by(email: params[:user][:email].downcase)
    
        if @user.present? && @user.unconfirmed?
          @user.send_confirmation_email!
          ...
        end
      
      end
    
      def edit
       if @user.present? && @user.unconfirmed_or_reconfirming?
    
        if @user.present?
          @user.confirm!
          login @user
          redirect_to root_path, notice: "Your account has been confirmed."
        else
          redirect_to new_confirmation_path, alert: "Invalid token."
        end
       end
      end
    
      def new
        @user = User.new
      end
end
