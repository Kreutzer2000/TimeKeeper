class EmployeesController < ApplicationController
  before_action :authenticate_user!

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
    @user = @employee.user
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:user_password] = @employee.user.temporary_password if @employee.user.present?
      redirect_to @employee, notice: "Employee was successfully created."
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to @employee, notice: "Employee was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_url, notice: "Employee was successfully destroyed."
  end

  private
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :position, :phone_number, :salary, :birth_date, :email, :address, :start_date, :active)
    end

end
