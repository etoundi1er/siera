class UserController < ApplicationController
  getter user = User.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_user }
  end

  def index
    users = User.all
    render "index.ecr"
  end

  def show
    render "show.ecr"
  end

  def new
    render "new.ecr"
  end

  def edit
    render "edit.ecr"
  end

  def create
    user = User.new user_params.validate!
    if user.save
      redirect_to action: :index, flash: {"success" => "Created user successfully."}
    else
      flash[:danger] = "Could not create User!"
      render "new.ecr"
    end
  end

  def update
    user.set_attributes user_params.validate!
    if user.save
      redirect_to action: :index, flash: {"success" => "Updated user successfully."}
    else
      flash[:danger] = "Could not update User!"
      render "edit.ecr"
    end
  end

  def destroy
    user.destroy
    redirect_to action: :index, flash: {"success" => "Deleted user successfully."}
  end

  private def user_params
    params.validation do
      required :firstname
      required :lastname
      required :email
      required :age
    end
  end

  private def set_user
    @user = User.find! params[:id]
  end
end
