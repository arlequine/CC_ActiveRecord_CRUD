class TasksController
  def initialize(args)
    @view = TasksView.new
    run(args)
  end

  def run(args)
      task = args
      task_name = "#{task[1..-1].join(" ")}"
      case task[0]
       when "add" then add(task_name)
       when "index" then index
       when "delete" then delete(task_name)
       when "complete" then complete(task_name)
      end
  end

  def index
    # TIP: Aquí debes de llamar al método del mismo nombre de @view
    all_tasks = Task.all
    @view.index(all_tasks)
  end

  def get_index(num)
    task_name = ""
    list = Task.all
    list.each_with_index do |task, index|
      task.completed = true if index+1 == num.to_i
    end
    task_name
  end

  def get_name(task_name)
    @view.get_name(task_name)
  end
  def add(task_name)
    get_name(task_name)
    Task.create!(name: task_name, completed: false)
    @view.message_save
  end

  def delete(num)
    list = Task.all
    show_task = get_index(num)
    list.each_with_index do |task, index|
      task.destroy if index+1 == num.to_i
    end
    @view.show_name(show_task, 1)
  end

  def complete(num)
    show_task = get_index(num)
    list = Task.all
    list.each_with_index do |task, index|
      task.update(completed: true) if index+1 == num.to_i
    end
    @view.show_name(show_task, 2)
    @view.index(list)
    @view.message_update
  end
end
