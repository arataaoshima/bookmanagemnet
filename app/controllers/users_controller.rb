class UsersController < ApplicationController
     
     def new
          
     end
     
     def create
          @user = User.new
          @user.name = params[:name]
          @user.email = params[:email]
          @user.phone = params[:phone]
          @user.address = params[:address]
          @user.password = "child"
          @user.save
          
          redirect_to("/")
     end
     
     def index
          @users = User.all
     end
      
      def edit
           @user = User.find_by(id: params[:id])
      end
      
      def update
            @user = User.find_by(id: params[:id])
            @user.name = params[:name]
            @user.phone = params[:phone]
            @user.email = params[:email]
            @user.admin = params[:admin]
            @user.save
            redirect_to("/users")
      end
    
     def login
          @user = User.find_by(email: params[:email], password: params[:password])
          
          if @user
               session[:user_id] = @user.id
               redirect_to("/books")
               
          else
               redirect_to("/")
          end
     end
     
     def show
          @user = User.find_by(id: params[:id])
     end
     
     def logout
          session[:user_id] = nil
          redirect_to("/")
          
     end
 
end