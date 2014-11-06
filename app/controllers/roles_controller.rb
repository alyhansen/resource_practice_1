class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
  end

  def new_form
    @role = Role.new
  end

  def create_row
    @role = Role.new
    @role.character_name = params[:character_name]
    @role.movie_id = params[:movie_id]
    @role.actor_id = params[:actor_id]

    if @role.save
      redirect_to "/roles", :notice => "Role created successfully."
    else
      render 'new'
    end
  end

  def edit_form
    @role = Role.find(params[:id])
  end

  def update_row
    @role = Role.find(params[:id])

    @role.character_name = params[:character_name]
    @role.movie_id = params[:movie_id]
    @role.actor_id = params[:actor_id]

    if @role.save
      redirect_to "/roles", :notice => "Role updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @role = Role.find(params[:id])

    @role.destroy

    redirect_to "/roles", :notice => "Role deleted."
  end
end
