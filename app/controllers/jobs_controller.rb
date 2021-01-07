class JobsController < ApplicationController
  before_action :current, only: [:edit, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_job, only: [:edit, :update, :show, :destroy]

  def index
    @job = Job.all.order("created_at DESC")
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if  @job.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if job.update(job_params) 
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    if job.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def job_params
    params.require(:job).permit(:order_title, :order_detail, :period, :order_price, :category_id, :job_post_code, :prefecture_id, :job_city, :job_house_number, :building_name).merge(user_id: current_user.id)
  end

  def current
    redirect_to(root_url) unless @job.user_id == current_user.id
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
