class BooksController < ApplicationController
    #"successfully"の表示処理用変数
    #destroy処理でtrue
    #createまたはupdateでtrue
    @@pre_judge = false

    def top
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        @@pre_judge = true
        redirect_to books_path #indexへ
    end

    def create
        @book = Book.new(book_params)
        if @book.save then
            #バリデーションチェックを通過した場合、通常処理
            @@pre_judge = true
            redirect_to book_path(@book) #showへ
        else
            #バリデーションチェック不通過の場合
            @books = Book.all
            @judge = true
            render action: :index
        end
    end

    def index
        if @@pre_judge then
            @judge = false
            @@pre_judge = false
        else
            @judge = true
        end
        @books = Book.all
        @book = Book.new
    end

    def show
        #"successfully"の表示処理
        if @@pre_judge then
            @judge = false
            @@pre_judge = false
        else
            #通常は@judge = trueにしたい
            @judge = true
        end
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params) then
            @@pre_judge = true
            redirect_to book_path(@book)
        else
            render action: :edit
        end
    end

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
