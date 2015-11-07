class TasksView
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario

	def index(all_tasks)
      all_tasks.each_with_index do |task, index|
          if task.completed == true
            char_x = "X"
          else
            char_x = " "
          end
        puts "#{index+1}, [#{char_x}] #{task.name}"
      end
	end

  def get_name(name)
    puts "agregaste #{name} a tu lista de tareas"
  end

  def message_save
  puts "la tarea ah sido guardada"
  end

  def delete
    puts "esta tarea ah sido borrada"
  end

  def show_name(name, num_task)
    if num_task == 1
      puts "eliminaste la tarea #{name} de la lista"
    else
      puts "completaste la tarea #{name}."
    end
  end

  def message_update
    puts "tu tarea ha sido borrada"
  end

	def error
	end
end
