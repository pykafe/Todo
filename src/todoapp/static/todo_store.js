function TodoStore() {

    var self = this;

    riot.observable(self)

    console.log(' Todo store created');

    self.todos = []

    self.on('todos_please', function(){
        console.log('todos_please has been heard by todo store');
        $.get('/api/todos/', function(data){
            console.log('todos have been retrieved - triggerring todos_available');
            console.log(data);
            self.todos = data.results
            self.trigger('todos_available', self.todos)
        })
    });

    self.on('add_todo', function(new_todo){
        console.log('add_todo has been heard by todo store');
        $.post('/api/todos/', new_todo, function(added_todo){
            console.log('todo has been created');
            console.log(added_todo);
            new_todo.url = added_todo.url
            console.log(self.todos);
            self.trigger('todos_available', self.todos)
        })
    })

    self.on('delete_todo', function(todo){
        console.log('delete_todo has been heard by todo store');
        console.log(todo);
        $.ajax(todo.url, {
            method: 'DELETE',
            success: function(){ 
                console.log('todo has been deleted');
            }
        })
    })

}
