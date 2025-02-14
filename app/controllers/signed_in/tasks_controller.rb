class SignedIn::TasksController < SignedInAppController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @task_filter = if params.has_key? :task_filter
                     TaskFilter.new(params[:task_filter])
                   else
                     TaskFilter.new
                   end

    @task_deletion = TaskDeletion.new

    @tasks = current_user.tasks
                 .includes(:category)
                 .includes(:tags)
                 .apply_filter(@task_filter)
                 .order(category_id: :desc)
                 .all

    @categories = current_user.categories.all
    @tags = current_user.tags.all
  end

  def delete_all

  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    set_user_categories
    set_user_tags
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    set_user_categories
    set_user_tags
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  def set_user_categories
    @user_categories = current_user.categories.all
  end

  def set_user_tags
    @user_tags = current_user.tags.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task)
        .permit(:title, :color, :deadline_at, :note, :is_done, :category_id, tag_ids: [])
        .reject { |key, value| key == :tag_ids && value.blank? }
        .merge(user_id: current_user.id)
  end
end
