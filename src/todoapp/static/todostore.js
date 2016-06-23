function TodoStore(){
    riot.observable(this)
    var self = this
    
    self.todos = []

    self.on('todo_init', function(){
          $.get('/api/todos/', function(data){
                self.todos = data.results
          self.trigger('todos_changed', self.todos)
        })
    })

    self.on('todo_add', function(newtodo){
        $.post('/api/todos/', newtodo, function(data){
            socket.send(data['text'])
            self.trigger('todos_changed', self.todos)
        })
    })


     self.on('todo_append', function(newtodo){
        self.todos.push(newtodo)
        self.trigger('todos_changed', self.todos)
    })


    self.on('delete_todo', function(deletetodo){
        $.ajax(deletetodo.url, {
            method: 'DELETE',
            success: function(){
            }

        })

    })

    self.on('edit_save', function(edittodo){
        console.log(edittodo)
        $.ajax(edittodo.url, {
            method: 'PUT',
            data: edittodo,
            success: function(data){ 
                socket.send(data['text'])
                self.trigger('todos_changed', self.todos)
            }
        })
    })

}

