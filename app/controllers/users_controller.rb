class UsersController < ApplicationController
     
     def new
     end
     
     def index
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
 
end