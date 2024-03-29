class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]
  before_action :require_user
  before_action :require_admin, only: [ :new, :create, :edit , :destroy]

  # GET /companies or /companies.json
  def index
    @companies = Company.all
    @q = Company.ransack(params[:q])
    @companies = @q.result(distinct: true).paginate(page: params[:page], per_page: 5)
  end

  def policy_companies
    @companies = Company.all
    @q = Company.ransack(params[:q])
    @companies = @q.result(distinct: true).paginate(page: params[:page], per_page: 5)
  end

  # GET /companies/1 or /companies/1.json
  def show
    @user_company = current_user.user_companies
    @enable_button_at= @company.created_at + 11.months + 15.days
    # if(params[:controller]=="users" && params[:action]=="user_policies")
    #   @company=params[:id].to_i 
    # elsif(params[:controller]=="companies" && params[:action]=="index")
    #     @company=params[:id].to_i 
    # elsif(params[:controller]=="companies" && params[:action]=="show")
    #   @company=params[:id].to_i 
    # end
   
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to company_url(@company), notice: "Company was successfully created." }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:company_name, :plan_info, :cover, :premium, :policy_id, :pdf, :image)
    end

    def require_admin
      if current_user &&!current_user.admin?
          flash[:alert] = "You are not the authorize user!"
          redirect_to root_path
      end
    end
end
