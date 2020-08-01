class AuthorsController < ApplicationController

  def show
    set_author
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params) #create a new, unsaved not validated Author object from the form.
    if @author.valid? #run validations without saving, true if valid
      @author.save #instructs browser to perform a new request 
      redirect_to author_path(@author)
    else
    render :new
    end
  end

  def edit
    set_author
  end

  def update
    set_author
    @author.update(author_params)
    if @author.valid?
       @author.save
    redirect_to author_path(@author)
    else
    render :edit
    end
  end


  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
