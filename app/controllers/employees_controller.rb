class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]

  # GET /employees
  def index
  @managers  = Employee.managers
  @employees = Employee.staff

  # Filters apply only to employees
  if params[:query].present?
    @employees = @employees.where("name LIKE ? OR employee_id LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
  end

  if params[:status].present?
    @employees = @employees.where(status: params[:status])
  end

  if params[:department_id].present?
    @employees = @employees.where(department_id: params[:department_id])
  end

  sort_column   = params[:sort] || "name"
  sort_direction = params[:direction] || "asc"
  @employees    = @employees.order("#{sort_column} #{sort_direction}")

  @employees = @employees.page(params[:page]).per(10)
  @departments = Department.all
end

  # GET /employees/:id/team
  def team
    @manager   = Employee.find(params[:id])
    @employees = @manager.team_members

    # Filters
    if params[:query].present?
      @employees = @employees.where("name LIKE ? OR employee_id LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    if params[:status].present?
      @employees = @employees.where(status: params[:status])
    end

    if params[:department_id].present?
      @employees = @employees.where(department_id: params[:department_id])
    end

    # Sorting
    sort_column   = params[:sort] || "name"
    sort_direction = params[:direction] || "asc"
    @employees    = @employees.order("#{sort_column} #{sort_direction}")

    # Pagination
    @employees = @employees.page(params[:page]).per(10)

    # For dropdown options
    @departments = Department.all
  end

  # GET /employees/1
  def show; end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit; end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_path, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :email, :employee_id, :status, :age, :department_id, :manager_id)
    end
end
