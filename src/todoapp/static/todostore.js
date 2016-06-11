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
            console.log(data)
        self.trigger('todos_changed', self.todos)
        })
    })

    self.on('todo_append', function(newtodo){
        self.todos.push(newtodo)
        self.trigger('todos_changed', self.todos)
    })

    self.on('delete_todo', function(todo_delete){
        console.log(todo_delete)
        $.ajax(todo_delete.url, {
            method: 'DELETE',
            success: function(){
                console.log('fsdfjsdfjsd');
            }

        })

    })

}

