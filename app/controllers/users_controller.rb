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
     
     def logout
          session[:user_id] = nil
          redirect_to("/")
          
     end
 
end