class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]

  # GET /applications
  # GET /applications.json
  def index
    if current_user
      @applications = Application.where(user_id: current_user.id)
    else
      redirect_to root_path
    end
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    days_to_view = params[:days].present? ? params[:days].to_i : 30

    @application = Application.find(params[:id])
    @events = @application.events

    @pageviews = @events.where(name: "pageview")
    @pageviews_30 = @pageviews.where('created_at > ?', 30.days.ago)
    @pageviews_chart = @pageviews.where('created_at > ?', days_to_view.days.ago).group_by_day(:created_at).count

    @new_users = @events.where(name: "new lead")
    @new_users_30 = @new_users.where('created_at > ?', 30.days.ago)
    @new_users_chart = @new_users.where('created_at > ?', days_to_view.days.ago).group_by_day(:created_at).count

    @sales = @events.where(name: "sale")
    @sales_30 = @sales.where('created_at > ?', 30.days.ago)
    @sales_chart = @sales.where('created_at > ?', days_to_view.days.ago).group_by_day(:created_at).count

  end

  # GET /applications/new
  def new
    @application = Application.new
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)

    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:name, :url, :user_id)
    end


end
