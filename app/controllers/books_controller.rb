class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :logged_in
  # GET /books
  # GET /books.json
  def index
    @books = Book.search(params[:search]).paginate(page: params[:page], per_page: 5)
    #@books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end
  
  def rental
    @book = Book.find_by(id: params[:id])
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @book = Book.find_by(id: params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
         # image = params[:thummbnail]
         # File.binwrite("public/book/#{@book.id}.jpg", image.read)
          
    respond_to do |format|
      if @book.save
         #@book.update(avator: "original.png" ,book_image: "original_image.jpg")
          
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def avatar
    @book = Book.find(params[:id])
    send_data(@book.avator, type: @book.avator_content_type, disposition: :inline)
  end
  
  def page_image
    @book = Book.find(params[:id])
    send_data(@book.page_image, type: @book.page_image_type, disposition: :inline)
  end
  
  def update
      @book = Book.find_by(id: params[:id])
      @book.title = params[:title]
      
      
      if params[:book_image]
      @book.avator = params[:book_image].read # <= バイナリをセット
      @book.avator_content_type = params[:book_image].content_type # <= ファイルのタイプを保存(拡張子タイプ)
      end
      
      if params[:page_image]
      @book.page_image = params[:page_image].read
      @book.page_image_type = params[:page_image].content_type
      end 
      
      @book.save
   redirect_to("/books")
     
     #@book = Book.find_by(id: params[:id])
     #@book.update(title: params[:title], thummbnail:"#{@book.id}.jpg", book_image:"#{@book.id}_image.jpg")

          #image = params[:thummbnail]
          #book_image = params[:book_image]
          
          #File.binwrite("app/assets/images/#{@book.id}.jpg", image.read)
          #File.binwrite("app/assets/images/#{@book.id}_image.jpg", book_image.read)
          #File.binwrite("public/book/#{@book.id}_image.jpg", book_image.read)
     
      
  end
  

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
 # def update
    #respond_to do |format|
      #if @book.update(book_params)
       # format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        #format.json { render :show, status: :ok, location: @book }
     # else
        #format.html { render :edit }
        #format.json { render json: @book.errors, status: :unprocessable_entity }
      #end
   # end
  #end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def logged_in
    if @current_user == nil
      redirect_to("/")
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :thummbnail, :content, :book_image)
    end
end
